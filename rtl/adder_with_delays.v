module adder_t1 (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;

    always @(a or b or ci)
        #12 {co, sum} = a + b + ci;
endmodule

module adder_t7a (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;
    reg     [4:0]   tmp;

    always @(a or b or ci) begin
        #12 tmp = a + b + ci;
            {co, sum} = tmp;
    end
endmodule

module adder_t7b (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;
    reg     [4:0]   tmp;

    always @(a or b or ci) begin
            tmp = a + b + ci;
        #12 {co, sum} = tmp;
    end
endmodule

module adder_t6 (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;

    always @(a or b or ci)
        {co, sum} = #12 a + b + ci;
endmodule

module adder_t11a (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;
    reg     [4:0]   tmp;

    always @(a or b or ci) begin
        tmp       = #12 a + b + ci;
        {co, sum} =     tmp;
    end
endmodule

module adder_t11b (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;
    reg     [4:0]   tmp;

    always @(a or b or ci) begin
        tmp       =     a + b + ci;
        {co, sum} = #12 tmp;
    end
endmodule

module adder_t2 (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;

    always @(a or b or ci)
        #12 {co, sum} <= a + b + ci;
endmodule

module adder_t3 (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;

    always @(a or b or ci)
        {co, sum} <= #12 a + b + ci;
endmodule

module adder_t9c (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;
    reg     [4:0]   tmp;

    always @(a or b or ci or tmp) begin
        tmp       <= #12 a + b + ci;
        {co, sum} <=     tmp;
    end
endmodule

module adder_t9d (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg             co;
    reg     [3:0]   sum;
    reg     [4:0]   tmp;

    always @(a or b or ci or tmp) begin
        tmp       <=     a + b + ci;
        {co, sum} <= #12 tmp;
    end
endmodule

module adder_t4 (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;

    assign #12 {co, sum} = a + b + ci;
endmodule

module adder_t10a (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    wire    [4:0]   tmp;

    assign     tmp       = a + b + ci;
    assign #12 {co, sum} = tmp;
endmodule

module adder_t10b (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    wire    [4:0]   tmp;

    assign #12 tmp       = a + b + ci;
    assign     {co, sum} = tmp;
endmodule

module adder_t5 (co, sum, a, b, ci);
    output          co;
    output  [3:0]   sum;
    input   [3:0]   a, b;
    input           ci;
    reg     [4:0]   tmp;

    always @(a or b or ci) begin
        tmp = a + b + ci;
    end
    assign #12 {co, sum} = tmp;
endmodule
