module model
(
    input clk,
    input enable,
    input reset,
    input dirn,
    input load,
    input [3:0]data_in,
    output reg [3:0]counter
);

    always @(posedge clk)
        begin
            if(reset)
                counter <= 4'b0000;
            else
                begin
                    if(load)
                        counter <= data_in;
                    else
                        begin
                            if(enable)
                                begin
                                    if(dirn) // counter moves up
                                        counter <= counter + 4'b0001;
                                    else // counter moves down
                                        counter <= counter - 4'b0001;
                                end
                        end
                end             
        end
endmodule
