// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:Demosaic_calG_RB:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module demosaic_Demosaic_calG_RB_0_0 (
  INCLK,
  RSTN,
  IN_EN,
  UU,
  UPDATA,
  MID,
  DOWNDATA,
  DD,
  LEFTDATA,
  LL,
  RR,
  RIGHTDATA,
  O_EN,
  O_DATA
);

input wire INCLK;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTN, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTN RST" *)
input wire RSTN;
input wire IN_EN;
input wire [7 : 0] UU;
input wire [7 : 0] UPDATA;
input wire [7 : 0] MID;
input wire [7 : 0] DOWNDATA;
input wire [7 : 0] DD;
input wire [7 : 0] LEFTDATA;
input wire [7 : 0] LL;
input wire [7 : 0] RR;
input wire [7 : 0] RIGHTDATA;
output wire O_EN;
output wire [23 : 0] O_DATA;

  Demosaic_calG_RB #(
    .Cols(512),
    .Lines(768)
  ) inst (
    .INCLK(INCLK),
    .RSTN(RSTN),
    .IN_EN(IN_EN),
    .UU(UU),
    .UPDATA(UPDATA),
    .MID(MID),
    .DOWNDATA(DOWNDATA),
    .DD(DD),
    .LEFTDATA(LEFTDATA),
    .LL(LL),
    .RR(RR),
    .RIGHTDATA(RIGHTDATA),
    .O_EN(O_EN),
    .O_DATA(O_DATA)
  );
endmodule
