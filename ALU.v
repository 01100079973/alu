`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////


module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input   [2:0]   ALUControl; // control bits for ALU operation
	input   [31:0]  A, B;	    // inputs

	reg [31:0] y;
	reg sign;
	output  reg [31:0]  ALUResult;	// answer
	output  reg     Zero;	    // Zero=1 if ALUResult == 0



    always @(ALUControl,A,B)
    begin
		case (ALUControl)
			0: // AND
				ALUResult <= A & B;
			1: // OR
				ALUResult <= A | B;
			2: // ADD
				ALUResult <= A + B;
			6: // SUB
				ALUResult <= A + (~B + 1);
			7: // SLT
				if (A<B) 
				   ALUResult <= 1;
					else 
						ALUResult <= 0;
				
		
			5: // A OR ~B
				ALUResult <= A | ~(B);
							4: // A AND ~B
				ALUResult <= A &~(B);
				
			
		endcase
end

	always @(ALUResult)
	 begin
		if (ALUResult == 0) begin
			Zero <= 1;
		end else begin
			Zero <= 0;
		end
	
	end

endmodule

