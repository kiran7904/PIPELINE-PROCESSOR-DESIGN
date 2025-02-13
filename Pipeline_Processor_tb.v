module Pipeline_Processor_tb;
  reg [7:0]instr;
  reg clk;
  wire [7:0]out;
  Pipeline_Processor pp(instr,clk,out);
  always #5 clk=~clk;
  initial begin
    clk=0;instr=8'b00001000;
    #10 instr=8'b01010000;
    #10 instr=8'b10010010;
    #10 $stop;
  end
  initial begin
  $monitor("time=%0t,instr=%b,out=%b",$time,instr,out);
  end
endmodule
