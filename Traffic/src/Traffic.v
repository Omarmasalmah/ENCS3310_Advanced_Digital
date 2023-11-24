module traffic_light_controller (input clk, input Rst, input Go,
								output reg [4:0] state,
                                output reg [1:0] highway_signal_1,
                                output reg [1:0] highway_signal_2,
                                output reg [1:0] farm_signal_1,
                                output reg [1:0] farm_signal_2);

reg [4:0] counter ;
	

//declare a parameters 
parameter red = 2'b10;
parameter green = 2'b00;
parameter yellow = 2'b01;
parameter red_yellow  = 2'b11;

always @(posedge clk or negedge Rst ) begin
	
  if (~Rst) begin
    state = 0;
    counter = 0;
  end
else
	begin  
    if (Go) begin
		//counter increase 1 each clock sycle
 counter = counter + 1;
end

 if (Go) begin
	 // case to determine time of each state then go to next state
   	case (state)
    0: begin 
       // if the counter reach time of delay it will go to next state
	 if (counter == 2) begin
          state = 1;
          counter = 5'b0;
     end
		  
    end
    1: begin
     
	   if (counter == 2) begin
          state = 2;
          counter = 5'b0;
     end
    end
    2: begin
    
	   if (counter == 30) begin
          state = 3;
          counter = 5'b0;
     end
    end
    3: begin
  
	   if (counter == 2) begin
          state = 4;
          counter = 5'b0;
     end
    end
    4: begin
    
	   if (counter == 10) begin
          state = 5;
          counter = 5'b0;
     end
    end
	5: begin
   
	   if (counter == 2) begin
          state = 6;
          counter = 5'b0;
     end
    end
    6: begin
     
	   if (counter == 1) begin
          state = 7;
          counter = 5'b0;
     end
    end
    7: begin
    
	   if (counter == 2) begin
          state = 8;
          counter = 5'b0;
     end
    end
    8: begin
     
	   if (counter == 15) begin
          state = 9;
          counter = 5'b0;
     end
    end	
	9: begin
    
	   if (counter == 2) begin
          state = 10;
          counter = 5'b0;
     end
    end
    10: begin
    
	   if (counter == 5) begin
          state = 11;
          counter = 5'b0;
     end
    end
    11: begin
   
	   if (counter == 2) begin
          state = 12;
          counter = 5'b0;
     end
    end
    12: begin
  
	   if (counter == 10) begin
          state = 13;
          counter = 5'b0;
     end
    end
	13: begin
   
	   if (counter == 2) begin
          state = 14;
          counter = 5'b0;
     end
    end
    14: begin
  
	   if (counter == 1) begin
          state = 15;
          counter = 5'b0;
     end
    end
    15: begin
     
	   if (counter == 2) begin
          state = 16;
          counter = 5'b0;
     end
    end
    16: begin
   
	   if (counter == 15) begin
          state = 17;
          counter = 5'b0;
     end
    end
	17: begin
   
	   if (counter == 3) begin
          state = 0;
          counter = 1;
     end
    end
	endcase
	end
	end
end

always @(state) begin

  	 // store the signals
   	case (state)
    0: begin 
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = red;
		  
    end
    1: begin
      highway_signal_1 = red_yellow;
      highway_signal_2 = red_yellow;
      farm_signal_1 = red;
      farm_signal_2 = red;
	  
    end
    2: begin
      highway_signal_1 = green;
      highway_signal_2 = green;
      farm_signal_1 = red;
      farm_signal_2 = red;
	
    end
    3: begin
      highway_signal_1 = green;
      highway_signal_2 = yellow;
      farm_signal_1 = red;
      farm_signal_2 = red;
	 
    end
    4: begin
      highway_signal_1 = green;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = red;
	  
    end
	5: begin
      highway_signal_1 = yellow;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = red;
	  
    end
    6: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = red;
	 
    end
    7: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = red_yellow;
      farm_signal_2 = red_yellow;
	  
    end
    8: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = green;
      farm_signal_2 = green;
	  
    end	
	9: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = green;
      farm_signal_2 = yellow;
	 
    end
    10: begin
      highway_signal_1 = red;
      highway_signal_2 = red;	
      farm_signal_1 = green;
      farm_signal_2 = red;
	  
    end
    11: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = yellow;
      farm_signal_2 = red_yellow;
	  
    end
    12: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = green;
	  
    end
	13: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = yellow;
	   
    end
    14: begin
      highway_signal_1 = red;
      highway_signal_2 = red;
      farm_signal_1 = red;
      farm_signal_2 = red;
	  
    end
    15: begin
      highway_signal_1 = red;
      highway_signal_2 = red_yellow;
      farm_signal_1 = red;
      farm_signal_2 = red;
	  
    end
    16: begin
      highway_signal_1 = red;
      highway_signal_2 = green;
      farm_signal_1 = red;
      farm_signal_2 = red;
	   
    end
	17: begin
      highway_signal_1 = red;
      highway_signal_2 = yellow;
      farm_signal_1 = red;
      farm_signal_2 = red;
	   
    end
   // default: begin
   //   highway_signal_1 = red;
   //   highway_signal_2 = red;
   //   farm_signal_1 = red;
   //   farm_signal_2 = red;
//	end
	endcase
  end
endmodule

//generator module to set the inputs values
module generate_test(
	output reg clk,
	output  reg Rst, 
	output reg Go);
	
	   
	 initial begin
		 clk=0;
		 Rst=0;
		 Go=0;
	 end
	 
	 always #10 clk = ~clk;
		 
	initial begin
	#20; Go = 1;
    #90; Rst = 1;
   #600; Rst = 0; 
   #900; Rst = 1;
   #1000; Go = 0;
   #1300; Go = 1;
    #15000;
    $finish;
  end
	
endmodule

//analyzer module to check if the output signals are true
module analyze (	 
							input [4:0] state,
							input wire [1:0] highway_signal_1,
                            input wire [1:0] highway_signal_2,
                            input wire [1:0] farm_signal_1,
                            input wire [1:0] farm_signal_2);
	
//declare a parameters 
parameter red = 2'b10;
parameter green = 2'b00;
parameter yellow = 2'b01;
parameter red_yellow  = 2'b11; 

reg [4:0] counter;

//expected outputs
reg [1:0] highway_exp_1;
reg [1:0] highway_exp_2;
reg [1:0] farm_exp_1;
reg [1:0] farm_exp_2;	

always @(state) begin
 
 case (state)
    1: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = red;
	  
	if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 0");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 0"); 
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state state: 0");		
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state state: 0");
	  
	  
    end
    2: begin
      highway_exp_1 = red_yellow;
      highway_exp_2 = red_yellow;
      farm_exp_1 = red;
      farm_exp_2 = red;	
	  
	if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 1");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 1"); 
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 1");		
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 1");
	 
    end
    3: begin
      highway_exp_1 = green;
      highway_exp_2 = green;
      farm_exp_1 = red;
      farm_exp_2 = red; 
	
	if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 2");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 2");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 2");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 2");
	 
    end
    4: begin
      highway_exp_1 = green;
      highway_exp_2 = yellow;
      farm_exp_1 = red;
      farm_exp_2 = red;
	  
	if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 3");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 3");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 3");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 3");
    
	end
    5: begin
      highway_exp_1 = green;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = red;	 
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 4");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 4");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 4");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 4");
	   
    end
	6: begin
      highway_exp_1 = yellow;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = red;
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 5");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 5");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 5");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 5");
	   
	  
    end
    7: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = red;	
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 6");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 6");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 6");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 6");
	   
	  
    end
    8: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = red_yellow;
      farm_exp_2 = red_yellow;	
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 7");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 7");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 7");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 7");
	   
   
	end
    9: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = green;
      farm_exp_2 = green;
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 8");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 8");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 8");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 8");
	   
	  
    end	
	10: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = green;
      farm_exp_2 = yellow; 
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 9");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 9");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 9");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 9");
	   
    
	end
    11: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = green;
      farm_exp_2 = red; 
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 10");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 10");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 10");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 10");
	   
	  
    end
    12: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = yellow;
      farm_exp_2 = red_yellow;
	 
	  if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 11");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 11");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 11");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 11");
	   
    
	end
    13: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = green;
	  
    if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 12");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 12");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 12");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 12");
	   
	  
    end
	14: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = yellow;	
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 13");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 13");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 13");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 13");
	   
    end
    15: begin
      highway_exp_1 = red;
      highway_exp_2 = red;
      farm_exp_1 = red;
      farm_exp_2 = red;
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 14");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 14");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 14");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 14");
	   
	  
    end
    16: begin
      highway_exp_1 = red;
      highway_exp_2 = red_yellow;
      farm_exp_1 = red;
      farm_exp_2 = red;  
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 15");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 15");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 15");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 15");
	   
	 
     
    end
    17: begin
      highway_exp_1 = red;
      highway_exp_2 = green;
      farm_exp_1 = red;
      farm_exp_2 = red;	
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 16");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 16");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 16");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 16");
	   
	
    end
	18: begin
      highway_exp_1 = red;
      highway_exp_2 = yellow;
      farm_exp_1 = red;
      farm_exp_2 = red;	  
	  
	 if (highway_signal_1 != highway_exp_1) $display("Wrong value of highway_signal_1 at state: 17");
    if (highway_signal_2 != highway_exp_2) $display("Wrong value of highway_signal_2 at state: 17");
    if (farm_signal_1 != farm_exp_1) $display("Wrong value of farm_signal_1 at state: 17");	
    if (farm_signal_2 != farm_exp_2) $display("Wrong value of farm_signal_2 at state: 17"); 

     end
 endcase		
    end
  
endmodule

//Verification for the system
module Testbench;
	
	reg clk,Go,Rst;
	wire [4:0] state;
	wire [1:0] highway_1;
	wire [1:0] highway_2;
	wire [1:0] farm_1;
	wire [1:0] farm_2;
	
	generate_test gen(clk,Rst,Go);
	traffic_light_controller traffic(clk,Rst,Go,state,highway_1,highway_2,farm_1,farm_2);
	analyze anl(state,highway_1,highway_2,farm_1,farm_2);

endmodule
 