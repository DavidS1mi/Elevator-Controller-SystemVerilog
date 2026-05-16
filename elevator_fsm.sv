`timescale 1ns / 1ps

module elevator_fsm(
    input logic clk,
    input logic rst,
    input logic stop,
    input logic [1:0] in,
    output logic [1:0] floor
    );

    localparam Q0 = 2'b00;
    localparam Q1 = 2'b01;
    localparam Q2 = 2'b10;
    localparam Q3 = 2'b11;

    logic [1:0] state = Q0, state_next;

    always_ff @(posedge clk) begin
        if(rst == 1)
            state <= Q0;
        else
            state <= state_next;
    end

    always_comb begin
        state_next = state;
        case(state)
            Q0: begin
                if(in == 0 || stop == 1) begin
                    state_next = Q0;
                end
                else if(in > 0) state_next = Q1;
            end
            Q1: begin
                if(in == 1 || stop == 1) begin
                    state_next = Q1;
                end
                else if(in > 1) begin
                    state_next = Q2;
                end
                else if(in < 1) begin
                    state_next = Q0;
                end
            end
            Q2: begin
                if(in == 2 || stop == 1)
                begin
                    state_next = Q2;
                end
                else if(in > 2) begin
                    state_next = Q3;
                end
                else if(in < 2) begin
                    state_next = Q1;
                end
            end
            Q3: begin
                if(in == 3 || stop == 1)
                begin
                    state_next = Q3;
                end
                else if(in < 3) begin
                    state_next = Q2;
                end
            end
            default: state_next = Q0;
        endcase

        if(state == Q0)
        begin
            floor = 0;
        end
        else if(state == Q1)
        begin
            floor = 1;
        end
        else if(state == Q2)
        begin
            floor = 2;
        end
        else if(state == Q3)
        begin
            floor = 3;
        end
    end
endmodule