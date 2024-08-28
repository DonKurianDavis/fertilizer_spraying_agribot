#!/usr/bin/bash
gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 launch bot gazebo_launch.py"&
# gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard /cmd_vel:=/diff_cont/cmd_vel_unstamped"&
gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard"&
gnome-terminal -- bash -c "rviz2"&
# gnome-terminal -- bash -c "ros2 launch rtabmap_launch rtabmap.launch.py database_path:=virtual.db depth_topic:=/camera/depth/image_raw use_sim_time:=true rgb_topic:=/camera/image_raw camera_info_topic:=/camera/camera_info approx_sync:=true localization:=true"&
gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 launch bot virtual_rtabmap_launch.py localization:=true"&
# gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 run bot recorrected_map.py"&
# gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 run bot recorrected_odom.py"&
gnome-terminal -- bash -c "ros2 run depthimage_to_laserscan depthimage_to_laserscan_node --ros-args -r depth:=/camera/depth/image_raw -r depth_camera_info:=/camera/depth/camera_info -r scan:=/scan"&
gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 launch bot navigation_launch.py use_sim_time:=True"
