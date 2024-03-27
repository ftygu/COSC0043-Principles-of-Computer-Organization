`timescale 1ns / 1ps

module adder_display_tb;

    // 测试模块的输入
    reg clk;
    reg resetn;
    reg [1:0] input_sel;
    reg [1:0] input_hl;
    reg sw_cin;

    // 测试模块的输出
    wire [1:0] led_cout;
    
    // 触摸屏相关接口，这里将它们声明为wire类型但不进行赋值，因为在测试中我们不关注这部分
    wire lcd_rst, lcd_cs, lcd_rs, lcd_wr, lcd_rd, lcd_bl_ctr, ct_scl, ct_rstn;
    wire [15:0] lcd_data_io;
    wire ct_int, ct_sda;

    // 实例化待测试模块
    adder_display uut (
        .clk(clk),
        .resetn(resetn),
        .input_sel(input_sel),
        .input_hl(input_hl),
        .sw_cin(sw_cin),
        .led_cout(led_cout),
        .lcd_rst(lcd_rst),
        .lcd_cs(lcd_cs),
        .lcd_rs(lcd_rs),
        .lcd_wr(lcd_wr),
        .lcd_rd(lcd_rd),
        .lcd_data_io(lcd_data_io),
        .lcd_bl_ctr(lcd_bl_ctr),
        .ct_int(ct_int),
        .ct_sda(ct_sda),
        .ct_scl(ct_scl),
        .ct_rstn(ct_rstn)
    );

    // 生成时钟信号
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 假设时钟周期为10ns
    end

    // 测试序列
    initial begin
        // 初始化
        resetn = 0; sw_cin = 0; input_sel = 0; input_hl = 0;
        #100; // 等待一段时间以模拟复位过程
        
        // 复位释放
        resetn = 1;
        #10;
        
        // 设置输入并观察输出
        sw_cin = 1; // 设置进位输入
        input_sel = 0; input_hl = 0; // 选择加数1的低32位进行输入
        // 此处应模拟触摸屏输入值的操作，但由于在测试环境中我们无法直接模拟触摸屏输入，
        // 所以您可能需要在adder_display模块内添加适当的测试接口或使用其他方法来注入输入值。

        // 更多测试操作...

        #100; // 运行一段时间，观察输出
        
        $finish; // 结束测试
    end

endmodule

