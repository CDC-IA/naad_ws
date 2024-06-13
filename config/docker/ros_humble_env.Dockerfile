FROM ros:humble-ros-core as base_image

    RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        ros-humble-xacro \
        ros-humble-robot-state-publisher \
        ros-humble-joint-state-publisher-gui \
        git \
        python3-colcon-common-extensions \
        python3-setuptools && \
        apt-get clean

    WORKDIR /home

    COPY config/docker/01_configuring_workspace.sh scripts/01_configuring_workspace.sh
    
    RUN bash scripts/01_configuring_workspace.sh