#!/bin/bash -l

## mesh creation using gmsh on the fly

directory_to_test=Conical_Tube
number_of_runs=10
simulation_length=20
NAME_STEM=Teeth_cone
LOCATION=$(pwd)
RED='\033[0;31m'
NC='\033[0m' # No Color
for number in {1..10}
do 

Text=$(tac $LOCATION/$directory_to_test/$NAME_STEM.*.$number | grep -m 1 '^Time')
echo -e "Simulation $number $NAME_STEM Time ${RED} ${Text:6} ${NC}" 
done


