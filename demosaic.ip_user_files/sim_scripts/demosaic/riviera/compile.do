vlib work
vlib riviera

vlib riviera/xbip_utils_v3_0_8
vlib riviera/c_reg_fd_v12_0_4
vlib riviera/c_mux_bit_v12_0_4
vlib riviera/c_shift_ram_v12_0_11
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_8 riviera/xbip_utils_v3_0_8
vmap c_reg_fd_v12_0_4 riviera/c_reg_fd_v12_0_4
vmap c_mux_bit_v12_0_4 riviera/c_mux_bit_v12_0_4
vmap c_shift_ram_v12_0_11 riviera/c_shift_ram_v12_0_11
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_8 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/4173/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_4 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/e6f0/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work c_mux_bit_v12_0_4 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/660b/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_11 -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ipshared/7c1c/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_0/sim/demosaic_c_shift_ram_3_0.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_1/sim/demosaic_c_shift_ram_3_1.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_2/sim/demosaic_c_shift_ram_3_2.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_3/sim/demosaic_c_shift_ram_3_3.vhd" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_c_shift_ram_3_4/sim/demosaic_c_shift_ram_3_4.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_tb_calG_RB_0_0/sim/demosaic_tb_calG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_getBayer_0_0/sim/demosaic_Demosaic_getBayer_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_pre_G_RB_0_0/sim/demosaic_Demosaic_pre_G_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_calG_RB_0_0/sim/demosaic_Demosaic_calG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/ip/demosaic_Demosaic_tb_writeG_RB_0_0/sim/demosaic_Demosaic_tb_writeG_RB_0_0.v" \
"../../../../demosaic.srcs/sources_1/bd/demosaic/sim/demosaic.v" \

vlog -work xil_defaultlib \
"glbl.v"

