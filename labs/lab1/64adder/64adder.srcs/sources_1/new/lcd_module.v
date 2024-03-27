`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 05:12:26 PM
// Design Name: 
// Module Name: lcd_module
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
module lcd_module(
input clk, //10Mhz
input resetn, //低使能
//调用触摸屏的接口
input display_valid,
input [39:0] display_name,
input [31:0] display_value,
output [ 5:0] display_number,
output input_valid,
output [31:0] input_value,
//lcd 触摸屏相关接口，不需要更改
output reg lcd_rst,
output lcd_cs,
output lcd_rs,
output lcd_wr,
output lcd_rd,
inout [15:0] lcd_data_io,
output lcd_bl_ctr,
inout ct_int,
inout ct_sda,
output ct_scl,
output ct_rstn
);
endmodule
