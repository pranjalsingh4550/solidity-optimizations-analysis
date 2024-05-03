# Solidity Compiler Optimizer

This directory contains the Solidity code we have used to test the Optimizer available within the Solidity Compiler and few of the optimizations which has been implemented within the same. 

### Compilation and execution commands

- For the current version of the Solidity, the compilation flags need to include optimization explicitly (which we find bizarre).
- Generating Yul IR code: `solc --optimize --ir-optimized input_file.solc > output_file`.
- Some optimizations are done directly on the EVM bytecode/assembly (only two as per the documentation), so before reporting an optimization as absent in `solc`, we also check the assembly.
- Command to output EVM assembly: `solc --optimize --asm input_file.solc > output_file`.

### Directory Structure

- `basic-testcases/` contains Solidity all source files.
- For each Solidity contract `name.sol`, `name.ir` and `name.observations` are present containing the Yul IR and observations from the IR and bytecode analysis.

### General Tips

- Solidity's help menu is confusing. To confirm that you have found the right optimization flags, you may check the number of lines: `solc --confusion-flags input.solc | wc -l`.
- Both Yul IR and assembly output are heavily annotated with comments that are snippets from the source. Search for operations/lines directly to reach corresponding Yul/EVM instructions.
- Literal numbers are converted to hexadecimal, so for easy optimization-searching, use hexadecimal numbers in Solidity programs. (And don't bother converting to decimal in either phase!)

