module hospitalROVER(
clk,move_switch,reset,current_loc
);

input clk,move_switch,reset;//Input declaration
output reg [3:0] current_loc;	//output is a 3bit binary sequence hence it is declared as such


reg [3:0] cur_state;

reg [3:0] next_state;
parameter HNR = 3'b000,				//Head nurse room is assigned the binary code 000
			 IR = 3'b001,				//Isolation roon is assigned the binary code 001
			 CPR = 3'b010,				//Contact precaution room is assigned binary code 010
			 ABIR = 3'b011,			//Airborne infection room is assigned binary code 011
			 NPR = 3'b100,				//Negative pressure room is assigned binary code 100
			 ICU = 3'b101,				//Intensive Care Unit is assigned binary code 101
			 CCU = 3'b110,				//Corona Care unit is assigned binary code 110
			 BU = 3'b111;				//Burns unit is assigned binary code 111
			 
			 

always@(move_switch or cur_state)
	case(cur_state)					//Case is used to check the current location
	
	HNR:							//cur_state can only hold 3-bit binary values ranging from 000 to 111 and each room is assigned such a value.
			if(move_switch)			//repeated if-else statements are used to check for move_switch condition
				
				next_state <= IR;
				
			else
				
				next_state <= HNR;
				
				
	IR:							//If currrent state is 001 and move_switch is one then rover moves to ICU, if current state is 001 and move_switch is 0 then rover moves to HNR
			if(move_switch)
				
				next_state <= ICU;
				
			else
				
				next_state <= HNR;
				
				
	CPR:
				if(move_switch)
				
				next_state <= BU;
				
			else
				
				next_state <= ABIR;
				
				
	ABIR:
			if(move_switch)
				
				next_state <= NPR;
				
			else
				
				next_state <= HNR;
				
		
	NPR:
			if(move_switch)
				
				next_state <= ICU;
				
			else
				
				next_state <= HNR;
				
		
	ICU:
			if(move_switch)
				
				next_state <= CPR;
				
			else
				
				next_state <= NPR;
				

	CCU:
			if(move_switch)
				
				next_state <= ABIR;
				
			else
				
				next_state <= HNR;
				
	BU:
			if(move_switch)
				
				next_state <= ICU;
				
			else
				
				next_state <= CCU;
				
		endcase
		
		
		
always @(posedge clk or posedge reset)
if(reset)								
	cur_state <= HNR;
else
	cur_state <= next_state;	
	
	
always@(cur_state)
current_loc <= cur_state;

endmodule 






