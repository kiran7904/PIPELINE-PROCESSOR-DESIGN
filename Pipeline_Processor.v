module Pipeline_Processor(
  input [7:0]instr,
  input clk,
  output reg[7:0]out
    );
  reg [7:0]fetch;
  reg [7:0]decode;
  reg [7:0]exe;
  reg [7:0]wb;
  reg [7:0]regfile [3:0];
  reg [7:0]memfile [3:0];
  always@(posedge clk)begin
    fetch<=instr;
    decode<=fetch;
      case(decode[7:6])
      2'b00:exe<=regfile[decode[5:4]]+regfile[decode[3:2]];
      2'b01:exe<=regfile[decode[5:4]]-regfile[decode[3:2]];
      2'b10:exe<=memfile[decode[3:0]];
      default:exe<=8'b00000000;
      endcase
    wb<=exe;
    if(decode[7:6]!=2'b10)
      regfile[decode[5:4]]<=wb;
    out<=wb;
  end
endmodule
