import os
import argparse
from stable_baselines3 import PPO, DDPG, A2C
from datetime import datetime

argparser = argparse.ArgumentParser(
    description='Test Agent')
argparser.add_argument(
    '--model',
    metavar='NAME',
    default='PPO',
    help='model (default: "PPO")')
argparser.add_argument(
    '--scenario',
    metavar='NAME',
    default='',
    help='env (default: "")')
argparser.add_argument(
    '--env',
    metavar='NAME',
    default='IntersectionFeatures',
    help='env (default: "Intersection")')
args = argparser.parse_args()

# Create the environment
if args.env == "Intersection":
    from Intersection.IntersectionSumoEnv import CustomEnv
elif args.env == "IntersectionFeatures":
    from Intersection.IntersectionSumoEnvFeatures import CustomEnv
elif args.env == "IntersectionCarlaFeatures":
    from Intersection.IntersectionCarlaEnvFeatures import CustomEnv

env = CustomEnv(render=True)

print("-----   ",args.model," model selected.   -----")
print("-----   ",args.env," selected.   -----")
print("-----   Scenario: ",args.scenario,".   -----")
    
# Define the model paths
Path = os.path.join('Training', 'Models', '{}_{}_{}'.format(args.env, args.model, args.scenario))
    
if args.model == "PPO":
    model = PPO.load(Path, env=env)
elif args.model == "DDPG":
    model = DDPG.load(Path, env=env)
elif args.model == "A2C":
    model = A2C.load(Path, env=env)


episodes = 100
success = 0

curr_dt = datetime.now()
timestamp = int(round(curr_dt.timestamp()))

for episode in range(1, episodes+1):
    obs = env.reset()
    done = False
    score = 0

    while not done:
        action, _ = model.predict(obs)
        # print("action: ",action)
        # print("obs: ",obs)
        obs, reward, done, info = env.step(action)
        score += reward
    
    if(score > 1):
        success = success + 1 

curr_dt = datetime.now()
timenow = int(round(curr_dt.timestamp()))
t = (timenow-timestamp)/episodes
success = success/episodes
print("percentage success: ",success, " time: ",t)