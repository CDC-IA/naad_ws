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
git clone https://github.com/CDC-IA/senai_models.git -b humble

# Building imported ros packages
cd /home/ros2_ws
colcon build

# Source and build custom packages
ros_text="# ROS Humble Setup
source /opt/ros/foxy/setup.bash
source /home/ros2_ws/install/local_setup.bash
source /home/ros2_ws/install/setup.bash"

echo "$ros_text" >> ~/.bashrc
source ~/.bashrc

# Final message
echo "ROS2 Humble Workspace configured"