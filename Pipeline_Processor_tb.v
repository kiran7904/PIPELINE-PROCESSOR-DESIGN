module Pipeline_Processor_tb;
  reg [7:0]instr;
  reg clk;
  wire [7:0]out;
  Pipeline_Processor pp(instr,clk,out);
  always #5 clk=~clk;
  initial begin
    clk=0;instr=8'h00;
    #10 instr=8'hAC;
  end
endmodule
