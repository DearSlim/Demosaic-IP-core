//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Fri Nov 29 16:22:51 2019
//Host        : klose running 64-bit major release  (build 9200)
//Command     : generate_target demosaic.bd
//Design      : demosaic
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "demosaic,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=demosaic,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "demosaic.hwdef" *) 
module demosaic
   ();

  wire [23:0]Demosaic_calG_RB_0_O_DATA;
  wire Demosaic_calG_RB_0_O_EN;
  wire Demosaic_getBayer_0_CAL_EN;
  wire [7:0]Demosaic_getBayer_0_O_DATA;
  wire [7:0]Demosaic_pre_G_RB_0_DD;
  wire [7:0]Demosaic_pre_G_RB_0_DOWNDATA;
  wire [7:0]Demosaic_pre_G_RB_0_LEFTDATA;
  wire [7:0]Demosaic_pre_G_RB_0_LL;
  wire [7:0]Demosaic_pre_G_RB_0_MID;
  wire Demosaic_pre_G_RB_0_O_EN;
  wire [7:0]Demosaic_pre_G_RB_0_RIGHTDATA;
  wire [7:0]Demosaic_pre_G_RB_0_RR;
  wire [7:0]Demosaic_pre_G_RB_0_UPDATA;
  wire [7:0]Demosaic_pre_G_RB_0_UU;
  wire [7:0]c_shift_ram_3_Q;
  wire [7:0]c_shift_ram_6_Q;
  wire [7:0]c_shift_ram_7_Q;
  wire [7:0]c_shift_ram_8_Q;
  wire [7:0]c_shift_ram_9_Q;
  wire tb_calG_RB_0_CLK;
  wire tb_calG_RB_0_HSYNC;
  wire [7:0]tb_calG_RB_0_O_DATA;
  wire tb_calG_RB_0_RSTN;
  wire tb_calG_RB_0_VSYNC;

  demosaic_Demosaic_calG_RB_0_0 Demosaic_calG_RB_0
       (.DD(Demosaic_pre_G_RB_0_DD),
        .DOWNDATA(Demosaic_pre_G_RB_0_DOWNDATA),
        .INCLK(tb_calG_RB_0_CLK),
        .IN_EN(Demosaic_pre_G_RB_0_O_EN),
        .LEFTDATA(Demosaic_pre_G_RB_0_LEFTDATA),
        .LL(Demosaic_pre_G_RB_0_LL),
        .MID(Demosaic_pre_G_RB_0_MID),
        .O_DATA(Demosaic_calG_RB_0_O_DATA),
        .O_EN(Demosaic_calG_RB_0_O_EN),
        .RIGHTDATA(Demosaic_pre_G_RB_0_RIGHTDATA),
        .RR(Demosaic_pre_G_RB_0_RR),
        .RSTN(tb_calG_RB_0_RSTN),
        .UPDATA(Demosaic_pre_G_RB_0_UPDATA),
        .UU(Demosaic_pre_G_RB_0_UU));
  demosaic_Demosaic_getBayer_0_0 Demosaic_getBayer_0
       (.BAYERDATA(tb_calG_RB_0_O_DATA),
        .CAL_EN(Demosaic_getBayer_0_CAL_EN),
        .HSYNC(tb_calG_RB_0_HSYNC),
        .O_DATA(Demosaic_getBayer_0_O_DATA),
        .PCLK(tb_calG_RB_0_CLK),
        .RSTN(tb_calG_RB_0_RSTN),
        .VSYNC(tb_calG_RB_0_VSYNC));
  demosaic_Demosaic_pre_G_RB_0_0 Demosaic_pre_G_RB_0
       (.DATA1(c_shift_ram_6_Q),
        .DATA2(c_shift_ram_7_Q),
        .DATA3(c_shift_ram_8_Q),
        .DATA4(c_shift_ram_9_Q),
        .DATA5(c_shift_ram_3_Q),
        .DATA_EN(Demosaic_getBayer_0_CAL_EN),
        .DD(Demosaic_pre_G_RB_0_DD),
        .DOWNDATA(Demosaic_pre_G_RB_0_DOWNDATA),
        .HSYNC(tb_calG_RB_0_HSYNC),
        .INCLK(tb_calG_RB_0_CLK),
        .LEFTDATA(Demosaic_pre_G_RB_0_LEFTDATA),
        .LL(Demosaic_pre_G_RB_0_LL),
        .MID(Demosaic_pre_G_RB_0_MID),
        .O_EN(Demosaic_pre_G_RB_0_O_EN),
        .RIGHTDATA(Demosaic_pre_G_RB_0_RIGHTDATA),
        .RR(Demosaic_pre_G_RB_0_RR),
        .RSTN(tb_calG_RB_0_RSTN),
        .UPDATA(Demosaic_pre_G_RB_0_UPDATA),
        .UU(Demosaic_pre_G_RB_0_UU));
  demosaic_Demosaic_tb_writeG_RB_0_0 Demosaic_tb_writeG_RB_0
       (.DATA(Demosaic_calG_RB_0_O_DATA),
        .INCLK(tb_calG_RB_0_CLK),
        .IN_EN(Demosaic_calG_RB_0_O_EN),
        .RSTN(tb_calG_RB_0_RSTN));
  demosaic_c_shift_ram_3_0 c_shift_ram_3
       (.CLK(tb_calG_RB_0_CLK),
        .D(Demosaic_getBayer_0_O_DATA),
        .Q(c_shift_ram_3_Q));
  demosaic_c_shift_ram_3_1 c_shift_ram_6
       (.CLK(tb_calG_RB_0_CLK),
        .D(c_shift_ram_7_Q),
        .Q(c_shift_ram_6_Q));
  demosaic_c_shift_ram_3_2 c_shift_ram_7
       (.CLK(tb_calG_RB_0_CLK),
        .D(c_shift_ram_8_Q),
        .Q(c_shift_ram_7_Q));
  demosaic_c_shift_ram_3_3 c_shift_ram_8
       (.CLK(tb_calG_RB_0_CLK),
        .D(c_shift_ram_9_Q),
        .Q(c_shift_ram_8_Q));
  demosaic_c_shift_ram_3_4 c_shift_ram_9
       (.CLK(tb_calG_RB_0_CLK),
        .D(c_shift_ram_3_Q),
        .Q(c_shift_ram_9_Q));
  demosaic_tb_calG_RB_0_0 tb_calG_RB_0
       (.CLK(tb_calG_RB_0_CLK),
        .HSYNC(tb_calG_RB_0_HSYNC),
        .O_DATA(tb_calG_RB_0_O_DATA),
        .RSTN(tb_calG_RB_0_RSTN),
        .VSYNC(tb_calG_RB_0_VSYNC));
endmodule
