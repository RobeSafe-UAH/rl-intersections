
"use strict";

let Transform = require('./Transform.js');
let Bounding_Box_3D = require('./Bounding_Box_3D.js');
let DM_pose = require('./DM_pose.js');
let Bounding_Box_2D = require('./Bounding_Box_2D.js');
let Traffic_Sign_List = require('./Traffic_Sign_List.js');
let DM_posestamped = require('./DM_posestamped.js');
let Rotation = require('./Rotation.js');
let RegulatoryElement = require('./RegulatoryElement.js');
let DM_path = require('./DM_path.js');
let MonitorizedLanes = require('./MonitorizedLanes.js');
let BEV_trackers_list = require('./BEV_trackers_list.js');
let Way = require('./Way.js');
let Location = require('./Location.js');
let Landmark = require('./Landmark.js');
let GT_3D_Object = require('./GT_3D_Object.js');
let BEV_tracker = require('./BEV_tracker.js');
let Obstacle = require('./Obstacle.js');
let Path = require('./Path.js');
let Lane = require('./Lane.js');
let BEV_detection = require('./BEV_detection.js');
let GT_3D_Object_list = require('./GT_3D_Object_list.js');
let Obstacles_list = require('./Obstacles_list.js');
let Waypoint = require('./Waypoint.js');
let CarControl = require('./CarControl.js');
let BEV_detections_list = require('./BEV_detections_list.js');
let MonitorizedRegElem = require('./MonitorizedRegElem.js');
let Bounding_Box_2D_list = require('./Bounding_Box_2D_list.js');
let Node = require('./Node.js');
let Traffic_Sign = require('./Traffic_Sign.js');
let Bounding_Box_3D_list = require('./Bounding_Box_3D_list.js');

module.exports = {
  Transform: Transform,
  Bounding_Box_3D: Bounding_Box_3D,
  DM_pose: DM_pose,
  Bounding_Box_2D: Bounding_Box_2D,
  Traffic_Sign_List: Traffic_Sign_List,
  DM_posestamped: DM_posestamped,
  Rotation: Rotation,
  RegulatoryElement: RegulatoryElement,
  DM_path: DM_path,
  MonitorizedLanes: MonitorizedLanes,
  BEV_trackers_list: BEV_trackers_list,
  Way: Way,
  Location: Location,
  Landmark: Landmark,
  GT_3D_Object: GT_3D_Object,
  BEV_tracker: BEV_tracker,
  Obstacle: Obstacle,
  Path: Path,
  Lane: Lane,
  BEV_detection: BEV_detection,
  GT_3D_Object_list: GT_3D_Object_list,
  Obstacles_list: Obstacles_list,
  Waypoint: Waypoint,
  CarControl: CarControl,
  BEV_detections_list: BEV_detections_list,
  MonitorizedRegElem: MonitorizedRegElem,
  Bounding_Box_2D_list: Bounding_Box_2D_list,
  Node: Node,
  Traffic_Sign: Traffic_Sign,
  Bounding_Box_3D_list: Bounding_Box_3D_list,
};
