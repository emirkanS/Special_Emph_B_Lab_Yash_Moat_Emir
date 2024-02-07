# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\Emphasis_B\Labs\Lab_4\Lab_4_Exercise_2\platform_project\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\Emphasis_B\Labs\Lab_4\Lab_4_Exercise_2\platform_project\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {platform_project}\
-hw {D:\Emphasis_B\Labs\Lab_4\lab_1_exercise_1_hardware_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {D:/Emphasis_B/Labs/Lab_4/Lab_4_Exercise_2}

platform write
platform generate -domains 
platform active {platform_project}
platform generate
