#! /bin/bash

xhost +
dorothy_packages=""

docker run  --privileged --network host --rm -it  --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --env="ROS_DOMAIN_ID=$ROS_DOMAIN_ID" \
--volume="/dev:/dev" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
--volume="$ROS2_DOCKER_WS/src:/home/ros/dev_ws/src:rw" --volume="$ROS2_DOCKER_WS/install:/home/ros/dev_ws/install:rw" \
--volume="$ROS2_DOCKER_WS/scripts:/home/ros/dev_ws/scripts:rw" --volume="$ROS2_DOCKER_WS/docker_save:/home/ros/dev_ws/docker_save:rw" \
--volume="$ROS2_DOCKER_WS/docker_build:/home/ros/dev_ws/build:rw" \
--user "$(id -u):$(id -g)" ros2-control \
/bin/bash -c -i "cd ~/dev_ws; colcon build --symlink-install --packages-select $dorothy_packages" 
