#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import PoseStamped

class plant_coordinator(Node):
    goal_poses=[]
    def __init__(self):
        super().__init__("plant_point_placer")
        self.goal_pose_subscriber  = self.create_subscription(PoseStamped,"/goal_pose",self.plant_point_plotter,10)
    
    def plant_point_plotter(self, msg: PoseStamped):
        self.goal_poses.append([msg.pose.position.x+0.5,msg.pose.position.y,0.0,-0.707,0.0,0.0,0.707])
        self.goal_poses.append([msg.pose.position.x,msg.pose.position.y+0.5,0.0,0.0,0.0,0.0,1.0])
        self.goal_poses.append([msg.pose.position.x-0.5,msg.pose.position.y,0.0, 0.707,0.0,0.0,0.707])
        self.goal_poses.append([msg.pose.position.x,msg.pose.position.y-0.5,0.0,1.0,0.0,0.0,0.0])
        print(self.goal_poses)
        with open("landmarks/coordinated_for_bot.txt","w") as output:
            output.write(str(self.goal_poses))

if __name__ == '__main__':

    rclpy.init(args=None)
    node = plant_coordinator()
    rclpy.spin(node)
    rclpy.shutdown()