// This module collects data from 1st shift ram, prepare calculating G for R & B, 1st step of calculation
/**
Issue: Too deep
**/
module Demosaic_pre_G_RB#(
	parameter Lines = 768 + 20,
			  Cols = 512 + 50 	
)
(	input wire INCLK,
	input wire RSTN,
	input wire DATA_EN,
	input wire HSYNC,
	input wire [7:0] DATA1,  // For uu
	input wire [7:0] DATA2,
	input wire [7:0] DATA3,
	input wire [7:0] DATA4,
	input wire [7:0] DATA5,
	output wire [7:0] UU,
	output wire [7:0] UPDATA,
	output wire [7:0] MID,
	output wire [7:0] DOWNDATA,
	output wire [7:0] DD,
	output wire [7:0] LEFTDATA,
	output wire [7:0] LL,
	output wire [7:0] RR,
	output wire [7:0] RIGHTDATA,
	output wire O_EN   );
	
wire rst;
assign rst = !RSTN;
/************************
       *
   	   *  
   * * * * *
       * 
	   *
************************/
assign rst = !RSTN;
reg [10:0] cntLine;
reg [10:0] cntCol;
reg [7:0] updata;
reg [7:0] downdata;
reg [7:0] leftdata;
reg [7:0] rightdata;
assign UPDATA = updata;
assign DOWNDATA = downdata;
assign LEFTDATA =leftdata;
assign RIGHTDATA = rightdata;
reg [7:0] uu;
reg [7:0] dd;
reg [7:0] ll;
reg [7:0] rr;
//Temporarily store data
reg [7:0] uur;
reg [7:0] uurr;
reg [7:0] ddr;
reg [7:0] ddrr;
reg [7:0] ur;
reg [7:0] urr;
reg [7:0] dr;
reg [7:0] drr;
//Assign reg
assign UU = uu;
assign DD = dd;
assign LL = ll;
assign RR = rr;
reg [7:0] mid;
assign MID = mid;
reg o_en;
reg cntDelay;
assign O_EN = o_en;
//FSM for shift register
reg [1:0] state_1;
reg [1:0] state_2;
reg [1:0] state_3;
reg [1:0] state_4;
reg [1:0] state_5;
//Initiate cntCol and cntLine
always @(posedge INCLK or posedge rst) begin
	if (rst) begin
		cntCol <= 0;
		cntLine <= 0;
	end
	else if (DATA_EN && HSYNC) begin
		if (cntCol == Cols) begin
			cntCol <= 0;
			if(cntLine == Lines) begin
				cntLine <= 0;
			end
			else begin
				cntLine <= cntLine + 1;
			end
		end	
		else begin
			cntCol <= cntCol + 1;
		end
	end
end
//DATA1 shows 1 data
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		uu <= 1'd0;
		uur <= 1'd0;
		uurr <= 1'd0;
		state_1 <= 2'b0;
	end
	// DATA_EN would come when 3 lines are transmitted. 
	//Only UU is used in calculation, so the uncertainty of uur and uurr is not an issue. Same situation applys on the rest of DATA.
	else if (DATA_EN && HSYNC) begin
		case (state_1)
			2'b00: begin
				//uu
				if (cntCol == 0) begin
					uu <= (cntLine == 0 || cntLine == 1) ? DATA5 : DATA1;
					state_1 <= 2'b01;
				end
				else begin
					uu <= uur;
					uur <= uurr;
					uurr <= (cntLine == 0 || cntLine == 1) ? DATA5 : DATA1;
				end
			end
			2'b01: begin
				//uur
				if (cntCol == 1) begin
					uur <= (cntLine == 0 || cntLine == 1) ? DATA5 : DATA1;
				end
				else begin
					uur <= uurr;
				end
				state_1 <= 2'b10;				
			end
			2'b10: begin
				//uurr
				uurr <= DATA1;
				state_1 <= 2'b0;				
			end
		endcase
	end
	else begin
		uu <= 0;
		uur <= 0;
		uurr <= 0;
	end
end
//DATA2 shows 1 data
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		updata <= 0;
		ur <= 0;
		urr <= 0;
		state_2 <= 2'b0;
	end
	else if (DATA_EN && HSYNC) begin
		case (state_2)
			2'b00: begin
				//updata
				if (cntCol == 0) begin
					updata <= (cntLine == 0) ? DATA4 : DATA2;
					state_2 <= 2'b01;
				end
				else begin
					updata <= ur;
					ur <= urr;
					urr <= (cntLine == 0) ? DATA4 : DATA2;
				end
			end
			2'b01: begin
				//ur
				ur <= (cntLine == 0) ? DATA4 : DATA2;
				state_2 <= 2'b10;				
			end
			2'b10: begin
				//urr
				urr <= DATA2;
				state_2 <= 2'b00;				
			end
		endcase
	end	
	else begin
		updata <= 0;
		ur <= 0;
		urr <= 0;
	end
end
//DATA3 shows 5 data, drive O_EN
//The most critical part
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		ll <= 0;
		leftdata <= 0;
		mid <= 0;
		rightdata <= 0;
		rr <= 0;
		state_3 <= 2'b00;
		o_en <= 0;
		cntDelay <= 0;
	end
	else if (DATA_EN && HSYNC) begin
		case (state_3)
			2'b00: begin
				//mid
				if (cntCol == 0) begin
					mid <= DATA3;
					state_3 <= 2'b01;
				end
				else if (cntCol == Cols) begin
					o_en <= 0;
				end
				else begin
					mid <= rightdata;
					rightdata <= rr;
					rr <= DATA3;
					leftdata <= mid;
					if (cntCol == 3) begin
						ll <= DATA3;
					end
					else begin
						ll <= leftdata;					
					end
				end
			end
			2'b01: begin
				//rightdata
				if (cntCol == 1) begin
					leftdata <= DATA3;
					rightdata <= DATA3;
				end
				else begin
					rightdata <= rightdata;
				end
				state_3 <= 2'b10;				
			end
			2'b10: begin
				//rr
				rr <= DATA3;
				if (cntCol == 2) begin
					ll <= rr;
				end
				else begin
					ll <= leftdata;
				end
				o_en <= 1;
				state_3 <= 2'b00;				
			end
		endcase
	end
	else begin
		ll <= 0;
		leftdata <= 0;
		mid <= 0;
		rightdata <= 0;
		rr <= 0;		
	end
end
//DATA4 shows 1 data
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		downdata <= 0;
		state_4 <= 2'b00;
	end
	else if (DATA_EN && HSYNC) begin
		case (state_4)
			2'b00: begin
				//downdata
				if (cntCol == 0) begin
					downdata <= (cntLine == Lines - 1) ? DATA2 : DATA4;
					state_4 <= 2'b01;
				end
				else begin
					downdata <= dr;
					dr <= drr;
					drr <= DATA4;
				end
			end
			2'b01: begin
				//dr
				if (cntCol == 1) begin
					dr <= (cntLine == Lines - 1) ? DATA2 : DATA4;
				end
				else begin
					dr <= drr;
				end
				state_4 <= 2'b10;				
			end
			2'b10: begin
				//drr
				drr <= (cntLine == Lines - 1) ? DATA2 : DATA4;
				state_4 <= 2'b00;				
			end
		endcase
	end
	else begin
		downdata <= 0;
		dr <= 0;
		drr <= 0;
	end	
end
//DATA5 shows 1 data
always @(posedge INCLK or posedge rst) begin
	if(rst) begin
		dd <= 0;
		ddr <= 0;
		ddrr <= 0;
		state_5 <= 2'b00;
	end
	else if (DATA_EN && HSYNC) begin
		case (state_5)
			2'b00: begin
				//dd
				if (cntCol == 0) begin
					dd <= (cntLine == Lines - 1 || cntLine == Lines - 2) ? DATA1 : DATA5;
					state_5 <= 2'b01;
				end
				else begin
					dd <= ddr;
					ddr <= ddrr;
					ddrr <= DATA5;
				end
			end
			2'b01: begin
				//ddr
				ddr <= (cntLine == Lines - 1 || cntLine == Lines - 2) ? DATA1 : DATA5;
				state_5 <= 2'b10;		
			end
			2'b10: begin
				//ddrr
				ddrr <= (cntLine == Lines - 1 || cntLine == Lines - 2) ? DATA1 : DATA5;
				state_5 <= 2'b00;				
			end
		endcase
	end
	else begin
		dd <= 0;
		ddr <= 0;
		ddrr <= 0;
	end	
end
endmodule