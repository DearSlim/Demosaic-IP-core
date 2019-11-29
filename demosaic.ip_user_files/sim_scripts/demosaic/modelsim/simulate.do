onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xbip_utils_v3_0_8 -L c_reg_fd_v12_0_4 -L c_mux_bit_v12_0_4 -L c_shift_ram_v12_0_11 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.demosaic xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {demosaic.udo}

run -all

quit -force
