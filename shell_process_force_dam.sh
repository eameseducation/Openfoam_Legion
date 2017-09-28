#!/bin/bash -l

## mesh creation using gmsh on the fly

LOCATION=$(pwd)
LOCATION_SUM=$LOCATION/Dam_break/force_summary
mkdir $LOCATION_SUM
for number in {1..8}
do

echo '###################################################'
echo '###################################################'
echo 'number is ' $number
echo '###################################################'
echo '###################################################'

LOCATION_DATA=$LOCATION/Dam_break/InterfoamfineDam_finer$number/postProcessing/forces/0/forces_0.00119048.dat

cp $LOCATION_DATA $LOCATION_SUM/forces_finer$number.dat

done

