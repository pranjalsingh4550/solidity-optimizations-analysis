### Instructions to run Gasol

- A sequence of commands is needed for which we use `run-gasol.sh`.
- Change the variables `GASOL_DIR`, `PYTHON` and `SOLC` to the path to the Gasol repository, a python installation with pandas and the Solidity compiler (`solc` if installed system wide).
- These are NOT environment variables in the current script
- We have a rudimentary autocomplete implemented in the script: the script searches for files of the form `../basic-programs/<file_name_input>*.sol`, so you can use a prefix.

### What the script does
- Gasol requires the JSON produced with the `--combined-json asm` flag and produces the same, but `solc` can only consume the format of `--asm-json`.
- Until we find a solution, our workaround is to insert numeric literals in the solidity input that should be optimized out.
- Reminder: Solidity JSON assembly has hexadecimal integers, not decimal.
- We use `diff`/`vimdiff` on the output linewise files. The `jq` command is needed to obtain linewise comparisons.

### General Tips
- If it isn't possible to generate EVM bytecode from the optimized JSON, use `grep` or `grep -c` (count) to check if the expected changes/reductions have been performed.
- We aren't including many sample outputs as they are huge files of 50-100 KB for our programs.
