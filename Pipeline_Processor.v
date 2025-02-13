module Pipeline_Processor(
  input [7:0]instr,
  input clk,
  output reg[7:0]out
    );
  reg [7:0]fetch;
  reg [7:0]decode;
  reg [7:0]exe;
  reg [7:0]wb;
  always@(posedge clk)begin
    fetch<=instr;
    decode<=fetch;
    exe<=decode;
    wb<=exe;
    out<=wb;
  end
endmodule
