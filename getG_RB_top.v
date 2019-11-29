`timescale 1ns/1ps
module getG_RB_top(
	output wire hsync,
	output wire [7:0] data2,
	output wire en1,
	output wire clk,
	output wire rstn
);
wire clk;
wire rstn;
wire hsync;
wire vsync;
wire [7:0] data1;
wire [7:0] data2;
wire en1;
	tb_calG_RB tb1(
		.CLK(clk),
		.RSTN(rstn),
		.HSYNC(hsync),
		.VSYNC(vsync),
		.O_DATA(data1)	);
	Demosaic_getBayer getBayer(
		.PCLK(clk),
		.RSTN(rstn),
		.VSYNC(vsync),
		.HSYNC(hsync),
		.BAYERDATA(data1),
		.CAL_EN(en1),
		.O_DATA(data2)	);
endmodule