module traffic_light(
    input logic clock,
    input logic reset,
    input logic pedestrian,
    output logic led_rosu,
    output logic led_galben,
    output logic led_verde
);

localparam STATE_ROSU        = 2'b00;
localparam STATE_ROSU_GALBEN = 2'b01;
localparam STATE_VERDE       = 2'b10;
localparam STATE_GALBEN      = 2'b11;

logic [1:0] state, state_next;
logic [3:0] counter, counter_next;

always_ff @(posedge clock) begin
    if(reset == 1) begin
        state <= STATE_ROSU;
        counter <= 4'b0;
        end
    else begin
        state <= state_next;
        counter <= counter_next;
        end
end

always_comb begin
    state_next = state;
    counter_next = counter + 1;

    case(state)
        STATE_ROSU: begin
                if(counter == 4'd7) begin
                    state_next = STATE_ROSU_GALBEN;
                    counter_next = 4'b0;
                    end
            end
        STATE_ROSU_GALBEN: begin
                if(counter == 4'd1) begin
                    state_next = STATE_VERDE;
                    counter_next = 4'b0;
                    end
            end
        STATE_VERDE: begin
                if(pedestrian == 1) begin
                    state_next = STATE_GALBEN;
                    counter_next = 4'b0;
                    end
                else if(counter == 4'd7) begin
                    state_next = STATE_GALBEN;
                    counter_next = 4'b0;
                    end
            end
        STATE_GALBEN: begin
                if(counter == 4'd1) begin
                    state_next = STATE_ROSU;
                    counter_next = 4'b0;
                    end
            end
        default: begin
                state_next = STATE_ROSU;
                counter_next = 4'b0;
            end
    endcase
end

assign led_rosu   = (state == STATE_ROSU) || (state == STATE_ROSU_GALBEN);
assign led_galben = (state == STATE_ROSU_GALBEN) || (state == STATE_GALBEN);
assign led_verde  = (state == STATE_VERDE);

endmodule
