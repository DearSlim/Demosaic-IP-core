`timescale 1ns/1ps
module tb_calG_RB#(
	parameter lengthTotal = 512 * 768,
			  vblank_length = 49,
			  hblank_length = 19,
			  Lines = 768,
			  Cols = 512	  
)
(	output wire CLK,
	output wire RSTN,
	output wire HSYNC,
	output wire VSYNC,
	output wire [7:0] O_DATA  );
reg rstn;
reg clk;
reg hsync;
reg vsync;
reg [3:0] state;  //FSM
parameter vblank = 4'b0000,
		  hblank = 4'b0001,
		  data_en = 4'b0010,
		  over = 4'b0011;
initial begin
              rstn  = 0;
              clk = 0;
              #30 rstn = 1;    
			  forever #5 clk = ~clk;
end
reg [7:0] o_data;
assign O_DATA = o_data;
reg [7:0] mem [lengthTotal:0];
integer col;
integer line;
integer i;
integer cntblank;
assign CLK = clk;
assign RSTN = rstn;
assign HSYNC = hsync;
assign VSYNC = vsync;
initial begin
    $readmemh("E://graphLibrary//Bayer_test.dat", mem);
end	
always @(posedge CLK or negedge RSTN) begin
	if(!rstn) begin
		o_data <= 0;
		i <= 0;
		vsync <= 0;
		hsync <= 0;
		cntblank <= 0;
		col <= 0;
		line <= 0;
		state <= vblank;
	end
	else begin
		case (state)
			vblank: begin
				vsync <= 0;
				if (cntblank == vblank_length) begin
					cntblank <= 0;
					state <= hblank;
				end
				else begin
					cntblank <= cntblank + 1;
				end
			end
			hblank: begin
				vsync <= 1;
				hsync <= 0;
				if (cntblank == hblank_length) begin
					cntblank <= 0;
					state <= (line == Lines - 1) ? vblank : data_en;
				end
				else begin
					cntblank <= cntblank + 1;
				end				
			end
			data_en: begin
				hsync <= 1;
				o_data <= mem[i];
				i <= i+1;
				col <= col + 1;
				if (col == Cols - 1) begin
					col <= 0;
					line <= line + 1;
					state <= (line == Lines) ? over: hblank;
				end
				else begin
					state <= state;
				end
			end
			over: begin
				vsync <= 0;
				hsync <= 0;
			end
		endcase
	end
end
endmodule
