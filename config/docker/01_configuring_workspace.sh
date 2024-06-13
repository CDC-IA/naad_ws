#!/bin/bash

# ROS2 initial setup
source /opt/ros/humble/setup.bash

# Creating ros2_ws (ROS2 workspace) folder
mkdir -p /home/ros2_ws/src

# building workspace
cd /home/ros2_ws
colcon build

# Cloning repositories
cd /home/ros2_ws/src
#git clone

# Building imported ros packages
cd /home/ros2_ws
colcon build

# Final message
echo "ROS2 Humble Workspace configured"