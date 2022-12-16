FROM althack/ros2:galactic-dev 

# ** [Optional] Uncomment this section to install additional packages. **
#
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get -y install --no-install-recommends ros-galactic-ros2-control \ 
        ros-galactic-gazebo-ros2-control
   
# RUN apt-get -y install --no-install-recommends ....

RUN echo "finished installing packages !! "
# not cleaning up to have apt up and going from the start
#    # Clean up
#    && apt-get autoremove -y \
#    && apt-get clean -y \
#    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# actions to be use in ros user and to start with ros user
ENV USERNAME=ros
USER $USERNAME

# Set up auto-source of workspace for ros user
ARG WORKSPACE="/home/${USERNAME}/dev_ws"
RUN mkdir $WORKSPACE
RUN chown ros:ros $WORKSPACE
#COPY ./scripts/* /tmp/
#RUN /tmp/setup_docker_env.sh
WORKDIR $WORKSPACE
RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ros/.bashrc
