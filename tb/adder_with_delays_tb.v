`timescale 1ns/1ps

module adder_with_delays_tb;
    reg [3:0] a, b;
    reg ci;

    wire [3:0] sum_t1;
    wire co_t1;

    wire [3:0] sum_t7a;
    wire co_t7a;

    wire [3:0] sum_t7b;
    wire co_t7b;

    wire [3:0] sum_t6;
    wire co_t6;

    wire [3:0] sum_t11a;
    wire co_t11a;

    wire [3:0] sum_t11b;
    wire co_t11b;

    wire [3:0] sum_t2;
    wire co_t2;

    wire [3:0] sum_t3;
    wire co_t3;

    wire [3:0] sum_t9c;
    wire co_t9c;

    wire [3:0] sum_t9d;
    wire co_t9d;

    wire [3:0] sum_t4;
    wire co_t4;

    wire [3:0] sum_t10a;
    wire co_t10a;

    wire [3:0] sum_t10b;
    wire co_t10b;

    wire [3:0] sum_t5;
    wire co_t5;

    adder_t1 DUT1(co_t1, sum_t1, a, b, ci);
    adder_t7a DUT2(co_t7a, sum_t7a, a, b, ci);
    adder_t7b DUT3(co_t7b, sum_t7b, a, b, ci);
    adder_t6 DUT4(co_t6, sum_t6, a, b, ci);
    adder_t11a DUT5(co_t11a, sum_t11a, a, b, ci);
    adder_t11b DUT6(co_t11b, sum_t11b, a, b, ci);
    adder_t2 DUT7(co_t2, sum_t2, a, b, ci);
    adder_t3 DUT8(co_t3, sum_t3, a, b, ci);
    adder_t9c DUT9(co_t9c, sum_t9c, a, b, ci);
    adder_t9d DUT10(co_t9d, sum_t9d, a, b, ci);
    adder_t4 DUT11(co_t4, sum_t4, a, b, ci);
    adder_t10a DUT12(co_t10a, sum_t10a, a, b, ci);
    adder_t10b DUT13(co_t10b, sum_t10b, a, b, ci);
    adder_t5 DUT14(co_t5, sum_t5, a, b, ci);

    initial begin
        a = 4'h0;
        b = 4'h0;
        ci = 1'b0;

        #15 a = 4'hA;   // 15ns: a = "A"
        #2  b = 4'h3;   // 17ns: b = "3"
        #2  a = 4'h2;   // 19ns: a = "2"
        #2  a = 4'hF;   // 21ns: a = "F"

        #50 $finish;
    end

endmodule
