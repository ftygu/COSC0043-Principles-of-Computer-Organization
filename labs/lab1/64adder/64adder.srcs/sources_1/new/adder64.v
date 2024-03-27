`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 05:09:08 PM
// Design Name: 
// Module Name: adder64
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder64(
    input  [63:0] operand1,
    input  [63:0] operand2,
    input         cin,
    output [63:0] result,
    output        cout
    );
    assign {cout,result} = operand1 + operand2 + cin;
endmodule
