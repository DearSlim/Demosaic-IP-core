//Calculate G for RB, 1st step of making demosaic
module Demosaic_calG_RB#(
	parameter Cols = 512,
			  Lines = 768			  
)
(	input wire INCLK,
	input wire RSTN,
	input wire IN_EN,  //Enable data collection
	input wire [7:0] UU,
	input wire [7:0] UPDATA,
	input wire [7:0] MID,
	input wire [7:0] DOWNDATA,
	input wire [7:0] DD,
	input wire [7:0] LEFTDATA,
	input wire [7:0] LL,
	input wire [7:0] RR,
	input wire [7:0] RIGHTDATA,	
	output wire O_EN,
	output wire [23:0] O_DATA	);
//FSM to distinguish it's B/G or R
wire rst;
assign rst = !RSTN;
reg [1:0] BGR;
//For transmitting BGR data in pipeline, 0:B, 1:R
reg [1:0] RGB1;
reg [1:0] RGB2;
reg [1:0] RGB3;
reg [1:0] RGB4;
//Distinguish whether it's even or odd line
reg is_even;
//EN signal transmits from layer to layer;
reg layer1_en;
reg layer2_en;
reg layer3_en;
reg layer4_en;
reg [10:0] cntCol;
reg [10:0] cntLine;
reg o_en;
reg [7:0] updata;
reg [7:0] downdata;
reg [7:0] leftdata;
reg [7:0] rightdata;
reg [7:0] mid;
reg [7:0] uu;
reg [7:0] dd;
reg [7:0] ll;
reg [7:0] rr;
reg [7:0] resultG;
reg [10:0] dH;
reg [10:0] dV;
reg [23:0] o_data;
assign O_DATA = o_data;
//Temp series are shift registers for storing temp data in pipeline
reg [7:0] tempA1;
reg [7:0] tempB1;
reg [7:0] tempC1;
reg [7:0] tempD1;
reg [7:0] tempE1;
reg [7:0] tempF1;
reg [7:0] tempG1;
reg [7:0] tempH1;
reg [7:0] tempA2;
reg [7:0] tempB2;
reg [7:0] tempC2;
reg [7:0] tempD2;
reg [7:0] tempE2;
reg [7:0] tempF2;
reg [7:0] tempG2;
reg [7:0] tempH2;
reg [7:0] tempA3;
reg [7:0] tempB3;
reg [7:0] tempC3;
reg [7:0] tempE3;
reg [7:0] tempF3;
reg [7:0] tempG3;
reg [7:0] tempH3;
reg [7:0] G_temp;
reg [7:0] G0;
reg [7:0] G1;
reg [7:0] G2;
reg [7:0] G3;
reg G_Ostatus;
reg G_Ostatus0;
reg G_Ostatus1;
reg G_Ostatus2;
reg G_Ostatus3;
assign O_EN = o_en;
parameter is_B = 2'b00,
		  is_G = 2'b01,
		  is_R = 2'b10;
//Control FSM & store original data
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		layer1_en <= 0;
		is_even <= 0;
		BGR <= is_R;
		RGB1 <= 1;
		G_Ostatus <= 0;
		cntCol <= 0;
		updata <= 0;
		downdata <= 0;
		leftdata <= 0;
		rightdata <= 0;
		uu <= 0;
		dd <= 0;
		ll <= 0;
		rr <= 0;
		mid <= 0;
	end
	else if (IN_EN) begin
		uu <= UU;
		dd <= DD;
		ll <= LL;
		rr <= RR;
		mid <= MID;
		updata <= UPDATA;
		downdata <= DOWNDATA;
		leftdata <= LEFTDATA;
		rightdata <= RIGHTDATA;
		layer1_en <= 1;
		case (BGR)
			is_R: begin
				RGB1 <= 1;
				G_Ostatus <= 0;				
				BGR <= is_G;
			end
			is_B: begin
				RGB1 <= 0;
				G_Ostatus <= 0;				
				BGR <= (cntCol == Cols - 1) ? is_R : is_G;
			end
			is_G: begin
				G_temp <= mid;
				//Add a synchronization variable to synchronize the output of original G
				G_Ostatus <= 1;
				BGR <= is_even ? is_B : is_R;
			end
		endcase
		if (cntCol == Cols - 1) begin
			cntCol <= 0;
			if(cntLine == Lines - 1) begin
				cntLine <= 0;
				is_even <= 0;
			end
			else begin
				cntLine <= cntLine + 1;
				is_even <= 1;
			end
		end	
		else begin
			cntCol <= cntCol + 1;
		end		
	end
	else begin
		layer1_en <= 0;
	end
end
/***************************Pipeline step1***************************/
//Calculate abs(left-right)
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		tempA1 <= 0;
		layer2_en <= 0;
		RGB2 <= 1;
	end
	else if (layer1_en) begin
		layer2_en <= 1;
		RGB2 <= RGB1;
		tempA1 <= abs(LEFTDATA, RIGHTDATA);
	end
	else begin
		layer2_en <= 0;	
	end
end
//Calculate abs(mid-ll)
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		tempB1 <= 0;
	end
	else if (layer1_en) begin
		tempB1 <= abs(MID, LL);
	end
	else begin
		tempB1 <= tempB1;
	end
end	
//Calculate abs(mid-rr)	
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		tempC1 <= 0;	
	end
	else if (layer1_en) begin
		tempC1 <= abs(MID, RR);
	end
	else begin
		tempC1 <= tempC1;
	end	
end
//Calculate abs(updata - downdata)	
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		tempD1 <= 0;
	end
	else if (layer1_en) begin
		tempD1 <= abs(UPDATA, DOWNDATA);
	end
	else begin
		tempD1 <= tempD1;
	end	
end
//Calculate abs(mid-uu)	
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		tempE1 <= 0;
	end
	else if (layer1_en) begin
		tempE1 <= abs(MID, UU);
	end
	else begin
		tempE1 <= tempE1;
	end	
end
//Calculate abs(mid-dd)	
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		tempF1 <= 0;
	end
	else if (layer1_en) begin
		tempF1 <= abs(MID, DD);
	end
	else begin
		tempF1 <= tempC1;
	end	
end
//Calculate updata + downdata
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempG1 <= 0;
	end
	else if (layer1_en) begin
		tempG1 <= UPDATA + DOWNDATA;
	end
	else begin
		tempG1 <= tempG1;
	end
end
//Calculate leftdata + rightdata
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempH1 <= 0;
	end
	else if (layer1_en) begin
		tempH1 <= LEFTDATA + RIGHTDATA;
	end
	else begin
		tempH1 <= tempH1;
	end
end
/***************************Pipeline step2***************************/
//B+C
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempB2 <= 0;
		RGB3 <= 1;
		layer3_en <= 0;
	end
	else if (layer2_en) begin
		layer3_en <= 1;
		RGB3 <= RGB2;
		tempB2 <= tempB1 + tempC1;
	end
	else begin
		layer3_en <= 0;
	end	
end	
//
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempE2 <= 0;
	end
	else if (layer2_en) begin
		tempE2 <= tempE1 + tempF1;
	end
	else begin
		tempE2 <= tempE2;
	end
end
//Store the data of tempA1 and tempD1
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempA2 <= 0;
		tempD2 <= 0;
	end
	else if (layer2_en) begin
		tempA2 <= tempA1;
		tempD2 <= tempD1;
	end
	else begin
		tempA2 <= tempA2;
	end
end
//shift right 
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempG2 <= 0;
		tempH2 <= 0;
	end
	else if (layer2_en) begin
		tempH2 <= tempH1 >> 1;
		tempG2 <= tempG1 >> 1;
	end
	else begin
		tempG2 <= tempG2;
	end
end
/***************************Pipeline step3***************************/
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		dH <= 0;
		dV <= 0;
		RGB4 <= 1;
		layer4_en <= 0;
	end
	else if (layer3_en) begin
		dH <= tempA2 + tempB2;
		dV <= tempD2 + tempE2;
		RGB4 <= RGB3;
		layer4_en <= 1;
	end
	else begin
		layer4_en <= 0;
	end
end
//
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempG3 <= 0;
		tempH3 <= 0;
	end
	else if (layer3_en) begin
		tempG3 <= tempG2;
		tempH3 <= tempH2;
	end
	else begin
		tempG3 <= tempG3;
	end
end
//
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		tempB3 <= 0;
		tempE3 <= 0;
	end
	else if (layer3_en) begin
		tempB3 <= tempB2 >> 2;
		tempE3 <= tempE2 >> 2;
	end
	else begin
		tempB3 <= tempB3;
	end
end 
/***************************Pipeline step4***************************/
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		resultG <= 0;
		o_en <= 0;
	end
	// Output only when o_en which is controlled by 
	else if (layer4_en) begin
		o_en <= 1;
		if (dH > dV) begin
			resultG <= tempE3 + tempH3;
		end
		else begin
			resultG <= tempB3 + tempG3;
		end
	end
	else begin
		o_en <= 0;
	end
end
//Control G. the calculation for G of RB takes 4 clk in total. The original G signal is stored in a shift ram to make synchronization. Same applies for original  R & B
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		G0 <= 0;
		G1 <= 0;
		G2 <= 0;
		G3 <= 0;	
		G_Ostatus0 <= 0;
		G_Ostatus1 <= 0;
		G_Ostatus2 <= 0;
		G_Ostatus3 <= 0;		
	end
	else begin
		G0 <= G_temp;
		G1 <= G0;
		G2 <= G1;
		G3 <= G2;
		G_Ostatus0 <= G_Ostatus;
		G_Ostatus1 <= G_Ostatus0;
		G_Ostatus2 <= G_Ostatus1;
		G_Ostatus3 <= G_Ostatus2;
	end
end
//collects data and generate output
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		o_data <= 24'b000000000000000000000000;
	end
	else if (RGB4 == 1 && o_en) begin
		o_data [23:16] <= 8'b00000000;
		o_data [15:8] <= resultG;
		o_data [7:0] <= G3;
	end
	else if (G_Ostatus3 == 1) begin
		o_data [23:16] <= 8'b00000000;
		o_data [15:8] <= G3;
		o_data [7:0] <= 8'b00000000;
	end
	else if (RGB4 == 0 && o_en) begin
		o_data [23:16] <= G3;
		o_data [15:8] <= resultG;
		o_data [7:0] <= 8'b00000000;
	end	
	else begin
		o_data <= 0;
	end
end
//abs function		
function [7:0] abs;
input [7:0] a;
input [7:0] b;
reg [7:0] dout;
begin
	if (a > b) begin
		dout = a-b;
	end
	else begin
		dout = b-a;
	end
	abs = dout;
end
endfunction
//Avoid overflow
// function [7:0] avoidOverflow
// input [7:0] a;
// input [7:0] b;
endmodule