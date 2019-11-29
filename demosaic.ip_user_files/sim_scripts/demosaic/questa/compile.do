vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xbip_utils_v3_0_8
vlib questa_lib/msim/c_reg_fd_v12_0_4
vlib questa_lib/msim/c_mux_bit_v12_0_4
vlib questa_lib/msim/c_shift_ram_v12_0_11
vlib questa_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_8 questa_lib/msim/xbip_utils_v3_0_8
vmap c_reg_fd_v12_0_4 questa_lib/msim/c_reg_fd_v12_0_4
vmap c_mux_bit_v12_0_4 questa_lib/msim/c_mux_bit_v12_0_4
vmap c_shift_ram_v12_0_11 questa_lib/msim/c_shift_ram_v12_0_11
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_8 -64 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/4173/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_4 -64 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/e6f0/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work c_mux_bit_v12_0_4 -64 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/660b/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_11 -64 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/7c1c/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_0/sim/demosaic_c_shift_ram_3_0.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_1/sim/demosaic_c_shift_ram_3_1.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_2/sim/demosaic_c_shift_ram_3_2.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_3/sim/demosaic_c_shift_ram_3_3.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_4/sim/demosaic_c_shift_ram_3_4.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_tb_calG_RB_0_0/sim/demosaic_tb_calG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_getBayer_0_0/sim/demosaic_Demosaic_getBayer_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_pre_G_RB_0_0/sim/demosaic_Demosaic_pre_G_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_calG_RB_0_0/sim/demosaic_Demosaic_calG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_tb_writeG_RB_0_0/sim/demosaic_Demosaic_tb_writeG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/sim/demosaic.v" \

vlog -work xil_defaultlib \
"glbl.v"

