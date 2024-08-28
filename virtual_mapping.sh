#!/usr/bin/bash
gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 launch agribot_description gazebo.launch.py"&
# gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard /cmd_vel:=/diff_cont/cmd_vel_unstamped"&
gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard"&
gnome-terminal -- bash -c "cd ~/agribot_fertilizer && rviz2"&
gnome-terminal -- bash -c "cd ~/agribot_fertilizer && source install/setup.bash && ros2 launch agribot_description virtual_rtabmap.launch.py"&
gnome-terminal -- bash -c "cd ~/agribot_fertilizer/src/agribot_description/scripts && chmod +x plant_points.py && cd ~/agribot_fertilizer && source install/setup.bash && ros2 run agribot_description plant_points.py"
