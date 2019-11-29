module Demosaic_tb_writeG_RB #(
	parameter lengthTotal = 512*768
)
(	input wire [23:0] DATA,
	input wire IN_EN,
	input wire INCLK,
	input wire RSTN	);
integer pt;
integer cnt;
initial begin
	pt = $fopen("E://graphLibrary//tower_getG_RB.dat", "w+");
end

always @(posedge INCLK or negedge RSTN) begin
	if(!RSTN) begin
		cnt <= 0;
	end
	else if (cnt == lengthTotal) begin
		$fclose(pt);
		$stop;
	end
	else if (IN_EN) begin
		$fwrite(pt, "%b\n", DATA);
		cnt <= cnt + 1;
	end
	else begin
		cnt <= cnt;
	end
end

endmodule