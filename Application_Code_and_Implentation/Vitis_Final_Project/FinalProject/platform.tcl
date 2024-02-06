# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\a\Desktop\VitisFULL\Vitis_Final_Project\FinalProject\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\a\Desktop\VitisFULL\Vitis_Final_Project\FinalProject\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {FinalProject}\
-hw {C:\Users\a\Desktop\MoatazProject\project_1\pmod_design_with_uart_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {C:/Users/a/Desktop/VitisFULL/Vitis_Final_Project}

platform write
platform generate -domains 
platform active {FinalProject}
platform generate
platform clean
platform generate
platform active {FinalProject}
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform active {FinalProject}
platform config -updatehw {D:/HWEProjectALLFiles/project_1/project_1_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
