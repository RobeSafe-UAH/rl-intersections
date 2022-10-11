"""
Test to draw waypoints in RVIZ.
"""
import sys 
import os
import glob

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import visualization_msgs.msg
        
sys.path.insert(0, '/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/t4ac_map_monitor/src')
from modules import markers_module
from modules import util_module
from modules import monitor_module
from modules import monitor_classes

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)

def dataSet_1():
    """
    Cross of junction xxxx in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 218.896331787
    node.y = 9.79049110413
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 221.895996094
    node.y = 9.83529758453
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.895889282
    node.y = 9.85023403168
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.895782471
    node.y = 9.86516952515
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.8956604
    node.y = 9.88010501862
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.895553589
    node.y = 9.89504146576
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.895446777
    node.y = 9.90997695923
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.758270264
    node.y = 9.93449687958
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.431625366
    node.y = 10.0589828491
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.071914673
    node.y = 10.3017559052
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.658554077
    node.y = 10.6550045013
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.172637939
    node.y = 11.1073665619
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.606231689
    node.y = 11.6517591476
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.939880371
    node.y = 12.2630329132
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.163345337
    node.y = 12.9226160049
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.269958496
    node.y = 13.6108188629
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.266418457
    node.y = 14.4503269196
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.242111206
    node.y = 15.4500312805
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.217788696
    node.y = 16.4497356415
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.193481445
    node.y = 17.4494400024
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.169158936
    node.y = 18.4491443634
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.144851685
    node.y = 19.4488487244
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.120529175
    node.y = 20.4485530853
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.026626587
    node.y = 24.3099441528
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.099563599
    node.y = 21.3108520508
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_2():
    """
    Main way of junction xxxx in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 218.896331787
    node.y = 9.79049110413
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 221.895996094
    node.y = 9.83529758453
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.895889282
    node.y = 9.85023403168
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.895782471
    node.y = 9.86516952515
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.8956604
    node.y = 9.88010501862
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.895553589
    node.y = 9.89504146576
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.895446777
    node.y = 9.90997695923
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.758270264
    node.y = 9.93449687958
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.431625366
    node.y = 10.0589828491
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.071914673
    node.y = 10.3017559052
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.658554077
    node.y = 10.6550045013
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.172637939
    node.y = 11.1073665619
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.606231689
    node.y = 11.6517591476
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.939880371
    node.y = 12.2630329132
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.163345337
    node.y = 12.9226160049
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.269958496
    node.y = 13.6108188629
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.266418457
    node.y = 14.4503269196
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.242111206
    node.y = 15.4500312805
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.217788696
    node.y = 16.4497356415
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.193481445
    node.y = 17.4494400024
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.169158936
    node.y = 18.4491443634
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.144851685
    node.y = 19.4488487244
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.120529175
    node.y = 20.4485530853
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.026626587
    node.y = 24.3099441528
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.099563599
    node.y = 21.3108520508
    node.z = 0.0
    nodes.append(node)
    return nodes

def dataSet_3():
    """
    Split wrong way junction xxxx in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 221.895996094
    node.y = 9.83529758453
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.895889282
    node.y = 9.85023403168
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.895782471
    node.y = 9.86516952515
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.8956604
    node.y = 9.88010501862
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.895553589
    node.y = 9.89504146576
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.895446777
    node.y = 9.90997695923
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.758270264
    node.y = 9.93449687958
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.431625366
    node.y = 10.0589828491
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.071914673
    node.y = 10.3017559052
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.658554077
    node.y = 10.6550045013
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.172637939
    node.y = 11.1073665619
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.606231689
    node.y = 11.6517591476
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.939880371
    node.y = 12.2630329132
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.163345337
    node.y = 12.9226160049
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.269958496
    node.y = 13.6108188629
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.266418457
    node.y = 14.4503269196
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.242111206
    node.y = 15.4500312805
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.217788696
    node.y = 16.4497356415
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.193481445
    node.y = 17.4494400024
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.169158936
    node.y = 18.4491443634
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.144851685
    node.y = 19.4488487244
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.120529175
    node.y = 20.4485530853
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.099563599
    node.y = 21.3108520508
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_4():
    """
    Contour of main way of junction xxxx in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 218.8701937
    node.y = 11.5402958933
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 221.869858006
    node.y = 11.5851023738
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.869751195
    node.y = 11.6000388209
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.869644383
    node.y = 11.6149743144
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.869522313
    node.y = 11.6299098078
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.869415502
    node.y = 11.644846255
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.86930869
    node.y = 11.6597817485
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.595741804
    node.y = 11.6769332486
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.960445444
    node.y = 11.7443580241
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.307241311
    node.y = 11.8758507721
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.624987088
    node.y = 12.0671798728
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.903427538
    node.y = 12.3121922579
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.148338948
    node.y = 12.6197719334
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.337129858
    node.y = 12.9656642472
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.46357667
    node.y = 13.3388929298
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.52390744
    node.y = 13.7283165558
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.516935796
    node.y = 14.4077778933
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.492628545
    node.y = 15.4074822542
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.468306036
    node.y = 16.4071866152
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.443998785
    node.y = 17.4068909761
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.419676275
    node.y = 18.4065953371
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.395369024
    node.y = 19.4062996981
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.371046514
    node.y = 20.406004059
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.350080938
    node.y = 21.2683030245
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.27714392
    node.y = 24.2673953595
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.776109253
    node.y = 24.3524929462
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.849046259
    node.y = 21.3534010771
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.870011836
    node.y = 20.4911021116
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.894334345
    node.y = 19.4913977507
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.918641596
    node.y = 18.4916933897
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.942964106
    node.y = 17.4919890287
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.967271357
    node.y = 16.4922846678
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.991593867
    node.y = 15.4925803068
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 233.015901118
    node.y = 14.4928759459
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 233.016009553
    node.y = 13.49332117
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.863114004
    node.y = 12.5063390801
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.542630885
    node.y = 11.5604015793
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.064124431
    node.y = 10.6837463619
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.441848341
    node.y = 9.9025408659
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.692121066
    node.y = 9.24282912988
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.836588034
    node.y = 8.72766103825
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.902805289
    node.y = 8.37360767412
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.920798723
    node.y = 8.1920605106
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.921584865
    node.y = 8.16017217
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.921691676
    node.y = 8.14523667654
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.921798488
    node.y = 8.13030022939
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.921920558
    node.y = 8.11536473592
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.92202737
    node.y = 8.10042924245
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 221.922134181
    node.y = 8.08549279531
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 218.922469874
    node.y = 8.0406863149
    node.z = 0
    nodes.append(node)

    return nodes

def dataSet_5():
    """
    Contour of main way of junction xxxx in Town03 without extra waypoints
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 221.869858006
    node.y = 11.5851023738
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.869751195
    node.y = 11.6000388209
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.869644383
    node.y = 11.6149743144
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.869522313
    node.y = 11.6299098078
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.869415502
    node.y = 11.644846255
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.86930869
    node.y = 11.6597817485
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.595741804
    node.y = 11.6769332486
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.960445444
    node.y = 11.7443580241
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.307241311
    node.y = 11.8758507721
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.624987088
    node.y = 12.0671798728
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.903427538
    node.y = 12.3121922579
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.148338948
    node.y = 12.6197719334
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.337129858
    node.y = 12.9656642472
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.46357667
    node.y = 13.3388929298
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.52390744
    node.y = 13.7283165558
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.516935796
    node.y = 14.4077778933
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.492628545
    node.y = 15.4074822542
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.468306036
    node.y = 16.4071866152
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.443998785
    node.y = 17.4068909761
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.419676275
    node.y = 18.4065953371
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.395369024
    node.y = 19.4062996981
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.371046514
    node.y = 20.406004059
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.350080938
    node.y = 21.2683030245
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.849046259
    node.y = 21.3534010771
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.870011836
    node.y = 20.4911021116
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.894334345
    node.y = 19.4913977507
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.918641596
    node.y = 18.4916933897
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.942964106
    node.y = 17.4919890287
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.967271357
    node.y = 16.4922846678
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.991593867
    node.y = 15.4925803068
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 233.015901118
    node.y = 14.4928759459
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 233.016009553
    node.y = 13.49332117
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.863114004
    node.y = 12.5063390801
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.542630885
    node.y = 11.5604015793
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 232.064124431
    node.y = 10.6837463619
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 231.441848341
    node.y = 9.9025408659
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 230.692121066
    node.y = 9.24282912988
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 229.836588034
    node.y = 8.72766103825
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 228.902805289
    node.y = 8.37360767412
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 227.920798723
    node.y = 8.1920605106
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 226.921584865
    node.y = 8.16017217
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 225.921691676
    node.y = 8.14523667654
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 224.921798488
    node.y = 8.13030022939
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 223.921920558
    node.y = 8.11536473592
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 222.92202737
    node.y = 8.10042924245
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 221.922134181
    node.y = 8.08549279531
    node.z = 0
    nodes.append(node)

    return nodes

def dataSet_6():
    """
    Contour of the route yyyy in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 33.6469277944
    node.y = 191.697087968
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 30.6469411458
    node.y = 191.704580034
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 27.6469487752
    node.y = 191.712072099
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 24.6469564046
    node.y = 191.719548906
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 21.6469716634
    node.y = 191.727040971
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 17.0965566243
    node.y = 191.738378251
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 14.0965670932
    node.y = 191.745885573
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 11.0965766299
    node.y = 191.75336238
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 8.58172419371
    node.y = 191.754039499
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 8.21448239147
    node.y = 191.551816927
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 7.67842022998
    node.y = 190.376182778
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 7.59739424409
    node.y = 188.111684074
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 7.57841231049
    node.y = 185.111745109
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 7.55093790416
    node.y = 180.769749404
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 4.00298382168
    node.y = 173.202046157
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 3.98400141124
    node.y = 170.202107192
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 3.96501947765
    node.y = 167.202168227
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 3.94603706722
    node.y = 164.202229262
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 3.92705513363
    node.y = 161.202290298
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 3.89788605098
    node.y = 156.592396499
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 7.37883306865
    node.y = 153.570317031
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 3.8789031374
    node.y = 153.592463731
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 0.397956119731
    node.y = 156.614543199
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 0.427125202372
    node.y = 161.224436997
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 0.446107135966
    node.y = 164.224375962
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 0.465089546397
    node.y = 167.224314927
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 0.484071479991
    node.y = 170.224253892
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 0.503053890422
    node.y = 173.224192857
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 4.05100797291
    node.y = 180.791896104
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 4.07848237334
    node.y = 185.133890877
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 4.09746430694
    node.y = 188.133829842
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 4.25901015179
    node.y = 191.122932212
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.53781977833
    node.y = 193.806917203
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 8.10702702699
    node.y = 195.221699027
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 11.1053085935
    node.y = 195.253351487
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 14.1052990567
    node.y = 195.245874681
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 17.1052904521
    node.y = 195.238367354
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 21.6557054911
    node.y = 195.227030074
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 24.6556902323
    node.y = 195.219538008
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 27.655682603
    node.y = 195.212061202
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 30.6556749736
    node.y = 195.204569136
    node.z = 0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 33.6556616221
    node.y = 195.197077071
    node.z = 0
    nodes.append(node)

    return nodes

def dataSet_7():
    """
    Way 1 of junction in route yyyy in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = -9.34552192688
    node.y = 157.676208496
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.33919429779
    node.y = 158.676177979
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.3328666687
    node.y = 159.67616272
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.32653999329
    node.y = 160.676147461
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.3202123642
    node.y = 161.676116943
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.31388473511
    node.y = 162.676101685
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.30755805969
    node.y = 163.676086426
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.3012304306
    node.y = 164.676055908
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.29490280151
    node.y = 165.676040649
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.2885761261
    node.y = 166.676025391
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.28224754333
    node.y = 167.676010132
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.27592086792
    node.y = 168.675979614
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.26959323883
    node.y = 169.675964355
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.26326560974
    node.y = 170.675949097
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.25693893433
    node.y = 171.675918579
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.25061130524
    node.y = 172.67590332
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.24428367615
    node.y = 173.675888062
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.23795604706
    node.y = 174.675857544
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.23162841797
    node.y = 175.675842285
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.22530174255
    node.y = 176.675827026
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.21897411346
    node.y = 177.675811768
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.21264648438
    node.y = 178.67578125
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.20878696442
    node.y = 179.285766602
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_8():
    """
    Way 2 of junction in route yyyy of Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = -5.8455915451
    node.y = 157.654067993
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.83926391602
    node.y = 158.654037476
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.8329372406
    node.y = 159.654022217
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.82660961151
    node.y = 160.654006958
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.82028198242
    node.y = 161.65397644
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.81395530701
    node.y = 162.653961182
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.80762767792
    node.y = 163.653945923
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.80130004883
    node.y = 164.653915405
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.79497241974
    node.y = 165.653900146
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.78864574432
    node.y = 166.653884888
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.78231811523
    node.y = 167.653869629
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.77599048615
    node.y = 168.653839111
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.76966285706
    node.y = 169.653823853
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.76333618164
    node.y = 170.653808594
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.75700855255
    node.y = 171.653778076
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.75068092346
    node.y = 172.653762817
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.74435329437
    node.y = 173.653747559
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.73802614212
    node.y = 174.653717041
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.73169898987
    node.y = 175.653701782
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.72537136078
    node.y = 176.653686523
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.71904373169
    node.y = 177.653671265
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.71271657944
    node.y = 178.653640747
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -5.70885705948
    node.y = 179.263626099
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_9():
    """
    Way 3 of junction in route yyyy in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = -9.34552192688
    node.y = 157.676208496
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.33919429779
    node.y = 158.676177979
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.33286762238
    node.y = 159.67616272
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.33488750458
    node.y = 160.61378479
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.39124393463
    node.y = 161.489334106
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.50868225098
    node.y = 162.358795166
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.686627388
    node.y = 163.217926025
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -9.92420864105
    node.y = 164.062484741
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -10.2202625275
    node.y = 164.888397217
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -10.5456266403
    node.y = 165.595443726
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -10.9489440918
    node.y = 166.209564209
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -11.4401569366
    node.y = 166.755905151
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -12.008058548
    node.y = 167.222045898
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -12.6396903992
    node.y = 167.597335815
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -13.3569755554
    node.y = 167.886978149
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -14.3025302887
    node.y = 168.21244812
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -15.2480840683
    node.y = 168.537918091
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -16.1936397552
    node.y = 168.863372803
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -17.1391925812
    node.y = 169.188842773
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -18.0847473145
    node.y = 169.514297485
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -19.0303020477
    node.y = 169.839767456
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -19.9758548737
    node.y = 170.165237427
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -20.9214096069
    node.y = 170.490692139
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -21.8669643402
    node.y = 170.816162109
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = -22.4663295746
    node.y = 171.022460938
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_10():
    """
    Way 4 of junction in route yyyy in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 2.28465557098
    node.y = 178.213027954
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.27832818031
    node.y = 177.213043213
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.27200078964
    node.y = 176.213058472
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.26567339897
    node.y = 175.213088989
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.2593460083
    node.y = 174.213104248
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.25301861763
    node.y = 173.213119507
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.24669122696
    node.y = 172.213150024
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.24036407471
    node.y = 171.213165283
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.23403644562
    node.y = 170.213180542
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.22770929337
    node.y = 169.213195801
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.22138166428
    node.y = 168.213226318
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.21505451202
    node.y = 167.213241577
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.20872688293
    node.y = 166.213256836
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.20239973068
    node.y = 165.213287354
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.19607210159
    node.y = 164.213302612
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.18974494934
    node.y = 163.213317871
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.18341732025
    node.y = 162.213348389
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.177090168
    node.y = 161.213363647
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.17076253891
    node.y = 160.213378906
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.16443538666
    node.y = 159.213409424
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.15810775757
    node.y = 158.213424683
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.15178060532
    node.y = 157.213439941
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 2.14792108536
    node.y = 156.60345459
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_11():
    """
    Way 5 of junction in route yyyy in Town03
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 5.78458499908
    node.y = 178.190887451
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.77825737
    node.y = 177.19090271
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.77193021774
    node.y = 176.190917969
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.76560306549
    node.y = 175.190948486
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.7592754364
    node.y = 174.190963745
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.75294780731
    node.y = 173.190979004
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.74662065506
    node.y = 172.191009521
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.74029350281
    node.y = 171.19102478
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.73396587372
    node.y = 170.191040039
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.72763872147
    node.y = 169.191055298
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.72131109238
    node.y = 168.191085815
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.71498394012
    node.y = 167.191101074
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.70865631104
    node.y = 166.191116333
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.70232915878
    node.y = 165.191146851
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.69600152969
    node.y = 164.191162109
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.68967437744
    node.y = 163.191177368
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.68334674835
    node.y = 162.191207886
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.6770195961
    node.y = 161.191223145
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.67069196701
    node.y = 160.191238403
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.66436481476
    node.y = 159.191268921
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.65803718567
    node.y = 158.19128418
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.65171003342
    node.y = 157.191299438
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 5.64785051346
    node.y = 156.581314087
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_12():
    """
    Test landmarks of Town01
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 77.15
    node.y = 1.95
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 77.15
    node.y = 1.95
    node.z = 0.0
    nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = 79.38
    node.y = 1.95
    node.z = 0.0
    nodes.append(node)

    return nodes

def dataSet_13():
    """
    Testing way order
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 
    node.y = 
    node.z = 0.0
    nodes.append(node)

    return nodes

def draw_waypoints():
    # Init node
    rospy.init_node("debug_way_node", anonymous=True)
    rate = rospy.Rate(10)

    carla_map = util_module.get_map("Town03")

    data = dataSet_12()
    waypoints_marker_1 = markers_module.get_nodes(
        data, [1,0,0], "1", 8, 0.5, 1, 0.2)

    # data = dataSet_6()
    # waypoints_marker_2 = markers_module.get_nodes(
    #     data, [0,0,1], "2", 4, 0.5, 0, 0.2)

    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker_1)
        # waypoints_visualizator_pub.publish(waypoints_marker_2)
        rate.sleep()

# for node in main_contour:
    #     print("\tnode = monitor_classes.Node3D()\n"
    #             "\tnode.x = {}\n"
    #             "\tnode.y = {}\n"
    #             "\tnode.z = 0\n"
    #             "\tnodes.append(node)\n".format(node.x,
    #             node.y))
    # print("ey")

# print("\n\n\n")
            # for waypoint in way:
            #     print("    node = monitor_classes.Node3D()\n"
            #             "    node.x = {}\n"
            #             "    node.y = {}\n"
            #             "    node.z = {}\n"
            #             "    nodes.append(node)\n".format(waypoint.transform.location.x,
            #             waypoint.transform.location.y, waypoint.transform.location.z))
            
if __name__ == '__main__':
    draw_waypoints()