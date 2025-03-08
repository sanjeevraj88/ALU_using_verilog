# ALU_using_verilog

- `src/alu.v`: Contains the Verilog code for the ALU module.
- `src/testbench.v`: Contains the Verilog code for the testbench used to verify the functionality of the ALU.

## ALU Operations

The ALU supports the following operations based on the 4-bit opcode:

- `0000`: OR reduction
- `0001`: AND reduction
- `0010`: XOR reduction
- `0011`: Bitwise AND
- `0100`: Bitwise OR
- `0101`: Bitwise XOR
- `0110`: Greater than comparison
- `0111`: Less than comparison
- `1000`: Bitwise NOT
- `1001`: Equality comparison
- `1010`: Addition with carry-out
- `1011`: Subtraction
- `1100`: Multiplication (8-bit result)
- `1101`: Logical right shift
- `1110`: Logical left shift
- `1111`: Bitwise NOT (duplicate case)

## Testbench

The testbench (`src/testbench.v`) initializes the inputs and applies various test cases to verify the functionality of the ALU. It includes test cases for each supported operation and displays the results.

## Running the Simulation

To run the simulation, use a Verilog simulator such as ModelSim or Icarus Verilog. The following steps outline how to run the simulation using Icarus Verilog:

1. Compile the ALU and testbench modules:
    ```sh
    iverilog -o alu_tb src/alu.v src/testbench.v
    ```

2. Run the simulation:
    ```sh
    vvp alu_tb
    ```

3. Observe the output in the terminal to verify the results of the test cases.

## License

This project is licensed under the MIT License.