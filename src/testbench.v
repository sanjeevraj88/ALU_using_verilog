module alu_tb;
    // Testbench signals
    reg [3:0] a, b, opcode;
    wire [3:0] x, y;

    // Instantiate the ALU module
    alu uut (
        .x(x),
        .y(y),
        .a(a),
        .b(b),
        .opcode(opcode)
    );

    // Initialize inputs and apply test cases
    initial begin
        // Test Case 1: OR reduction
        a = 4'b1101; b = 4'bxxxx; opcode = 4'b0000; // x = OR(a)
        #10; // wait for 10 ns
        $display("Test 1 - OR reduction: x = %b", x);

        // Test Case 2: AND reduction
        a = 4'b1010; b = 4'bxxxx; opcode = 4'b0001; // x = AND(a)
        #10;
        $display("Test 2 - AND reduction: x = %b", x);

        // Test Case 3: XOR reduction
        a = 4'b1111; b = 4'bxxxx; opcode = 4'b0010; // x = XOR(a)
        #10;
        $display("Test 3 - XOR reduction: x = %b", x);

        // Test Case 4: Bitwise AND
        a = 4'b1100; b = 4'b1010; opcode = 4'b0011; // x = a & b
        #10;
        $display("Test 4 - Bitwise AND: x = %b", x);

        // Test Case 5: Bitwise OR
        a = 4'b1100; b = 4'b1010; opcode = 4'b0100; // x = a | b
        #10;
        $display("Test 5 - Bitwise OR: x = %b", x);

        // Test Case 6: Bitwise XOR
        a = 4'b1100; b = 4'b1010; opcode = 4'b0101; // x = a ^ b
        #10;
        $display("Test 6 - Bitwise XOR: x = %b", x);

        // Test Case 7: Greater than comparison
        a = 4'b1101; b = 4'b1010; opcode = 4'b0110; // x = (a > b)
        #10;
        $display("Test 7 - Greater than: x = %b", x);

        // Test Case 8: Less than comparison
        a = 4'b0101; b = 4'b1010; opcode = 4'b0111; // x = (a < b)
        #10;
        $display("Test 8 - Less than: x = %b", x);

        // Test Case 9: Bitwise NOT
        a = 4'b1100; b = 4'bxxxx; opcode = 4'b1000; // x = ~a
        #10;
        $display("Test 9 - Bitwise NOT: x = %b", x);

        // Test Case 10: Equality comparison
        a = 4'b1010; b = 4'b1010; opcode = 4'b1001; // x = (a == b)
        #10;
        $display("Test 10 - Equality check: x = %b", x);

        // Test Case 11: Addition
        a = 4'b0011; b = 4'b0101; opcode = 4'b1010; // x = a + b, y = carry
        #10;
        $display("Test 11 - Addition: x = %b, y = %b", x, y);

        // Test Case 12: Subtraction
        a = 4'b1011; b = 4'b0110; opcode = 4'b1011; // x = a - b
        #10;
        $display("Test 12 - Subtraction: x = %b", x);

        // Test Case 13: Multiplication
        a = 4'b0011; b = 4'b0010; opcode = 4'b1100; // x = a * b, y = upper bits
        #10;
        $display("Test 13 - Multiplication: x = %b, y = %b", x, y);

        // Test Case 14: Logical right shift
        a = 4'b1100; b = 4'b0001; opcode = 4'b1101; // x = a >> b
        #10;
        $display("Test 14 - Right shift: x = %b", x);

        // Test Case 15: Logical left shift
        a = 4'b1100; b = 4'b0001; opcode = 4'b1110; // x = a << b
        #10;
        $display("Test 15 - Left shift: x = %b", x);

        // Test Case 16: Bitwise NOT
        a = 4'b1100; b = 4'bxxxx; opcode = 4'b1111; // x = ~a
        #10;
        $display("Test 16 - Bitwise NOT: x = %b", x);

        // Finish the simulation
        $finish;
    end
endmodule