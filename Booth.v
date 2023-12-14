module booth2(A, B, P);
parameter width=5;			//需求位元
input [width-1:0]A,B;
output [width+width-1:0]P;
reg [width+width-1:0]P;
integer Count;
reg [width+width:0]PA, right;

always@(A or B)
	begin
		PA[width+width:0]={5'b0,A,1'b0};
		for(Count=0;Count<width; Count=Count+1)
			begin	
				case(PA[1:0])
					2'b10:
						begin
							PA[width+width:width+1] = PA[width+width:width+1]-B[width-1:0];
							rightshl(PA,right);
						end
					2'b01:
						begin
							PA[width+width:width+1] = PA[width+width:width+1]+B[width-1:0];
							rightshl(PA,right);
						end
					default:
						rightshl(PA,right);
				endcase
			PA=right;
		end
			P[width+width-1:0]=PA[width+width:1];
	end
	
	task rightshl;
	input [width+width:0]PA;
	output [width+width:0]right;
		case(PA[width+width])
		1'b0:right[width+width:0]={1'b0,PA[width+width:1]};
			1'b1:right[width+width:0]={1'b1,PA[width+width:1]};
		endcase
	endtask
endmodule
