`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University at Buffalo
// Engineer: Mahalakshmi Venkataraman
// 
// Create Date:    12:34:32 06/12/2015 
// Design Name:    CSE 590 Proj 1
// Module Name:    pa1 
// Project Name:   SSD
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module proj(
input [3:0] switches,
input [3:0] pushbtns,
input clk,
output [3:0] final_led,
output [6:0] final,
output [3:0] final_enable
);
 
 reg [17:0] counter;
 reg [3:0] temp_led; 
 reg [3:0] temp_enable = 4'b1111;
 reg [6:0] temp_ssd=7'b1111111;
 reg [6:0] ssd_1=7'b1111111;
 reg [6:0] ssd_2=7'b1111111;
 reg [6:0] ssd_3=7'b1111111;
 reg [6:0] ssd_4=7'b1111111;
 reg [6:0] final_ssd=7'b1111111;

always @ (switches) begin
	if(switches==4'b0000) 
		begin
			temp_led = 'h0; 
			temp_ssd = 7'b1000000; 
		end
	else if(switches==4'b0001)
		begin
			temp_led = 'h1; 
			temp_ssd = 7'b1111001; 
		end
	else if(switches==4'b0010)
		begin 
			temp_led = 'h2; 
			temp_ssd = 7'b0100100; 
		end
	else if(switches==4'b0011)
		begin 
		 	temp_led = 'h3; 
		 	temp_ssd = 7'b0110000; 
		end
	else if(switches==4'b0100)
		begin 
			temp_led = 'h4; 
		 	temp_ssd = 7'b0011001; 
		end
	else if(switches==4'b0101)
		begin 
			temp_led = 'h5; 
			temp_ssd = 7'b0010010; 
		end
	else if(switches==4'b0110)
		begin 
			temp_led = 'h6; 
			temp_ssd = 7'b0000010; 
		end
	else if(switches== 4'b0111)
		begin 
			temp_led = 'h7; 
			temp_ssd = 7'b1111000; 
		end
	else if(switches== 4'b1000)
		begin 
			temp_led = 'h8; 
			temp_ssd = 7'b0000000; 
		end
	else if(switches== 4'b1001)
		begin 
 			temp_led = 'h9; 
 			temp_ssd = 7'b0010000; 
		end
	else
		begin
			temp_led = 4'b0000; 
		 	temp_ssd = 7'b1111111;
		end
end 
 
always @ (posedge clk) begin

	if (clk)   
		counter = 0;  
	else   
		counter = counter + 1;
		
	case(counter[17:16])   
		2'b00: begin
     		final_ssd = ssd_1;
     		temp_enable = 4'b0111;
    	end    
   
		2'b01: begin
     		final_ssd = ssd_2;
     		temp_enable = 4'b1011;
    	end    
   
		2'b10: begin
     		final_ssd = ssd_3;
     		temp_enable = 4'b1101;
    	end     
   
		2'b11: begin
     		final_ssd = ssd_4;
     		temp_enable = 4'b1110;
    	end 
	endcase
	
	case(pushbtns)
		4'b0001: ssd_1 = temp_ssd;
		4'b0010: ssd_2 = temp_ssd;
		4'b0100: ssd_3 = temp_ssd;
		4'b1000: ssd_4 = temp_ssd;
	endcase	
	
end

assign final_led = temp_led;
assign final= final_ssd;
assign final_enable = temp_enable;

endmodule
