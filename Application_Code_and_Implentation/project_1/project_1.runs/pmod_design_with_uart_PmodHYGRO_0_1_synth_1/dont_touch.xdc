# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.srcs/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/pmod_design_with_uart_PmodHYGRO_0_1.xci
# IP: The module: 'pmod_design_with_uart_PmodHYGRO_0_1' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_iic_0_0/PmodHYGRO_axi_iic_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_iic_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_iic_0_0} -quiet] -quiet

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_timer_0_0/PmodHYGRO_axi_timer_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_timer_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_timer_0_0} -quiet] -quiet

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_pmod_bridge_0_0/PmodHYGRO_pmod_bridge_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodHYGRO_pmod_bridge_0_0} -quiet] -quiet

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_xlconstant_0_0/PmodHYGRO_xlconstant_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_xlconstant_0_0 || ORIG_REF_NAME==PmodHYGRO_xlconstant_0_0} -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_iic_0_0/PmodHYGRO_axi_iic_0_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_iic_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_iic_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_iic_0_0/PmodHYGRO_axi_iic_0_0_ooc.xdc

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/pmod_design_with_uart_PmodHYGRO_0_1_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'pmod_design_with_uart_PmodHYGRO_0_1'. Do not add the DONT_TOUCH constraint.
set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'pmod_design_with_uart_PmodHYGRO_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_timer_0_0/PmodHYGRO_axi_timer_0_0.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_timer_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_timer_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_timer_0_0/PmodHYGRO_axi_timer_0_0_ooc.xdc

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_pmod_bridge_0_0/PmodHYGRO_pmod_bridge_0_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodHYGRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodHYGRO_pmod_bridge_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_pmod_bridge_0_0/src/pmod_concat_ooc.xdc

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.srcs/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/pmod_design_with_uart_PmodHYGRO_0_1.xci
# IP: The module: 'pmod_design_with_uart_PmodHYGRO_0_1' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_iic_0_0/PmodHYGRO_axi_iic_0_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_iic_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_iic_0_0} -quiet] -quiet

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_timer_0_0/PmodHYGRO_axi_timer_0_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_timer_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_timer_0_0} -quiet] -quiet

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_pmod_bridge_0_0/PmodHYGRO_pmod_bridge_0_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodHYGRO_pmod_bridge_0_0} -quiet] -quiet

# IP: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_xlconstant_0_0/PmodHYGRO_xlconstant_0_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==PmodHYGRO_xlconstant_0_0 || ORIG_REF_NAME==PmodHYGRO_xlconstant_0_0} -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_iic_0_0/PmodHYGRO_axi_iic_0_0_board.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_iic_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_iic_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_iic_0_0/PmodHYGRO_axi_iic_0_0_ooc.xdc

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/pmod_design_with_uart_PmodHYGRO_0_1_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'pmod_design_with_uart_PmodHYGRO_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'pmod_design_with_uart_PmodHYGRO_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_timer_0_0/PmodHYGRO_axi_timer_0_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodHYGRO_axi_timer_0_0 || ORIG_REF_NAME==PmodHYGRO_axi_timer_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_axi_timer_0_0/PmodHYGRO_axi_timer_0_0_ooc.xdc

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_pmod_bridge_0_0/PmodHYGRO_pmod_bridge_0_0_board.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodHYGRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodHYGRO_pmod_bridge_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/Users/a/Desktop/MoatazProject/project_1/project_1.gen/sources_1/bd/pmod_design_with_uart/ip/pmod_design_with_uart_PmodHYGRO_0_1/src/PmodHYGRO_pmod_bridge_0_0/src/pmod_concat_ooc.xdc