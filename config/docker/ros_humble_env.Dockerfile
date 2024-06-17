FROM ros:humble-ros-core as base_image

    RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        ros-humble-xacro \
        ros-humble-robot-state-publisher \
        ros-humble-joint-state-publisher-gui \
        ros-humble-gazebo-ros \
        ros-humble-gazebo-ros-packages \
        ros-humble-gz-ros \
        ros-humble-gazebo-ros2-control \
        ros-humble-ign-ros2-control \
        #ros-humble-gz-ros2-control para o JAZZY \ 
        ros-humble-ros2-control \
        ros-humble-ros2-controllers \
        ros-humble-ros-gz-bridge \
        git \
        python3-colcon-common-extensions \
        python3-setuptools && \
        apt-get clean

    WORKDIR /home

    COPY config/docker/01_configuring_workspace.sh scripts/01_configuring_workspace.sh
    
    RUN bash scripts/01_configuring_workspace.sh