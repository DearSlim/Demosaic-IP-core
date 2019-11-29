// get data from Bayer, send it to first 5 shift ram 
module Demosaic_getBayer#(
	//Vblank and Hblank are included
	parameter Cols = 512,	
			  Lines = 768
)
(	input wire PCLK,
	input wire RSTN,
	input wire VSYNC,
	input wire HSYNC,
	input wire [7:0] BAYERDATA,
	output wire CAL_EN,
	output wire [7:0] O_DATA /*Link to Demosaic_pre_G_RB*/	);
//Count cols and lines, 5 lines to send a signal to send valid signal
reg [10:0] i;  //Lines
reg [10:0] j;  //Cols
wire rst;
reg o_vsync;
reg o_hsync;
reg [7:0] o_data;
reg cal_en;
assign CAL_EN = cal_en;
assign rst = !RSTN;
assign O_DATA = o_data;
assign O_VSYNC = o_vsync;
assign O_HSYNC = o_hsync;
// Drive: i, j, 
always @(posedge PCLK or posedge rst) begin
	if(rst) begin
		o_data <= 0;
		i <= 0;
		j <= 0;
		cal_en <= 0;
	end
	//
	else if (VSYNC && HSYNC) begin
		o_data <= BAYERDATA;
		if (j == Cols - 1 && i == 2) begin
			j <= 0;
			cal_en <= 1;
		end
		else if (j == Cols - 1) begin
			j <= 0;
			i <= i + 1;
		end
		else begin
			j <= j + 1;
		end
	end
	else if (!VSYNC) begin
		j <= 0;
		i <= 0;
		cal_en <= 0;
	end
	else begin
		o_data <= 0;
		o_hsync <= HSYNC;		
	end
end
endmodule