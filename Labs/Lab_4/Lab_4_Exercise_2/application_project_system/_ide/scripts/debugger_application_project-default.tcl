# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Emphasis_B\Labs\Lab_4\Lab_4_Exercise_2\application_project_system\_ide\scripts\debugger_application_project-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Emphasis_B\Labs\Lab_4\Lab_4_Exercise_2\application_project_system\_ide\scripts\debugger_application_project-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys A7 -100T 210292B61C74A" && level==0 && jtag_device_ctx=="jsn-Nexys A7 -100T-210292B61C74A-13631093-0"}
fpga -file D:/Emphasis_B/Labs/Lab_4/Lab_4_Exercise_2/application_project/_ide/bitstream/lab_1_exercise_1_hardware_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw D:/Emphasis_B/Labs/Lab_4/Lab_4_Exercise_2/platform_project/export/platform_project/hw/lab_1_exercise_1_hardware_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/Emphasis_B/Labs/Lab_4/Lab_4_Exercise_2/application_project/Debug/application_project.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
