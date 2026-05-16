`timescale 1ns / 1ps

module change_detector(
    input logic clk,
    input logic rst,
    input logic [1:0] in,
    output logic change
    );
    
    logic [1:0] register = 0;

    always_ff @(posedge clk)
    begin
        if(rst == 1)
        begin
            register <= 2'd0;
            change <= 0;
        end
        else
        begin
            if(in != register)
                change <= 1;
            else change <= 0;
            register <= in;
            end
        end
endmodule