`timescale 1ns / 1ps

module elevator(
    input logic clk,
    input logic rst,
    input logic stop,
    input logic [1:0] in,
    output logic [1:0] floor,
    output logic [3:0] changes_count
    );

logic count_enable;

    elevator_fsm elevator_fsm0(
        .clk(clk),
        .rst(rst),
        .stop(stop),
        .in(in),
        .floor(floor)
    );

    counter counter0(
        .clk(clk),                
        .rst(rst),                
        .en(count_enable),                 
        .changes_count(changes_count)
    );

    change_detector change_detector(
        .clk(clk),   
        .rst(rst),   
        .in(in),    
        .change(count_enable)
    );

endmodule