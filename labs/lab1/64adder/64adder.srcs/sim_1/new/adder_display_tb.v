`timescale 1ns / 1ps

module adder_display_tb;

    // ����ģ�������
    reg clk;
    reg resetn;
    reg [1:0] input_sel;
    reg [1:0] input_hl;
    reg sw_cin;

    // ����ģ������
    wire [1:0] led_cout;
    
    // ��������ؽӿڣ����ｫ��������Ϊwire���͵������и�ֵ����Ϊ�ڲ��������ǲ���ע�ⲿ��
    wire lcd_rst, lcd_cs, lcd_rs, lcd_wr, lcd_rd, lcd_bl_ctr, ct_scl, ct_rstn;
    wire [15:0] lcd_data_io;
    wire ct_int, ct_sda;

    // ʵ����������ģ��
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

    // ����ʱ���ź�
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // ����ʱ������Ϊ10ns
    end

    // ��������
    initial begin
        // ��ʼ��
        resetn = 0; sw_cin = 0; input_sel = 0; input_hl = 0;
        #100; // �ȴ�һ��ʱ����ģ�⸴λ����
        
        // ��λ�ͷ�
        resetn = 1;
        #10;
        
        // �������벢�۲����
        sw_cin = 1; // ���ý�λ����
        input_sel = 0; input_hl = 0; // ѡ�����1�ĵ�32λ��������
        // �˴�Ӧģ�ⴥ��������ֵ�Ĳ������������ڲ��Ի����������޷�ֱ��ģ�ⴥ�������룬
        // ������������Ҫ��adder_displayģ��������ʵ��Ĳ��Խӿڻ�ʹ������������ע������ֵ��

        // ������Բ���...

        #100; // ����һ��ʱ�䣬�۲����
        
        $finish; // ��������
    end

endmodule

