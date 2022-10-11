"""
Test initialization of monitor_classes.Lane object
"""
import sys 
import os
import glob

sys.path.insert(0, '/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/t4ac_map_monitor/src')
import monitor_classes

lane = monitor_classes.Lane()
print(lane)