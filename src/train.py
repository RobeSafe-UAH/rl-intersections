import os

import argparse
from datetime import datetime

from stable_baselines3 import DQN, PPO, A2C
from stable_baselines3.common.monitor import Monitor

from train_config import CustomCombinedExtractor, SaveOnBestTrainingRewardCallback

argparser = argparse.ArgumentParser(
    description='Train Agent')
argparser.add_argument(
    '--model',
    metavar='NAME',
    default='PPO',
    help='model (default: "PPO")')
argparser.add_argument(
    '--env',
    metavar='NAME',
    default='IntersectionSumoEnv',
    help='env (default: "IntersectionSumoEnv")')
argparser.add_argument(
    '--pretrained',
    metavar='NAME',
    default='no',
    help='env (default: "no")')
argparser.add_argument(
    '--timesteps',
    metavar='N',
    type=int,
    default=10000000,
    help='timesteps (default: 1000)')
args = argparser.parse_args()

# Define the logs and model paths
log_dir = os.path.join('Training', 'Logs')
model_dir = os.path.join('Training', 'Models')
save_path = os.path.join(model_dir, '{}_{}_{}'.format(args.env, args.model, datetime.now()))

# Create the environment
if args.env == "IntersectionFeatures":
    from Intersection.IntersectionSumoEnvFeatures import CustomEnv
    policy_kwargs = dict(
    features_extractor_class=CustomCombinedExtractor,
    net_arch=[dict(pi=[128, 128], vf=[128, 128])]
    )   
    policy = "MultiInputPolicy"
elif args.env == "IntersectionCarlaFeatures":
    from Intersection.IntersectionCarlaEnvFeatures import CustomEnv
    policy_kwargs = dict(
    features_extractor_class=CustomCombinedExtractor,
    net_arch=[dict(pi=[128, 128], vf=[128, 128])]
    )   
    policy = "MultiInputPolicy"
elif args.env == "Intersection":
    from Intersection.IntersectionSumoEnv import CustomEnv
    policy_kwargs = net_arch=[dict(pi=[128, 128], vf=[128, 128])]
    policy = "MlpPolicy"
elif args.env == "HighwayFeatures":
    from Highway.HighwaySumoEnvFeatures import CustomEnv
    policy_kwargs = dict(
    features_extractor_class=CustomCombinedExtractor,
    net_arch=[dict(pi=[128, 128], vf=[128, 128])]
    )   
    policy = "MultiInputPolicy"
elif args.env == "DoubleIntersection":
    from DoubleIntersection.DoubleIntersectionEnv import CustomEnv
    policy_kwargs = net_arch=[dict(pi=[128, 128], vf=[128, 128])]
    policy = "MlpPolicy"
elif args.env == "HighwayCarla":
    from HighwayCarla.HighwayCarlaEnv import CustomEnv
    policy_kwargs = net_arch=[dict(pi=[128, 128], vf=[128, 128])]
    policy = "MlpPolicy"
    
env = CustomEnv(render=False)
env = Monitor(env, model_dir)

# Callback definition
callback = SaveOnBestTrainingRewardCallback(check_freq=20, log_dir=model_dir, save_path=save_path)

print("-----   ",args.model," model selected.   -----")
print("-----   ",args.env," selected.   -----")
print("-----   Pretrained: ",args.pretrained,".   -----")

if args.model == "PPO": 
    if args.pretrained == "no":
        model = PPO(policy, env, verbose = 1, tensorboard_log=log_dir)
    else:
        model = PPO.load(os.path.join(model_dir, '{}_{}_'.format(args.env, args.model)), env=env)

elif args.model == "DQN":
    if args.pretrained == "no":
        model = DQN(policy, env, verbose = 1, tensorboard_log=log_dir)
    else:
        model = DQN.load(os.path.join(model_dir, '{}_{}_'.format(args.env, args.model)), env=env)

elif args.model == "A2C":
    if args.pretrained == "no":
        model = A2C(policy, env, verbose = 1, tensorboard_log=log_dir)
    else:
        model = A2C.load(os.path.join(model_dir, '{}_{}_'.format(args.env, args.model)), env=env)
    
print("Model Policy:\n",model.policy)
model.learn(total_timesteps=args.timesteps, callback=callback)
model.save(os.path.join(model_dir, 'last'))
