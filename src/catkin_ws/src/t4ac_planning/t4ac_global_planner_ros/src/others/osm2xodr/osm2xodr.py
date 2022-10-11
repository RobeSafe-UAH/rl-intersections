import glob 
import os
import sys

import os 

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass

import carla

osm_path = "osm_test.osm"
xodr_path = "xodr_test.xodr"

with open(osm_path, 'r') as f:
    osm_string = f.read()

settings = carla.Osm2OdrSettings()
xodr_string = carla.Osm2Odr.convert(osm_string, settings)

with open(xodr_path, 'w') as f:
    f.write(xodr_string)