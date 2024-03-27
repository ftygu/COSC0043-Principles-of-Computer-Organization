`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 05:15:48 PM
// Design Name: 
// Module Name: adder64_test
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


module adder64_test;
    // Inputs
    reg [31:0] operand1_low;
    reg [31:0] operand2_low;
    reg [31:0] operand1_high;
    reg [31:0] operand2_high;
    reg cin;

    // Outputs
    wire [63:0] result;
    wire cout;
    // Instantiate the Unit Under Test (UUT)
    adder64 uut (
    .operand1({operand1_high, operand1_low}), 
    .operand2({operand2_high, operand2_low}), 
    .cin(cin), 
    .result(result), 
    .cout(cout)
);

    initial begin
        // Initialize Inputs
        operand1_low=0;
        operand1_high=0;
        operand2_low=0;
        operand2_high=0;
        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
    end
    always #10 operand1_low = $random;
    always #10 operand1_high= $random;
    always #10 operand2_low = $random;
    always #10 operand2_high= $random;
    always #10 cin = {$random} % 2;
endmodule
