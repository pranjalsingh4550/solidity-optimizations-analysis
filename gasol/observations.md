
### Inequalities in data flow (`basic-programs/data-flow-\*.sol`)
- Unreachable code is not removed. Optimizations are within basic blocks, so this is not expected.

### Arithmetic Simplifications (`basic-programs/algebraic-simplifications.sol`)
- One might expect better optimizations here as there's only one basic block.
- We did not find any significant difference. It appears that the stack functional specification is indifferent to algebraic properties of values.
