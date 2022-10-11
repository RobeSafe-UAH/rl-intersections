# Import GYM 
from this import d
from turtle import end_fill, st
from gym import Env
from gym.spaces import Discrete, Box, Dict, Tuple, MultiBinary, MultiDiscrete

# Import helpers
import os, sys
import numpy as np
from random import randint

#Import SUMO
from tkinter.messagebox import NO
if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")

import traci

class CustomEnv(Env):
    def __init__(self, render=False):
        self.N_actions = 2
        self.action_space = Discrete(self.N_actions)
        self.n_adversaries = 4  # 2 going up and 2 going down
        self.n_features = 2     # distance to intersection and speed
        self.lanes = 2
        self.observation_space = Dict({'ego':Box(0,1,shape=(self.n_features,)), 'adversaries':Box(0,1,shape=(self.n_adversaries*self.n_features,)),})
        self.state = self.observation_space.sample()

        self.timestep = 0.1

        if render:
            sumo = "sumo-gui"
        else:
            sumo = "sumo"

        sumoCmd = [
            sumo,
            "-c",
            "Intersection/sumo_config/intersection.sumocfg",
            "--step-length",
            str(self.timestep),
            "--collision.action",
            "warn",
            "--collision.mingap-factor",
            "3.5",
            "--collision.check-junctions",
            "--random",
            "true",
            "--no-warnings",
        ]

        traci.start(sumoCmd)

        self.egoCarID = "ego"
        self.egoCar = True

        self.state = self.reset()

    def step(self, action):

        if traci.simulation.getTime().is_integer():
            self._addCar()

        done = True
        for id in traci.vehicle.getIDList():
            if id == self.egoCarID:
                done = False
                break

        reward = 0
        if not done:            
            self._action(action)
            self.state = self._observation()
            self._collision()
            done, reward = self._reward(action)

        traci.simulationStep()

        info = {}

        return self.state, reward, done, info


    def reset(self):

        for id in traci.vehicle.getIDList():
            traci.vehicle.remove(id)
        traci.simulationStep()

        # Intersection type

        self.intersection = randint(0,2)    # 0 free, 1 traffic lights, 2 stops
        if self.intersection == 0:
            traci.trafficlight.setProgram('0',0)
        elif self.intersection == 1:
            traci.trafficlight.setProgram('0',1)
            traci.trafficlight.setPhase('0',randint(0,3))
        elif self.intersection == 2:
            traci.trafficlight.setProgram('0',0)

        self.time_car_added = traci.simulation.getTime()
        for i in range(200):
            if traci.simulation.getTime().is_integer():
                self._addCar()
            traci.simulationStep()

        self.egoCar = False
        self._addCar()
        self.egoCar = True
        traci.simulationStep()
        self.state = self._observation()
        self.time_reset = traci.simulation.getTime()

        # Reward parametres init
        self.collision = 0
        self.success = 0
        self.timeout = 0

        return self.state

    
    def _reward(self, action):
        
        done = False
        timeout = 200
        time = traci.simulation.getTime() - self.time_reset
        rt = 0
        x = traci.vehicle.getPosition(self.egoCarID)[0]
        v = traci.vehicle.getSpeed(self.egoCarID)

        if  time > timeout:
            self.timeout = 1
            done = True
        if  x > 540:
            self.success = 1
            done = True
        if self.collision:
            done = True
            
        ks = 1
        kc = -2
        kt = -0.2
        kv = 0.0002
        if done:
            rt = (kt * time) / timeout
        reward = ks * self.success + \
                 kc * self.collision + \
                 kv * v + \
                 rt
                 
        return done, reward

    def _addCar(self):
        if self.egoCar:
            if (traci.simulation.getTime() - self.time_car_added) > randint(4,8):   # 0 free, 1 traffic lights, 2 stops
                #Start a vehicle
                if self.lanes == 2:
                    idu = str(traci.simulation.getTime()) + "up"
                idd = str(traci.simulation.getTime()) + "down"
                if self.intersection == 0:
                    if self.lanes == 2:
                        traci.vehicle.addFull(idu, 'routeAdvUp', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType1')
                        traci.vehicle.setSpeedMode(idu, int('011111',2))  
                    traci.vehicle.addFull(idd, 'routeAdvDown', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType1')
                    traci.vehicle.setSpeedMode(idd, int('011111',2))   
                elif self.intersection == 1:
                    if self.lanes == 2:
                        traci.vehicle.addFull(idu, 'routeAdvUp', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType2')
                        traci.vehicle.setSpeedMode(idu, int('011111',2))
                    traci.vehicle.addFull(idd, 'routeAdvDown', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType2')
                    traci.vehicle.setSpeedMode(idd, int('011111',2))
                elif self.intersection == 2:
                    if self.lanes == 2:
                        traci.vehicle.addFull(idu, 'routeAdvUp', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType3')
                        traci.vehicle.setSpeedMode(idu, int('110110',2))
                    traci.vehicle.addFull(idd, 'routeAdvDown', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType3')
                    traci.vehicle.setSpeedMode(idd, int('110110',2))
                
                if self.lanes == 2:
                    traci.vehicle.setSpeed(idu, randint(3,5))  
                traci.vehicle.setSpeed(idd, randint(3,5))
                self.time_car_added = traci.simulation.getTime()
        else:
            #Start the ego vehicle 
            traci.vehicle.addFull(self.egoCarID, 'routeEgo', depart=None, departPos='0', departSpeed='0', departLane='0', typeID='vType0')
            traci.vehicle.setSpeedMode(self.egoCarID, int('00000',2))
            traci.vehicle.setSpeed(self.egoCarID, 0)
        pass

    def _observation(self):
        self.state["adversaries"] = np.array([1] * self.n_adversaries*self.n_features)
        self.state["ego"] = np.array([1] * self.n_features)
        v_ego=d_ego=1
        d_up = []
        v_up = []
        d_down = []
        v_down = []

        for id in traci.vehicle.getIDList():
            if id == self.egoCarID:
                # ego vehicle velocity
                v_ego = traci.vehicle.getSpeed(self.egoCarID) / 5

                # distance to junction
                d_ego = (traci.junction.getPosition('51')[1] - traci.vehicle.getPosition(self.egoCarID)[0] )/ traci.junction.getPosition('51')[1]
                if d_ego < 0:
                    d_ego = 0
                break

        for id in traci.vehicle.getIDList():
            if id[-1] == "p": #vehicle going up
                d_up.append(-(traci.vehicle.getPosition(id)[1] - 508.35) / 100)
                v_up.append(traci.vehicle.getSpeed(id) / 5)

            if id[-1] == "n": #vehicle going down
                d_down.append((traci.vehicle.getPosition(id)[1] - 508.35) / 100)
                v_down.append(traci.vehicle.getSpeed(id) / 5)
        
        for i in range(int(self.n_adversaries/self.n_features)):
            d_up.append(1)
            d_down.append(1)
            v_up.append(1)
            v_down.append(1)

        #Get the positive values (closer distances to the intersection)
        d_up = np.array(d_up)[np.array(d_up)>0]
        d_down = np.array(d_down)[np.array(d_down)>0]

        v_up_i = np.array(v_up).size - d_up.size
        v_down_i = np.array(v_down).size - d_down.size

        self.state["adversaries"] = np.array([d_down[0],v_down[v_down_i],d_down[1],v_down[v_down_i+1],d_up[0],v_up[v_up_i],d_up[1],v_up[v_up_i+1]])

        self.state["ego"] = np.array([v_ego, d_ego])   

        return self.state

    def _action(self, action):
        # set actions of ego-vehicle
        if action == 0:  #drive
            traci.vehicle.setSpeedMode(self.egoCarID, int('00000',2))
            traci.vehicle.setSpeed(self.egoCarID, 5)
        elif action == 1:   #stop
            traci.vehicle.setSpeedMode(self.egoCarID, int('00000',2))
            traci.vehicle.setSpeed(self.egoCarID, 0)
        pass

    def _collision(self):
        if self.egoCarID in traci.simulation.getCollidingVehiclesIDList():
            self.collision = True
        pass
        



