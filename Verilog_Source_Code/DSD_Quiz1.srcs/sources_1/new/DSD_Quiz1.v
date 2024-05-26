`timescale 1ns / 1ps

//module Frequency_Divider( Q3
//    input clk,
//    output Out
//);
//    wire Q1, Q2, Q3;
//    wire Q1_o, Q2_o, Q3_o;
//    T_FF T_FF1(Q1_o, clk, Q1, Q1_o);
//    T_FF T_FF2(Q2_o, Q1_o, Q2, Q2_o);
//    T_FF T_FF3(Q3_o, Q2_o, Q3, Q3_o);
//    assign out = Q3;
//endmodule

//module Q4(
//    input [31:0] reg_to_bus,
//    input send_data,
//    input rcv_data,
//    output wire [31:0] data_to_or_from_bus,
//    output wire [31:0] inbound_data
//);
//    assign data_to_or_from_bus = send_data? reg_to_bus : 32'bz;
//    assign inbound_data = rcv_data? data_to_or_from_bus : 32'bz;
    
//endmodule

//module cla_1bit (
//    input A,
//    input B,
//    input Cin,
//    output Sum,
//    output Cout
//);

//assign Sum = (A ^ B) ^ Cin;
//assign Cout = ((A ^ B) & Cin) | (A & B);
//endmodule


module toplevel(
    input [9:0] N, //FSW
    input reset,
    input clk, 
    output wire [9:0] out, //counter
    output wire [9:0] amp,//sine wave
    
    //word_size_out = 2 * word_size_in + 2,
    output wire [17:0] Data_out
    );
    
    PhaseAccumulator PA (.N(N), .reset(reset), .clk(clk), .out(out));
    Phase_to_Amplitude_Converter P_to_A (.out(out), .reset(reset), .amp(amp));
    FIR_Gaussian_Lowpass FIR (Data_out, amp, clk, reset);
  endmodule    

  
module PhaseAccumulator(
    N,
    reset,
    clk,
    out
    );
    
    //input/output
    input [9:0] N;
    input reset;
    input clk;
    output reg [9:0] out;
    
always @(posedge clk or posedge reset) begin
    if (reset)
        out <= 0;
    else begin
        case ({reset, out >= 1024})
            2'b01: out <= 0;
            2'b10: out <= 0;
            default: if (out < 1024) out <= out + N;
        endcase
    end
end
endmodule  
module Phase_to_Amplitude_Converter(
    input [9:0] out,
    input reset,
    output reg [9:0] amp //digital sine
    );
    
    always @ (*)
        begin
            if (reset)
                amp = 100;
            else if (out >= 0 && out < 11)
                amp <= 103;
            else if (out >= 11 && out < 21)
                amp <= 106;
            else if (out >= 21 && out < 31)
                amp <= 109;    
            else if (out >= 31 && out < 41)
                amp <= 112;    
            else if (out >= 41 && out < 52)
                amp <= 115;
            else if (out >= 52 && out < 63)
                amp <= 118;
            else if (out >= 63 && out < 73)
                amp <= 121;
            else if (out >= 73 && out < 83)
                amp <= 124;
            else if (out >= 83 && out < 93)
                amp <= 127;
            else if (out >= 93 && out < 104)
                amp <= 129;    
            else if (out >= 104 && out < 115)
                amp <= 132;
            else if (out >= 115 && out < 125)
                amp <= 134;
            else if (out >= 125 && out < 135)
                amp <= 136;
            else if (out >= 135 && out < 145)
                amp <= 138;
            else if (out >= 145 && out < 156)
                amp <= 140;
            else if (out >= 156 && out < 166)
                amp <= 142;
            else if (out >= 166 && out < 176)
                amp <= 144;
            else if (out >= 176 && out < 186)
                amp <= 145;
            else if (out >= 186 && out < 196)
                amp <= 146;
            else if (out >= 196 && out < 207)
                amp <= 147;
            else if (out >= 207 && out < 217)
                amp <= 148;
            else if (out >= 217 && out < 227)
                amp <= 149;
            else if (out >= 227 && out < 237)
                amp <= 149;
            else if (out >= 237 && out < 247)
                amp <= 150;
            else if (out >= 247 && out < 258)
                amp <= 150;
            else if (out >= 258 && out < 268)
                amp <= 150;
            else if (out >= 268 && out < 278)
                amp <= 149;
            else if (out >= 278 && out < 288)
                amp <= 149;
            else if (out >= 288 && out < 298)
                amp <= 148;
            else if (out >= 298 && out < 309)
                amp <= 147;
            else if (out >= 309 && out < 319)
                amp <= 146;
            else if (out >= 319 && out < 329)
                amp <= 145;
            else if (out >= 329 && out < 334)
                amp <= 144;
            else if (out >= 334 && out < 339)
                amp <= 142;
            else if (out >= 339 && out < 344)
                amp <= 140;
            else if (out >= 344 && out < 355)
                amp <= 138;
            else if (out >= 355 && out < 365)
                amp <= 136;
            else if (out >= 365 && out < 375)
                amp <= 134;
            else if (out >= 375 && out < 385)
                amp <= 132;
            else if (out >= 385 && out < 395)
                amp <= 129;
            else if (out >= 395 && out < 407)
                amp <= 127;
            else if (out >= 407 && out < 418)
                amp <= 124;
            else if (out >= 418 && out < 428)
                amp <= 121;
            else if (out >= 428 && out < 439)
                amp <= 118;
            else if (out >= 439 && out < 449)
                amp <= 115;
            else if (out >= 449 && out < 460)
                amp <= 112;
            else if (out >= 460 && out < 470)
                amp <= 109;
            else if (out >= 470 && out < 480)
                amp <= 106;
            else if (out >= 480 && out < 490)
                amp <= 103;
            else if (out >= 490 && out < 500)
                amp <= 100;
            else if (out >= 500 && out < 512)
                amp <= 97;
            else if (out >= 512 && out < 522)
                amp <= 93;
            else if (out >= 522 && out < 532)
                amp <= 90;
            else if (out >= 532 && out < 542)
                amp <= 87;
            else if (out >= 542 && out < 552)
                amp <= 84;
            else if (out >= 552 && out < 553)
                amp <= 81;
            else if (out >= 553 && out < 563)
                amp <= 78;
            else if (out >= 563 && out < 573)
                amp <= 76;
            else if (out >= 573 && out < 583)
                amp <= 73;
            else if (out >= 583 && out < 593)
                amp <= 70;
            else if (out >= 593 && out < 604)
                amp <= 68;
            else if (out >= 604 && out < 614)
                amp <= 66;
            else if (out >= 614 && out < 624)
                amp <= 63;
            else if (out >= 624 && out < 634)
                amp <= 61;
            else if (out >= 634 && out < 644)
                amp <= 59;
            else if (out >= 644 && out < 665)
                amp <= 58;
            else if (out >= 665 && out < 675)
                amp <= 56;
            else if (out >= 675 && out < 685)
                amp <= 55;
            else if (out >= 685 && out < 695)
                amp <= 53;
            else if (out >= 695 && out < 705)
                amp <= 52;
            else if (out >= 705 && out < 716)
                amp <= 51;
            else if (out >= 716 && out < 726)
                amp <= 51;
            else if (out >= 726 && out < 736)
                amp <= 50;
            else if (out >= 736 && out < 746)
                amp <= 50;
            else if (out >= 746 && out < 756)
                amp <= 50;
            else if (out >= 756 && out < 767)
                amp <= 50;
            else if (out >= 767 && out < 777)
                amp <= 50;
            else if (out >= 777 && out < 787)
                amp <= 51;
            else if (out >= 787 && out < 797)
                amp <= 51;
            else if (out >= 797 && out < 807)
                amp <= 52;
            else if (out >= 807 && out < 819)
                amp <= 53;
            else if (out >= 819 && out < 829)
                amp <= 55;
            else if (out >= 829 && out < 839)
                amp <= 56;
            else if (out >= 839 && out < 849)
                amp <= 58;
            else if (out >= 849 && out < 859)
                amp <= 59;
            else if (out >= 859 && out < 870)
                amp <= 61;
            else if (out >= 870 && out < 880)
                amp <= 63;
            else if (out >= 880 && out < 890)
                amp <= 66;
            else if (out >= 890 && out < 900)
                amp <= 68;
            else if (out >= 900 && out < 910)
                amp <= 70;
            else if (out >= 910 && out < 921)
                amp <= 73;
            else if (out >= 921 && out < 932)
                amp <= 76;
            else if (out >= 932 && out < 942)
                amp <= 78;
            else if (out >= 942 && out < 952)
                amp <= 81;
            else if (out >= 952 && out < 962)
                amp <= 84;
            else if (out >= 962 && out < 973)
                amp <= 87;
            else if (out >= 973 && out < 983)
                amp <= 90;
            else if (out >= 983 && out < 993)
                amp <= 93;
            else if (out >= 993 && out < 1003)
                amp <= 97;
            else if (out >= 1003 && out < 1013)
                amp <= 100;
            else if (out >= 1013 && out < 1023)
                amp <= 100;
            else
                amp <= 100;

    end
endmodule
module FIR_Gaussian_Lowpass(Data_out, Data_in, clk, reset);
    parameter order = 32;
    parameter word_size_in = 8;
    parameter word_size_out = 2 * word_size_in + 2;
//     2     0     0     0     1     4     6     3 ..   
    parameter b0 = 8'd2;
    parameter b1 = 8'd0;
    parameter b2 = 8'd0;
    parameter b3 = 8'd0;
    parameter b4 = 8'd1;
    parameter b5 = 8'd4;
    parameter b6 = 8'd6;
    parameter b7 = 8'd3;
//0     0     0     0     8    29    50    63    63
    parameter b8 = 8'd0;
    parameter b9 = 8'd0;
    parameter b10 = 8'd0;    
    parameter b11 = 8'd0;
    parameter b12 = 8'd8;
    parameter b13 = 8'd29;
    parameter b14 = 8'd50;
    parameter b15 = 8'd63;
//	63 50    29     8     0     0     0     0
    parameter b16 = 8'd63;
    parameter b17 = 8'd50;
    parameter b18= 8'd29;
    parameter b19 = 8'd8;
    parameter b20 = 8'd0;
    parameter b21 = 8'd0;
    parameter b22 = 8'd0;
    parameter b23 = 8'd0;
 //	3     6     4     1     0     0     0     2
    parameter b24 = 8'd3;
    parameter b25 = 8'd6;
    parameter b26 = 8'd4;
    parameter b27 = 8'd1;
    parameter b28 = 8'd0;
    parameter b29 = 8'd0;
    parameter b30 = 8'd0;
    parameter b31 = 8'd2;
    
    output [word_size_out - 1:0] Data_out;
    input [word_size_in - 1:0] Data_in;
    input clk;
    input reset;
    
    reg [word_size_in - 1:0] Samples [1:order];
    integer k;

    assign Data_out = 
        b0 * Data_in +
        b1 * Samples[1] +
        b2 * Samples[2] +
        b3 * Samples[3] +
        b4 * Samples[4] +
        b5 * Samples[5] +
        b6 * Samples[6] +
        b7 * Samples[7] +
        b8 * Samples[8] +
        b9 * Samples[9] +
        b10 * Samples[10] +
        b11 * Samples[11] +
        b12 * Samples[12] +
        b13 * Samples[13] +
        b14 * Samples[14] +
        b15 * Samples[15] +
        b16 * Samples[16] +
        b17 * Samples[17] +
        b18 * Samples[18] +
        b19 * Samples[19] +
        b20 * Samples[20] +
        b21 * Samples[21] +
        b22 * Samples[22] +
        b23 * Samples[23] +
        b24 * Samples[24] +
        b25 * Samples[25] +
        b26 * Samples[26] +
        b27 * Samples[27] +
        b28 * Samples[28] +
        b29 * Samples[29] +
        b30 * Samples[30] +
        b31 * Samples[31];
                      
    always @(posedge clk) begin
        if (reset == 1) begin
            for (k = 1; k <= order; k = k + 1)
                Samples[k] <= 0;
        end else begin
            Samples[1] <= Data_in;
            for (k = 2; k < order; k = k + 1)
                Samples[k] <= Samples[k - 1];
        end
    end
endmodule
