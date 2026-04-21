`timescale 1ns/1ps

module traffic_light_TB();

logic clock_t;
logic reset_t;
logic pedestrian_t;
logic led_rosu_t;
logic led_galben_t;
logic led_verde_t;

initial begin
    clock_t = 0;
    forever #1 clock_t = ~clock_t;
end

initial begin
        pedestrian_t <= 0;
        reset_t <= 1;
    #2  reset_t <= 0;
    #40 pedestrian_t <= 1;
    #2  pedestrian_t <= 0;
    #60 $stop();
end

traffic_light DUT(
    .clock(clock_t),
    .reset(reset_t),
    .pedestrian(pedestrian_t),
    .led_rosu(led_rosu_t),
    .led_galben(led_galben_t),
    .led_verde(led_verde_t)
);

endmodule
