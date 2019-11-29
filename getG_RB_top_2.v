module getG_RB_top2(
	input wire IN_EN,
	input wire INCLK,
	input wire [7:0] IN_DATA,
	input wire HSYNC,
	input wire DATA1,
	input wire DATA2,
	input wire DATA3,
	input wire DATA4,
	input wire DATA5,
	input wire RSTN
);
wire clk;
assign CLK = INCLK;
wire rstn;
assign rstn = RSTN;
wire uu;
wire updata;
wire mid;
wire downdata;
wire dd; 
wire leftdata; 
wire ll;
wire rr;
wire rightdata;
wire en1;
wire en2;
wire da;
Demosaic_pre_G_RB pre(
	.INCLK(clk),
	.RSTN(rstn),
	.DATA_EN(IN_EN),
	.HSYNC(HSYNC),
	.DATA1(DATA1),
	.DATA2(DATA2),
	.DATA3(DATA3),
	.DATA4(DATA4),
	.DATA5(DATA5),
	.UU(uu),
	.UPDATA(updata),
	.MID(mid),
	.DOWNDATA(downdata),
	.DD(dd),
	.LEFTDATA(leftdata),
	.LL(ll),
	.RR(rr),
	.RIGHTDATA(rightdata),
	.O_EN(en1)	
);

Demosaic_calG_RB calG(
	.INCLK(clk),
	.RSTN(rstn),
	.IN_EN(IN_EN),
	.UU(uu),
	.UPDATA(updata),
	.MID(mid),
	.DOWNDATA(downdata),
	.DD(dd),
	.LEFTDATA(leftdata),
	.LL(ll),
	.RR(rr),
	.RIGHTDATA(rightdata),
	.O_EN(en2),
	.O_DATA(da)
);

Demosaic_tb_writeG_RB tb2(
	.DATA(da),
	.IN_EN(en2),
	.INCLK(clk),
	.RSTN(RSTN)
);
endmodule