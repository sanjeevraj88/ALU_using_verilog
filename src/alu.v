module alu(x, y, a, b, opcode);
    input [3:0] a, b, opcode;
    output reg [3:0] x, y;

    always @(*) begin
        // Default output values to avoid latches
        x = 4'b0000;
        y = 4'b0000;

        case (opcode)
            // Logical Operations
            4'b0000: x = {3'b000, |a};         // OR reduction
            4'b0001: x = {3'b000, &a};         // AND reduction
            4'b0010: x = {3'b000, ^a};         // XOR reduction
            4'b0011: x = a & b;                // Bitwise AND
            4'b0100: x = a | b;                // Bitwise OR
            4'b0101: x = a ^ b;                // Bitwise XOR
            4'b0110: x = {3'b000, (a > b)};    // Greater than comparison
            4'b0111: x = {3'b000, (a < b)};    // Less than comparison

            // Unary Operations
            4'b1000: x = ~a;                   // Bitwise NOT
            4'b1001: x = {3'b000, (a == b)};   // Equality comparison

            // Arithmetic Operations
            4'b1010: begin
                {y, x} = a + b;                // Addition with carry-out
                y = (a + b) >> 4;              // Carry-out for addition
            end
            4'b1011: x = a - b;                // Subtraction
            4'b1100: begin
                {y, x} = a * b;                // Multiplication (8-bit result)
                y = (a * b) >> 4;              // Upper 4 bits of multiplication
            end

            // Shift Operations
            4'b1101: x = a >> b;               // Logical right shift
            4'b1110: x = a << b;               // Logical left shift

            // Bitwise NOT (duplicate case for demonstration)
            4'b1111: x = ~a;                   // Bitwise NOT
            
            // Default case for invalid opcode
            default: begin
                x = 4'b0000;
                y = 4'b0000;
            end
        endcase
    end
endmodule