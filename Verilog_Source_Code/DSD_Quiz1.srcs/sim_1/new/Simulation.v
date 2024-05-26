`timescale 1ns / 1ps
module simulation;
    reg [9:0] N; //fsw
    reg reset;
    reg clk;      
    wire [9:0] out;           
    wire [9:0] amp;
    wire [17:0] Data_out;

    // Instantiate the module
    toplevel UUT (.N(N), .reset(reset), .clk(clk), .out(out), .amp(amp), .Data_out(Data_out) );

    // Initialize signals
    initial begin
        clk = 0;
        $dumpfile("simulation.txt"); // Specify the name of the output text file
        N = 205; //fsw 
        reset = 1;
        #5 reset = 0;
    end 
    
    initial begin
        clk = 0;
        forever #500 clk = ~clk; //this creates a 1 MHz clock!
    end
    //always #5 clk = ~clk;
    //$display("Simulating output Phase Accumulator");
    //$monitor($time,,, "clk = %b N = %b out = %b ", clk, N, out);
    // Below command is for monitoring the output
    always @(posedge clk) begin
        $display("Time = %t, Counter = %0d, amp = %0d, Data_out = %d", $time, UUT.out, UUT.amp, UUT.Data_out);
    end

    
    initial #1000000 $finish;
      
endmodule
