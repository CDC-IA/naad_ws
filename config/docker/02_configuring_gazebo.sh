#!/bin/bash

# Source and build custom packages
gazebo_text="# Setting GAZEBO
export LIBGL_ALWAYS_SOFTWARE=1
export GAZEBO_MODEL_PATH=/home/ros2_ws/install/senai_models/share
export GZ_SIM_RESOURCE_PATH=/home/ros2_ws/install/senai_models/share"

echo "$gazebo_text" >> ~/.bashrc
source ~/.bashrc
