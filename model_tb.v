`timescale 1ns/1ps

module model_tb;

    reg t_clk;
    reg t_enable;
    reg t_reset;
    reg t_dirn;
    reg t_load;
    reg [3:0]t_data_in;
    wire [3:0]t_counter;

    model m1(.clk(t_clk),.enable(t_enable),.reset(t_reset),.dirn(t_dirn),.load(t_load),.data_in(t_data_in),.counter(t_counter));

    initial begin
        t_clk = 0;
        forever #5 t_clk = ~t_clk; // clk definition
    end

    initial begin
        t_reset = 1'b1;
        t_load = 1'b0;
        t_enable = 1'b1;
        t_dirn = 1'b1;
        t_data_in = 4'b0100;

        #15
        t_reset = 1'b0;

        repeat(10) @(posedge t_clk);
        
        t_dirn = 1'b0;
        
        repeat(5) @(posedge t_clk);
        
        #10; 
               
        t_reset = 1'b1;
               
        #10
        t_reset = 1'b0;
        t_dirn = 1'b1;        
        t_load = 1'b1;
        
        #10
        t_load = 1'b0;
        
        repeat(5) @(posedge t_clk);
        
        t_enable = 1'b0;      

    end
endmodule