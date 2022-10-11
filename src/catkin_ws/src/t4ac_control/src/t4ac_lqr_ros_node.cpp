//Generic libraries.
#include "math.h"
#include "tf/tf.h"
#include "iostream"
#include "vector"
#include <bits/stdc++.h>
//ROS libraries.
#include "ros/ros.h"
#include "std_msgs/Bool.h"
#include "nav_msgs/Path.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/PoseStamped.h"
#include "t4ac_msgs/CarControl.h"
#include "t4ac_msgs/Path.h"
#include "geometry_msgs/Point.h"
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include "std_msgs/Float64.h"


#define  PI 3.1416
#define  n_max	500				//Max. spline sections.
#define  N_RET_VEL_MAX 20		//MAX N_RET_VEL

int min_dist,N_max,real;		
double rc_max;
double rc_min;
double v_max;
int n_ret_vel;
double sample_time;
double q11,q22,r11; 

//QUEDA IMPLEMTAR LAMDA Y SPEED MODE


std::vector <double> arrayRc;
std::vector <double> arrayVel;
double x_fin, y_fin;
double coefs[n_max][8];
double x_fin_prev=0, y_fin_prev=0, u=0.5, u_ant = 0.5, pose_d[3];
double actualPose[3];
double external_speed=v_max;
//(RODRIGO)
double v=0, ro=0, rc = 0, ro_ans=0;
double dist_location=1.2, dist_wheels=1.462;    
double max_steer_angle= 1.0472;  
double A[4],B[2],Q[4],R,Kr[2];
//Delay compensation variables
double buffer_vel[2][N_RET_VEL_MAX];
double evol_vel[2][N_RET_VEL_MAX]; //fila 1 v, fila 2 ro //RODRIGO

int n_tramo = 0, cambia_tramo=0, n_tramos = 0;
int init=0, init_odom=0;

bool stop=true;
bool run_start=false;
bool overtake=false;

float offset = 0;

ros::Publisher spline_pub;
ros::Publisher cmd_vel_pub;
ros::Publisher spline_points_pub;
ros::Publisher reference_pose_pub;
ros::Publisher predicted_pose_pub;
ros::Publisher speed_ego_pub;
ros::Publisher speed_pub;
ros::Publisher steer_pub;
ros::Publisher de_pub;
ros::Publisher oe_pub;
ros::Publisher rc_pub;
ros::Publisher tactical_pub;


nav_msgs::Odometry actualOdom;
std_msgs::Float64 external_speed_msg;

geometry_msgs::PoseStamped reference_pose;
geometry_msgs::PoseStamped pose_future;
t4ac_msgs::CarControl cmd_vel_msg;
std_msgs::Float64 speed_msg;
std_msgs::Float64 steer_msg;
std_msgs::Float64 de_msg;
std_msgs::Float64 oe_msg;
std_msgs::Float64 rc_msg;
std_msgs::Bool stop_msg;
std_msgs::Bool run_start_msg;



void n_spline(double *x, double *y, double *o, double nu, int m);
void calcula_consigna(double actualPose[3],double coefs[n_max][8],int n_tramo); 
float sol_ecuacion(float coef[6], float x);
double Limitang(double ang);
void Dlqr(double K[2], double A[4], double B[2], double Q[4], double R);
void Multiplicar(double *origen1, double *origen2, long x, long y, long z, double *destino);
void mult_esc_mat(double esc, double *mat, int n, double *destino);
void suma_ident(double *mat, int n);
void Inversa2(double *origen, double *destino);
void Traspuesta2(double *origen, double *destino);
void Sumar(double *origen1, double *origen2, int nf, int nc, double *destino);
void Consigna_ro(double de, double oe, double Kr[2], double *ro);//RODRIGO
void velGeneration ();

//**************************Spline publisher************************************************//

void trajectoryCallback(const boost::shared_ptr<t4ac_msgs::Path const>& msg) 
{
	int m=msg->waypoints.size(), j=1; 
	int n_puntos=0;
	double dist;
	double x[m], y[m], o[2];  //m será el número máximo de puntos si los cogiéramos todos. 
	double u_interpol[10] = {0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9};  //Sacaremos 10 puntos por tramo
	nav_msgs::Path spline_path;
	geometry_msgs::PoseStamped posicion;
	geometry_msgs::Point p;
	visualization_msgs::Marker points_spline;
	visualization_msgs::MarkerArray tactical_trayectory;
	tactical_trayectory.markers.resize(100);
	int marker = 0;
	points_spline.type = visualization_msgs::Marker::SPHERE_LIST;
	points_spline.action = visualization_msgs::Marker::ADD;
	points_spline.color.r=1.0;
	points_spline.color.a=1.0;
	points_spline.scale.x=1;
	points_spline.scale.y=0.1;
	points_spline.scale.z=0.1;

    		
	if (init_odom==0) return;

        //Si la trayectoria no ha cambiado, nos salimos para no volver a calcularla
	 x_fin = msg->waypoints[m-1].transform.location.x;
	 y_fin = -msg->waypoints[m-1].transform.location.y;
	
	 //if ((fabs(x_fin - x_fin_prev)<0.5) && (fabs(y_fin - y_fin_prev)<0.5))
	//	return ;

	stop=false;
	
	x_fin_prev = x_fin;
	y_fin_prev = y_fin;

	n_tramo = 0;
	cambia_tramo = 0;
	n_tramos = 0;
	u=0.5; u_ant=0.5;
	points_spline.points.clear();

	//New trajectory defined	 
	 	

	//The actual position of the vehicle is the initial point of the trajectory

	x[0]=actualPose[0];
	y[0]=actualPose[1];
	n_puntos++;
	p.x = x[0];
  	p.y = y[0];
	p.z = 0;
	points_spline.points.push_back(p);    

	
	for (int i=1; i<m; i++)  
	{
		dist=sqrt((msg->waypoints[i].transform.location.x-x[j-1])*(msg->waypoints[i].transform.location.x-x[j-1])+(-msg->waypoints[i].transform.location.y-y[j-1])*(-msg->waypoints[i].transform.location.y-y[j-1]));

		if (dist>min_dist)
		{
			x[j]=msg->waypoints[i].transform.location.x;
			y[j]=-msg->waypoints[i].transform.location.y;
			p.x = x[j];
			p.y = y[j];
			p.z = 0;
			points_spline.points.push_back(p);
			j++;
			n_puntos++;
			n_tramos++;
		}

		if (msg->waypoints[i].junction > 0 && msg->waypoints[i-1].junction == -1)
		{
			for (int wp=i-3; wp<i+3; wp++)
			{
				tactical_trayectory.markers[marker].header.frame_id = "map";
				tactical_trayectory.markers[marker].header.stamp = ros::Time::now();
				tactical_trayectory.markers[marker].ns = "tactical";
				tactical_trayectory.markers[marker].id = marker;
				tactical_trayectory.markers[marker].action = visualization_msgs::Marker::ADD;
				tactical_trayectory.markers[marker].type = visualization_msgs::Marker::CUBE;
				tactical_trayectory.markers[marker].pose.position.x = msg->waypoints[wp].transform.location.x;
				tactical_trayectory.markers[marker].pose.position.y = -msg->waypoints[wp].transform.location.y;
				tactical_trayectory.markers[marker].pose.position.z = 0.0;
				tactical_trayectory.markers[marker].pose.orientation.x = 0.0;
				tactical_trayectory.markers[marker].pose.orientation.y = 0.0;
				tactical_trayectory.markers[marker].pose.orientation.z = 0.0;
				tactical_trayectory.markers[marker].pose.orientation.w = 1.0;
				tactical_trayectory.markers[marker].scale.x = 1;
				tactical_trayectory.markers[marker].scale.y = 1;
				tactical_trayectory.markers[marker].scale.z = 1;
				tactical_trayectory.markers[marker].color.a = 1;
				tactical_trayectory.markers[marker].color.r = 1;
				tactical_trayectory.markers[marker].color.g = 0;
				tactical_trayectory.markers[marker].color.b = 0;
				tactical_trayectory.markers[marker].lifetime = ros::Duration();
				marker ++;
			}
		}
		// std::cout<<msg->waypoints[i].junction<<std::endl;
		// std::cout<<msg->waypoints[i].lane_change<<std::endl;

	}

	o[0]=Limitang(actualPose[2]);
	o[1]=atan2(y[n_puntos-1]-y[n_puntos-2],x[n_puntos-1]-x[n_puntos-2]);

	n_spline(x,y,o,0.0001,n_puntos);

	for (int i=0; i<n_tramos; i++)
	{
		for (int k=0; k<10; k++)
		{
			posicion.pose.position.x = coefs[i][0]+coefs[i][1]*u_interpol[k]+coefs[i][2]*u_interpol[k]*u_interpol[k]+coefs[i][3]*u_interpol[k]*u_interpol[k]*u_interpol[k];
			posicion.pose.position.y = coefs[i][4]+coefs[i][5]*u_interpol[k]+coefs[i][6]*u_interpol[k]*u_interpol[k]+coefs[i][7]*u_interpol[k]*u_interpol[k]*u_interpol[k];
			posicion.pose.position.z = 0;
			spline_path.poses.push_back(posicion);
		}
	}
	 
	arrayRc.clear();
	arrayVel.clear();
	velGeneration();
	n_tramo=0;
	
	spline_path.header.frame_id="map";
	points_spline.header.frame_id = "map";

	spline_pub.publish(spline_path);
	spline_points_pub.publish(points_spline);
	// tactical_pub.publish(tactical_trayectory);

    init=1;
	
}

//********************************Linear velocity profile generation***********************//

void velGeneration ()
{
	double der1_x, der1_y, der2_x, der2_y, der1, der2, aux;	

	for(n_tramo=0; n_tramo<=n_tramos; n_tramo++)
	{	
		double rc_sum=0;
		double num_it=0;
		for(u=0; u<=1; num_it++)
		{	
			der1_x=(3*coefs[n_tramo][3]*u*u)+(2*coefs[n_tramo][2]*u)+coefs[n_tramo][1];
		    	der1_y=(3*coefs[n_tramo][7]*u*u)+(2*coefs[n_tramo][6]*u)+coefs[n_tramo][5];
		    	der1=der1_y/der1_x;
		    	der2_x=(6*coefs[n_tramo][3]*u)+(2*coefs[n_tramo][2]);
		    	der2_y=(6*coefs[n_tramo][7]*u)+(2*coefs[n_tramo][6]);
		    	der2=((der2_y*der1_x)-(der1_y*der2_x))/(der1_x*der1_x*der1_x);
		    	der2=fabs(der2);
		    	
			if (der2<0.001)
				rc=rc_max;
		   	else
			{
				aux=(1+der1*der1);
				rc=sqrt(aux*aux*aux);
				rc=rc/der2;
			}
			if (rc<rc_min)
				rc=rc_min;
		    	if (rc>rc_max)
				rc=rc_max;
			u=u+0.1; 
			rc_sum=rc_sum+rc;
			
		}
		rc_sum=rc_sum/num_it;
		if(arrayRc.size()<n_tramos)
		arrayRc.push_back(rc_sum);
	}
	for(n_tramo=0; n_tramo<=n_tramos; n_tramo++)
	{ 	
		double vel=v_max, vel_tramo=0;

		if((n_tramos-n_tramo)>2 && n_tramo>2)
		{
			for (int i=-2;i<=2;i++)
			{
				vel_tramo=v_max*arrayRc[n_tramo+i]/(rc_max);
				if(vel>vel_tramo)
					vel=vel_tramo;
			}

		}
		else
		vel=(v_max*arrayRc[n_tramo])/(rc_max);

		if(arrayVel.size()<n_tramos)
			arrayVel.push_back(vel);
						
	}

	
}

//********************************Odometry callback******************************************//

void odometryCallback(const boost::shared_ptr<nav_msgs::Odometry const>& msg)
{

	//RODRIGO
	double x_location, y_location, theta_location;

	double vx=msg->twist.twist.linear.x, vy=msg->twist.twist.linear.y;
	std_msgs::Float64 speed_ego_msg;
	speed_ego_msg.data=round(360*sqrt((vx*vx)+(vy*vy)))/100;
	speed_ego_pub.publish(speed_ego_msg);

	actualOdom = *msg;
	x_location = actualOdom.pose.pose.position.x;
	y_location = actualOdom.pose.pose.position.y;
	theta_location = tf::getYaw(actualOdom.pose.pose.orientation);
	actualPose[0] = x_location + dist_location*cos(theta_location) + offset;
	actualPose[1] = y_location + dist_location*sin(theta_location);
	actualPose[2] = theta_location;
	// std::cout<<offset<<std::endl;

	init_odom=1;

}

void actionCallback(const boost::shared_ptr<std_msgs::Float64 const>& msg)
{
	if(msg->data == 0)
	{	
		offset = offset - 3.5;
	}	
	else if(msg->data == 2)
	{
		offset = offset + 3.5;
	}

	if (offset > 3.5)
		offset = 3.5;
	if (offset < -7)
		offset = -7;
}

//********************************External Speed callback******************************************//

void externalSpeedCallback(const boost::shared_ptr<std_msgs::Float64 const>& msg)
{
	external_speed_msg = *msg;
	external_speed=external_speed_msg.data;
}
//********************************Nearest Distance callback******************************************//

void nearestCallback(const boost::shared_ptr<std_msgs::Float64 const>& msg)
{
	// if (msg->data < 1)
	// 	external_speed=(v_max*(msg->data));
	// if (external_speed>v_max)
	// 	external_speed=v_max;
	// if (external_speed < 0)
	// 	external_speed = 0;

}

//********************************Run Start callback******************************************//

void runStartCallback(const boost::shared_ptr<std_msgs::Bool const>& msg)
{
	run_start_msg = *msg;
	run_start=run_start_msg.data;
}

//********************************STOP******************************************
void stopCallback(const boost::shared_ptr<std_msgs::Bool const>& msg)
{
	if(!overtake)
	{
		stop_msg = *msg; 
		stop = stop_msg.data;
	}
	else
	{
		stop= false;
	}
	
}

//********************************STOP******************************************
void overtakeCallback(const boost::shared_ptr<std_msgs::Bool const>& msg)
{
	overtake=msg->data;
}

//**********************************ROS Timer*******************************************//

void timerCallback(const ros::TimerEvent& e) 
{

	double de=0, oe=0, v=0;
	double futurePose[3];


    if (init==0)  return;
	if(run_start==false)
	{
		cmd_vel_msg.velocity = 0;
		speed_msg.data = 0;
		cmd_vel_msg.steer = 0;
		steer_msg.data = 0;
		cmd_vel_pub.publish(cmd_vel_msg);
		speed_pub.publish(speed_msg);
		steer_pub.publish(steer_msg);
		return;
	}

	//Actual location propagatin
	futurePose[0] = actualPose[0];
	futurePose[1] = actualPose[1];
	futurePose[2] = actualPose[2];

	for (int i=0; i<n_ret_vel;i++)
	{
		futurePose[0] = futurePose[0] + evol_vel[0][i]*cos(futurePose[2])*sample_time;
		futurePose[1] = futurePose[1] + evol_vel[0][i]*sin(futurePose[2])*sample_time;
		futurePose[2] = futurePose[2] + evol_vel[1][i]*sample_time;
	      }

	calcula_consigna( futurePose, coefs, n_tramo );

          if (cambia_tramo == 1)
	     {		
		n_tramo++;
		u_ant=0;
		calcula_consigna(futurePose,coefs,n_tramo);

	     }
	reference_pose.header.frame_id = "map";
	reference_pose.pose.position.x = pose_d[0];
	reference_pose.pose.position.y = pose_d[1];
	reference_pose.pose.orientation = tf::createQuaternionMsgFromYaw(pose_d[2]);
	
	reference_pose_pub.publish(reference_pose);

	pose_future.header.frame_id = "map";
	pose_future.pose.position.x = futurePose[0];
	pose_future.pose.position.y = futurePose[1];
	pose_future.pose.orientation = tf::createQuaternionMsgFromYaw(futurePose[2]);
	
	predicted_pose_pub.publish(pose_future);

	de = (futurePose[1]-pose_d[1])*cos(pose_d[2])-(futurePose[0]-pose_d[0])*sin(pose_d[2]);
	oe = Limitang(futurePose[2]-pose_d[2]);
	
	de_msg.data=de;
	oe_msg.data=oe;
	de_pub.publish(de_msg);
	oe_pub.publish(oe_msg);

	if (u>0.5) //Segunda mitad del tramo, vamos suavizando hacia la velocidad del tramo siguiente
	{
		v=arrayVel[n_tramo]+(u-0.5)*(arrayVel[n_tramo+1]-arrayVel[n_tramo]);
	}
	else //Primera mitad del tramo, vamos suavizando desde la velocidad del tramo anterior
	{
		v=arrayVel[n_tramo-1]+(u+0.5)*(arrayVel[n_tramo]-arrayVel[n_tramo-1]);
	}

	// //Primeros tramo
	// if(n_tramo<3)
	// {
	// 	if (u>0.5) //Segunda mitad del tramo, vamos suavizando hacia la velocidad del tramo siguiente
	// 	{
	// 		v=arrayVel[n_tramo]*(n_tramo+1)/3+(u-0.5)*(arrayVel[n_tramo+1]*(n_tramo+2)/3-arrayVel[n_tramo]*(n_tramo+1)/3);
	// 	}
	// 	else //Primera mitad del tramo, vamos suavizando desde la velocidad del tramo anterior
	// 	{
	// 		v=arrayVel[n_tramo-1]*(n_tramo)/3+(u+0.5)*(arrayVel[n_tramo]*(n_tramo+1)/3-arrayVel[n_tramo-1]*(n_tramo)/3);
	// 	}
	// }

	// //Ultimos tramo
	// if(n_tramo>=(n_tramos-2))
	// {
	// 	if (u>0.5) //Segunda mitad del tramo, vamos suavizando hacia la velocidad del tramo siguiente
	// 	{
	// 		v=arrayVel[n_tramo]*(n_tramos-n_tramo)/3+(u-0.5)*(arrayVel[n_tramo+1]*((n_tramos-n_tramo)-1)/3-arrayVel[n_tramo]*(n_tramos-n_tramo)/3);
	// 	}
	// 	else //Primera mitad del tramo, vamos suavizando desde la velocidad del tramo anterior
	// 	{
	// 		v=arrayVel[n_tramo-1]*((n_tramos-n_tramo)+1)/3+(u+0.5)*(arrayVel[n_tramo]*(n_tramos-n_tramo)/3-arrayVel[n_tramo-1]*((n_tramos-n_tramo)+1)/3);
	// 	}
	// }
	if(v>v_max)
		v=v_max;


	//RODRIGO

	A[1]= v*sample_time;
	B[0]= v*(sample_time)+(v*v*sample_time*sample_time)/(2*dist_wheels);
	B[1]= v*(sample_time)/2;
	Dlqr(Kr,A,B,Q,R);
	Consigna_ro(de,oe,Kr,&ro);//RODRIGO

	//Limitación para giros bruscos
	if(abs(ro_ans-ro)>3.5)
	ro=ro_ans;
	ro_ans=ro;

	//Final de trayectoria
	if ((fabs(x_fin - actualPose[0])<2) && (fabs(y_fin - actualPose[1])<2))
	stop=true;

	if(stop==false){
		if (external_speed<v || external_speed>v_max)
			v=external_speed;
		// v=external_speed;		//Solo tiene en cuenta la velocidad externa
		cmd_vel_msg.velocity = v;
		speed_msg.data = v;
		cmd_vel_msg.steer = ro/max_steer_angle;//RODRIGO
		steer_msg.data = ro/max_steer_angle;
		if (ro>max_steer_angle)
			{
			cmd_vel_msg.steer=1;
			steer_msg.data=1;
			}
		if (ro<-max_steer_angle)
			{
			cmd_vel_msg.steer=-1;
			steer_msg.data=-1;
			}
	}
	else if(stop==true)
	{
		cmd_vel_msg.velocity = 0;
		speed_msg.data = 0;
		cmd_vel_msg.steer = 0;
		steer_msg.data = 0;
	}

	cmd_vel_pub.publish(cmd_vel_msg);
	speed_pub.publish(speed_msg);
	steer_pub.publish(steer_msg);

	//GUARDAMOS VELOCIDADES EN EL BUFFER DE VELOCIDADES
	for (int i=1; i<n_ret_vel; i++)
	{
		evol_vel[0][i-1]=evol_vel[0][i];
		evol_vel[1][i-1]=evol_vel[1][i];
	}
	evol_vel[0][n_ret_vel-1] = v;
	evol_vel[1][n_ret_vel-1] = ro;//RODRIGO
}

//********************************MAIN*****************************************//

int main(int argc, char **argv) 
{
	ros::init(argc, argv, "t4ac_lqr_ros_node");
	ros::NodeHandle n;
	ros::Timer timer;

	n.param<int>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/real",real,1);
	n.param<int>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/N_max",N_max,500);
	n.param<int>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/min_dist",min_dist,10);
	n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/rc_max",rc_max,20);
	n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/rc_min",rc_min,1);
    n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/v_max",v_max,10);
    n.param<int>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/n_ret_vel",n_ret_vel,2);
    n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/sample_time",sample_time,0.1);
	n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/q11",q11,1);
	n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/q22",q22,1);
	n.param<double>("/t4ac/control/classic/t4ac_lqr_ros/t4ac_lqr_ros_node/r11",r11,1);


    A[0]=1.0;  A[1]=v*sample_time; A[2]=0.0;  A[3]=1.0;
	B[0]=v*(sample_time*sample_time)/2;  B[1]=sample_time;
	Q[0]=q11; Q[1]=0.0; Q[2]=0.0; Q[3]=q22;
	R=r11;

	external_speed=v_max;

	if(real=1){
		double dist_location=2.35, dist_wheels=1.35;
		double max_steer_angle= 0.35;  
	} 

	system("rosparam set /rqt_gauges/topic1 /t4ac/control/speed_ego");
	system("rosparam set /rqt_gauges/gauge_name1 km/h");

	ros::Subscriber spline_sub = n.subscribe("/t4ac/planning/route", 10, trajectoryCallback); 
	ros::Subscriber stop_sub = n.subscribe("/t4ac/perception/tracking_and_prediction/classic/t4ac_smartmot_ros/t4ac_smartmot_ros_node/predicted_collision", 10, stopCallback);
	ros::Subscriber odom_sub = n.subscribe("/t4ac/localization/pose", 10, odometryCallback);
	ros::Subscriber action_sub = n.subscribe<std_msgs::Float64>("/action", 10, actionCallback); 
	// ros::Subscriber external_speed_sub = n.subscribe("/t4ac/decision_making/speed", 10, externalSpeedCallback); 
	ros::Subscriber nearest_distance_sub = n.subscribe("/front_obstacle", 10, nearestCallback); 
	ros::Subscriber run_start_sub = n.subscribe("/t4ac/decision_making/run_start", 10, runStartCallback); 
	ros::Subscriber overtake_sub = n.subscribe("/t4ac/decision_making/classic/t4ac_petrinets_ros/t4ac_petrinets_ros_node/overtake", 10, overtakeCallback); 

	spline_pub = n.advertise<nav_msgs::Path> ("/t4ac/control/spline",1, true);
	spline_points_pub = n.advertise<visualization_msgs::Marker> ("/t4ac/control/points_spline",1,true);
	reference_pose_pub = n.advertise<geometry_msgs::PoseStamped> ("/t4ac/control/reference_pose",1,true);
	predicted_pose_pub = n.advertise<geometry_msgs::PoseStamped> ("/t4ac/control/predicted_pose",1,true);
	cmd_vel_pub = n.advertise<t4ac_msgs::CarControl> ("/t4ac/control/cmd_vel",1,true);
	speed_ego_pub = n.advertise<std_msgs::Float64> ("/t4ac/control/speed_ego",1,true);
	speed_pub = n.advertise<std_msgs::Float64> ("/t4ac/control/speed",1,true);
	steer_pub = n.advertise<std_msgs::Float64> ("/t4ac/control/steer",1,true);
	oe_pub = n.advertise<std_msgs::Float64> ("/t4ac/control/oe",1,true);
	de_pub = n.advertise<std_msgs::Float64> ("/t4ac/control/de",1,true);
	rc_pub = n.advertise<std_msgs::Float64> ("/t4ac/control/rc",1,true);
	tactical_pub = n.advertise<visualization_msgs::MarkerArray>("/t4ac/control/tactical_trayectory", 1);


	for (int i=0; i<n_ret_vel; i++)
	{
		evol_vel[0][i] = 0;
		evol_vel[1][i] = 0;	
	}	

	timer= n.createTimer(ros::Duration(0.1), timerCallback);

	ros::spin();
	return 0;

}


//*******************************CALCULA COEFICIENTES DE LA SPLINE***************************************//

void n_spline(double *x, double *y, double *o, double nu, int m)

{  
	
	double lam[m-1], deta[m], D[m]; 


	//Cálculo de derivadas


	lam[0]=0;
	for (int i=1; i<=(m-2); i++)
        {

		lam[i]=1/(4-lam[i-1]);
	}


	deta[0]=nu*cos(o[0]);
	for (int i=1; i<=(m-2); i++)
	{
		deta[i]=(3*(x[i+1]-x[i-1])-deta[i-1])*lam[i];
	}
	deta[m-1]=nu*cos(o[1]);



	D[m-1]=deta[m-1];
	for(int i=(m-2);i>=0;i--)
	{
		D[i]=deta[i]-lam[i]*D[i+1];
	}


	//Calculo de coeficientes

	for (int i=0; i<=(m-2); i++)
	{
		coefs[i][0] = x[i];
		coefs[i][1] = D[i];
		coefs[i][2] = 3*(x[i+1]-x[i])-2*D[i]-D[i+1];
		coefs[i][3] = 2*(x[i]-x[i+1])+D[i]+D[i+1];
	}

	//Caclulo de derivadas 

	lam[0]=0;
	for (int i=1; i<=(m-2); i++)
	{
		lam[i]=1/(4-lam[i-1]);
	}

	deta[0]=nu*sin(o[0]);
	for (int i=1; i<=(m-2); i++)
	{
		deta[i]=(3*(y[i+1]-y[i-1])-deta[i-1])*lam[i];
	}
	deta[m-1]=nu*sin(o[1]);



	D[m-1]=deta[m-1];
	for(int i=(m-2);i>=0;i--)
	{
		D[i]=deta[i]-lam[i]*D[i+1];
	}

	//Calculo de coeficientes

	for (int i=0; i<=(m-2); i++)
	{
		coefs[i][4] = y[i];
		coefs[i][5] = D[i];
		coefs[i][6] = 3*(y[i+1]-y[i])-2*D[i]-D[i+1];
		coefs[i][7] = 2*(y[i]-y[i+1])+D[i]+D[i+1];
	}


}

//*****************CALCULA CONSIGNA***************************//

void calcula_consigna(double actualPose[3],double coefs[n_max][8],int n_tramo)

{
	float A,B,C,D,E,F;
	double der1_x, der1_y, der2_x, der2_y, der1, der2, aux;

	A=(3*coefs[n_tramo][3]*coefs[n_tramo][3])+(3*coefs[n_tramo][7]*coefs[n_tramo][7]);
    	B=(5*coefs[n_tramo][2]*coefs[n_tramo][3])+(5*coefs[n_tramo][6]*coefs[n_tramo][7]);
    	C=(2*coefs[n_tramo][2]*coefs[n_tramo][2])+(4*coefs[n_tramo][1]*coefs[n_tramo][3])+(2*coefs[n_tramo][6]*coefs[n_tramo][6])+(4*coefs[n_tramo][5]*coefs[n_tramo][7]);
    	D=(3*coefs[n_tramo][2]*coefs[n_tramo][1])-(3*actualPose[0]*coefs[n_tramo][3])+(3*coefs[n_tramo][0]*coefs[n_tramo][3])+(3*coefs[n_tramo][5]*coefs[n_tramo][6])-(3*actualPose[1]*coefs[n_tramo][7])+(3*coefs[n_tramo][4]*coefs[n_tramo][7]);
    	E=(coefs[n_tramo][1]*coefs[n_tramo][1])-(2*actualPose[0]*coefs[n_tramo][2])+(2*coefs[n_tramo][0]*coefs[n_tramo][2])+(coefs[n_tramo][5]*coefs[n_tramo][5])-(2*actualPose[1]*coefs[n_tramo][6])+(2*coefs[n_tramo][4]*coefs[n_tramo][6]);
    	F=(coefs[n_tramo][0]*coefs[n_tramo][1])-(actualPose[0]*coefs[n_tramo][1])+(coefs[n_tramo][4]*coefs[n_tramo][5])-(actualPose[1]*coefs[n_tramo][5]);
	
	float coef[6] = {F,E,D,C,B,A};

	u = sol_ecuacion(coef, u_ant);
	u_ant=u;

	if(n_tramo==0 && u<0) u=0;

	if (u<=1)
		cambia_tramo = 0;
	else if (u>1)
		{		
		cambia_tramo = 1;
		u_ant=0;
		return;
		}

		pose_d[0]=coefs[n_tramo][0]+coefs[n_tramo][1]*u+coefs[n_tramo][2]*u*u+coefs[n_tramo][3]*u*u*u;
        pose_d[1]=coefs[n_tramo][4]+coefs[n_tramo][5]*u+coefs[n_tramo][6]*u*u+coefs[n_tramo][7]*u*u*u;
		pose_d[2]=atan2((coefs[n_tramo][5]+(2*coefs[n_tramo][6]*u)+(3*coefs[n_tramo][7]*u*u)),(coefs[n_tramo][1]+(2*coefs[n_tramo][2]*u)+(3*coefs[n_tramo][3]*u*u)));
	
        if (fabs(Limitang(pose_d[2]-actualPose[2]))>PI/2)   pose_d[2]=Limitang(pose_d[2]+PI);

 		der1_x=(3*coefs[n_tramo][3]*u*u)+(2*coefs[n_tramo][2]*u)+coefs[n_tramo][1];
    	der1_y=(3*coefs[n_tramo][7]*u*u)+(2*coefs[n_tramo][6]*u)+coefs[n_tramo][5];
    	der1=der1_y/der1_x;
    	der2_x=(6*coefs[n_tramo][3]*u)+(2*coefs[n_tramo][2]);
    	der2_y=(6*coefs[n_tramo][7]*u)+(2*coefs[n_tramo][6]);
    	der2=((der2_y*der1_x)-(der1_y*der2_x))/(der1_x*der1_x*der1_x);
    	der2=fabs(der2);
    	
	if (der2<0.001)
        	rc=rc_max;
   	else
        {
		aux=(1+der1*der1);
        	rc=sqrt(aux*aux*aux);
        	rc=rc/der2;
	}

        if (rc<rc_min)
		rc=rc_min;
    	if (rc>rc_max)
        	rc=rc_max;  
	rc_msg.data=rc;
	rc_pub.publish(rc_msg);
}

//******************RESOLUCIÓN DE ECUACIÓN****************//

float sol_ecuacion(float coef[6], float x)
{
	int i,j=0,n=5;
	float emax=1e-3; //valor maximo del error cometido
	float p,p1;
	x=x+0.1;

	do
	{
		p=coef[n]*x+coef[n-1];
		p1=coef[n];
		for(i=n-2;i>=0;i--)
		{
			p1=p+p1*x;
			p=coef[i]+p*x;
		}
		if(fabs(p)>emax)
			x-=p/p1;
		j++;
	}
	while(fabs(p)>emax&&j<100);
	
	if (x<0)
	{
		p=1;
		j=0;
		x=x+0.2;
		do
		{
		p=coef[n]*x+coef[n-1];
		p1=coef[n];
			for(i=n-2;i>=0;i--)
			{
				p1=p+p1*x;
				p=coef[i]+p*x;
			}
			if(fabs(p)>emax)
				x-=p/p1;
		j++;
		}
		while(fabs(p)>emax&&j<100);
		
	}
	return x;
	
}

//********************LIMITA ANGULO ENTRE +-PI****************//

double Limitang( double ang )
{
	while(ang > PI) ang-= 2*PI;
	while(ang < (-PI)) ang+=2*PI;
	return ang;
}

//************************DLQR****************************************//

void Dlqr(double K[2], double A[4], double B[2], double Q[4], double R)
{

	int num_est = 2;
	double P0[4]={0,0,0,0}, inter1[2], inter3[4];
	double transA[4], BRB[4], modif[4], inter0[1];
	int ind;

	//Precalculo de elementos que no cambian durante el bucle como la transpuesta de A y B*inv(R)*B

	Traspuesta2(A,transA);
	mult_esc_mat(1/R,B,num_est,inter1);
	Multiplicar(B,inter1,num_est,1,num_est,BRB);

	//Bucle para calculo de P0 hasta que se estabilice (20 veces)
	
	for(ind=0;ind<20;ind++)
	{
		//Multiplicamos BRB*P0 y lo guardamos en inter3
		Multiplicar(BRB,P0,num_est,num_est,num_est,inter3);
		//Sumamos la matriz identidad con el inter3 guardandolo en inter3
		suma_ident(inter3,num_est);
		//Inversa de inter3 y guardamos en modif
		Inversa2(inter3,modif);
		//Multiplicamos modif*A y lo guardamos en inter3
		Multiplicar(modif,A,num_est,num_est,num_est,inter3);
		//Multiplicamos P0*inter3 y se guarda en modif
		Multiplicar(P0,inter3,num_est,num_est,num_est,modif);
		//Multiplicamos trasA*modif y se guarda en P0
		Multiplicar(transA,modif,num_est,num_est,num_est,P0);
		//Sumar Q y P0 y ya tenemos P0 nuevo
		Sumar(Q,P0,num_est,num_est,P0);	
	}

	//Calculo de K

	Multiplicar(B,P0,1,num_est,num_est,inter1);
	Multiplicar(inter1,B,1,num_est,1,inter0);
	inter0[0]+=R;
	inter0[0]=1/inter0[0];
	mult_esc_mat(inter0[0],B,num_est,inter1);
	Multiplicar(inter1,P0,1,num_est,num_est,B);
	Multiplicar(B,A,1,num_est,num_est,K);


}

//*******************************MULTIPLICACIÓN DE MATRICES*********************************//

void Multiplicar(double *origen1, double *origen2, long x, long y, long z, double *destino)
{
	long i,j,k;
	double fila;
	
	for (i=0;i<x;i++)
		for (j=0;j<z;j++)
		{
			fila=0.0;
			for(k=0;k<y;k++)
				fila+=((*(origen1+i*y+k))*(*(origen2+k*z+j)));
				*(destino+i*z+j)=fila;
		}
}

//************************MULTIPLICACION ESCALAR POR MATRIZ*********************************//

void mult_esc_mat(double esc, double *mat, int n, double *destino)
{
	int i;
	for(i=0;i<n;i++)
		destino[i]=mat[i]*esc;
}

//********************SUMA A UNA MATRIZ LA MATRIZ IDENTIDAD*********************************//

void suma_ident(double *mat, int n)
{
	double *p;
	int i;
	
	p=mat;
	for(i=0;i<n;i++)
	{
		*p=*p+1.0;
		p+=n+1;
	}
}

//*****************INVERSA DE UNA MATRIZ DE ORDEN 2**********************//

void Inversa2(double *origen, double *destino)
{
	double det, inv_det;
	det=(origen[0]*origen[3])-(origen[1]*origen[2]);
	inv_det=1/det;
	destino[0]=origen[3]*inv_det;
	destino[1]=-origen[1]*inv_det;
	destino[2]=-origen[2]*inv_det;
	destino[3]=origen[0]*inv_det;
}

//******************TRASPUESTA DE MATRIZ DE ORDEN 2*************************//

void Traspuesta2(double *origen, double *destino)
{
	int i,j;
	for(i=0;i<2;i++)
	 for(j=0;j<2;j++)
		destino[i*2+j]=origen[j*2+i];
}

//*********************SUMA DE MATRICES********************************//

void Sumar(double *origen1, double *origen2, int nf, int nc, double *destino)
{
	int i,j;
	for(i=0;i<2;i++)
	 for(j=0;j<2;j++)
		*(destino+i*nf+j)=(*(origen1+i*nf+j))+(*(origen2+i*nf+j));
}

//**********************APLICA LA LEY DE CONTROL OPTIMO PARA HAYAR ro=-K*x)**********************//

void Consigna_ro(double de, double oe, double Kr[2], double *ro)		//RODRIGO
{
	double estados[2];
	estados[0]=de;
	estados[1]=oe;
	Multiplicar(Kr,estados,1L,2L,1L,ro);
	//Inversion del signo de la velocidad obtenida
	*ro = -(*ro);
}
