### Test Suite for Ethereum Smart Contract Optimization Tools

This repository contains deliberately unoptimized Solidity contracts.
We use these to check the existing Solidity compiler (v 0.8.25 at the time of testing) as well as other tools to check which optimizations are done by each of them. This is our test suite.

Done as a part of the CS738 course project (Advanced Compiler Optimizations) at IIT Kanpur in 2023-24 II semester.

Done by Sabari M, Moinuddin and Pranjal Singh under the guidance of Prof Amey Karkare.

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

