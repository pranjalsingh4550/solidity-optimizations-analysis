# Manticore

This folder consists of all the code components and commands required to execute Manticore. Since we were facing issues with the latest version of Manticore, we would be using a previous docker version to process over all the solidity smart contracts.

The command to execute the docker is available within the run_manticore_docker bash script. Or directly run the same within this folder

```sudo docker run -it -v `pwd`/sample_code:/manticore/sample_code trailofbits/manticore:0.3.7```.

The sample code directory consists of 2 types of code components. One is sol scripts which can be processed directly using Manticore CLI, while other is a python script which makes use of the Manticore API.

Within the docker, the Sol scripts can be processed using the command

`manticore ./script.sol`

On the other hand the Python API based scripts can be executed within the docker using 

`python3.7 ./script.py`

where the manticore module has already been linked to python3.7 within the docker

### Citation

Few of these samples has been taken from the original [Manticore Repository](https://github.com/trailofbits/manticore)
