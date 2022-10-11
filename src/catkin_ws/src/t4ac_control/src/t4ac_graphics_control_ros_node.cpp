// INCLUIR LA LIBRERIA DE ROS
#include "ros/ros.h"
#include "nav_msgs/Odometry.h"
#include "t4ac_msgs/CarControl.h"
#include "std_msgs/Bool.h"
#include "std_msgs/Float64.h"
#include "std_msgs/String.h"

// INCLUIR RESTO DE LIBERIAS A UTILIZAR
#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <string>
#include <iostream>
#include <cstdlib>
#include <sstream>
#include <fstream>
#include <cstdio>
#include <termios.h>

using std::string;
using std::cout;
using std::cin;
using std::endl;
using std::exception;
using std::vector;


// DECLARAR LAS VARIABLES A UTILIZAR
double start_time;
bool init = false;
bool init_vel = false;

std::ofstream logFile1, logFile2;

std_msgs::Float64 dist_to_cw_msg;

//DECLARAR TOPICS
ros::Subscriber odometry_sub;
ros::Subscriber vel_sub;
ros::Subscriber state_sub;


void OdometryCallback(const boost::shared_ptr<nav_msgs::Odometry const>& msg){
	nav_msgs::Odometry state = *msg;
	double pose_x=state.pose.pose.position.x;
	double pose_y=state.pose.pose.position.y;
	double time_running, v, vx=state.twist.twist.linear.x, vy=state.twist.twist.linear.y, y=state.pose.pose.position.y;
	v=sqrt((vx*vx)+(vy*vy));

	if (v>0 && !init_vel){
		start_time = ros::Time::now().toSec();
		init_vel = true;
	}

	time_running = ros::Time::now().toSec() - start_time;

	if (init_vel){
		logFile1.open ("/home/robesafe/shared_home/control_graphics/odometry_pose.log", std::ios_base::app);
		logFile1 << v << "," << time_running <<"," << pose_x <<"," << pose_y <<  endl;
		logFile1.close();
	}

}

void velCallback(const boost::shared_ptr<t4ac_msgs::CarControl const>& msg)
{
	t4ac_msgs::CarControl vel_state = *msg;
	double time_running = ros::Time::now().toSec() - start_time;
	if (init_vel){

		logFile1.open ("/home/robesafe/shared_home/control_graphics/linear.log", std::ios_base::app);
		logFile1 << vel_state.velocity <<","<< time_running <<  endl;
		logFile1.close();
		logFile1.open ("/home/robesafe/shared_home/control_graphics/angular.log", std::ios_base::app);
		logFile1 << vel_state.steer <<","<< time_running <<  endl;
		logFile1.close();
	}
}

void stateCallback(const boost::shared_ptr<std_msgs::String const>& msg)
{
	std_msgs::String state = *msg;
	double time_running = ros::Time::now().toSec() - start_time;

		logFile1.open ("/home/robesafe/shared_home/control_graphics/state.log", std::ios_base::app);
		logFile1 << state.data <<","<< time_running <<  endl;
		logFile1.close();

}

// PROGRAMA PRINCIPAL
int main (int argc, char **argv){
	remove("/home/robesafe/shared_home/control_graphics/odometry_pose.log");
	remove("/home/robesafe/shared_home/control_graphics/linear.log");
	remove("/home/robesafe/shared_home/control_graphics/angular.log");
	remove("/home/robesafe/shared_home/control_graphics/state.log");

	// INICIALIZAR ROS
	ros::init(argc, argv, "graphics_node");
	ros::NodeHandle nh;
	
	// SUBSCRIBERS
	odometry_sub = nh.subscribe<nav_msgs::Odometry> ("/t4ac/localization/pose", 1, OdometryCallback);
	vel_sub = nh.subscribe<t4ac_msgs::CarControl>("/t4ac/control/cmd_vel", 1, velCallback);
	state_sub = nh.subscribe<std_msgs::String>("/t4ac/decision_making/state", 1, stateCallback);
	
	start_time = ros::Time::now().toSec();
	
	ros::spin();	

	return 0;
}