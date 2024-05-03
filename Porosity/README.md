# Porosity

This folder consists of all the code components and commands required to run Porosity. Porosity takes as input Solidity compiled byte code which gets decompiled back into a solidity like code. Hence we should run the Solc independently and compile the Solidity code and then given as input this back to the tool. But since the tool has not been actively maintained, it doesnt support the latest versions of Solidity. The supported version of solidity compiler is 0.4.15.

Hence the initial step would be to use the docker version of Solidity compiler to generate the compiled byte code as well as the ABI format which is required by porosity

```sudo docker run -v `pwd`/sample_code/:/sources ethereum/solc:0.4.16 -o /sources/output --abi --bin /sources/Contract.sol```

Once the above command executes, the compiled file and ABI would be created in the output folder. This can be used to run with Porosity. To give access to the folder since it is being shared with the docker run the command

`sudo chmod -R a+rwx ./ `

Porosity is not available in form of docker and we can directly build it from source. The instructions to install Porosity is available within the [Porosity Repository](https://github.com/msuiche/porosity/tree/master). Once we build porosity and add it to the path, we can access it via the CLI. Once correctly build and path added, we should be able to see the docs using the terminal commond

`porosity`

Porosity is capable of taking inputs in two formats
1. Code: The byte code can be copied and directly given along with the abi in json format.

It can be done by saving both the abi and bin file contents to variables

`abi=$(cat ./SimpleStorage.abi)`
`bytecode=$(cat ./SimpleStorage.bin)`

Then run porosity using these variables

`porosity --code $bytecode --abi $abi`

2. Code File : Here the path to the byte code needs to be provided.

`porosity --code-file ./SimpleStorage.bin --abi $abi`

The above commands can be executed with various attributes as below:
> `--list` - get the list of functions along with the Hash

> `--disassm` - get the disassembled code

> `--cfg` - create the control flow graph

> `--cfg-full` - create the control flow graph along with the instructions

> `--decompile` - create the decompiled code