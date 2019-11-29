vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_0/sim/demosaic_c_shift_ram_3_0.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_1/sim/demosaic_c_shift_ram_3_1.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_2/sim/demosaic_c_shift_ram_3_2.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_3/sim/demosaic_c_shift_ram_3_3.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_4/sim/demosaic_c_shift_ram_3_4.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_tb_calG_RB_0_0/sim/demosaic_tb_calG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_getBayer_0_0/sim/demosaic_Demosaic_getBayer_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_pre_G_RB_0_0/sim/demosaic_Demosaic_pre_G_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_calG_RB_0_0/sim/demosaic_Demosaic_calG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_tb_writeG_RB_0_0/sim/demosaic_Demosaic_tb_writeG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/sim/demosaic.v" \

vlog -work xil_defaultlib \
"glbl.v"

