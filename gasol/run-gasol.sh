
GASOL_DIR=../../gasol-optimizer
PYTHON=~/anaconda3/bin/python3
SOLC=solc-static-linux
SOLC_INPUT_DIR=../Optimizer_SolidityCompiler/basic-programs/

if [ $# -ne 1 ]
then
	echo "Usage: ./run-gasol.sh <sol file in \$SOLC_INPUT_DIR>"
	echo "Doing this to prevent cluttering ../basic-programs"
	exit 1
fi

file_name=`ls $SOLC_INPUT_DIR/$1*.sol`
file_name=`echo $file_name | sed 's/..*\///g'`

if [[ ${file_name:-4} == ".sol" ]]
then
	echo "This script needs the name to end with .sol"
	exit 1
fi	

output_json=${file_name:0:-4}.json_solc
$SOLC --optimize --combined-json asm $SOLC_INPUT_DIR$file_name > $output_json
$PYTHON $GASOL_DIR/gasol_asm.py $output_json

gasol_output_json=${output_json:0:-10}_optimized.json_solc
echo Created file=$gasol_output_json

unoptimized_json=$output_json\_linewise.json_solc
optimized_json=$gasol_output_json\_optimized_linewise.json_solc
jq . $output_json > $unoptimized_json
jq . $gasol_output_json > $optimized_json
rm $output_json $gasol_output_json

echo You can compare files $unoptimized_json and $optimized_json
read -p "Which tool to use? (diff/vimdiff?) (Empty to exit): " diff_tool
if [ $diff_tool ]
then
	$diff_tool $unoptimized_json $optimized_json
fi

