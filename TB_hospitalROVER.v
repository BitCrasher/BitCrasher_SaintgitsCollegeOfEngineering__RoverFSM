module TB_hospitalROVER();
//Testbench to enter the code 
reg clk,move_switch,reset; 
wire [3:0] current_loc;
hospitalROVER dut(.clk(clk),.move_switch(move_switch),.reset(reset),.current_loc(current_loc));
initial begin
clk = 0;
forever #50 clk=~clk;
end

initial begin
reset = 1;
#50;
reset = 0;
#50;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch =1;
#100;
move_switch = 1;
#100;
move_switch = 0;
#100;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch = 0;
#100;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch = 1;
#100;
move_switch = 0;
#100;
end
endmodule 