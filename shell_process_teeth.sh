#!/bin/bash -l
needle_internal_radius=0.4
outer_radius=0.5
domain_gridsize=0.1
tip_to_end=10

inlet_radius=1

hole_radius=0.01
kinematic_viscosity=1
results_dir=test_tube
name_of_job="Teeth_$hole_radius""_"$needle_internal_radius"_"$tip_to_end

## mesh creation using gmsh on the fly
module load mesa gmsh
module load python/2.7.9
module load boost/1_54_0/mpi/intel-2015-update2
module load openfoam/2.3.1/intel-2015-update2

LOCATION=$(pwd)

for number in {1..10}
do

echo '###################################################'
echo '###################################################'
echo 'number is ' $number
echo '###################################################'
echo '###################################################'

LOCATION_DATA=$LOCATION/Conical_Tube/Data_Cone
mkdir $LOCATION_DATA

LOCATION_WK=$LOCATION/Conical_Tube/Case$name_of_job$number

cd $LOCATION_WK



sample -latestTime
##
echo "Copying the sets files" 
##
Latest_time=$(ls $LOCATION_WK/postProcessing/sets/ )
B=$(ls $LOCATION_WK/postProcessing/sets/$Latest_time )
echo $B
oldname=$LOCATION_WK/postProcessing/sets/$Latest_time/$B
newname=$LOCATION_DATA/Case$number"_sets_"$Latest_time"_"$B
echo $oldname
echo $newname
cp $oldname $newname

##
echo "Copying the surface files" 
##
Latest_time=$(ls $LOCATION_WK/postProcessing/surfaces/ )
B=$(ls $LOCATION_WK/postProcessing/surfaces/$Latest_time )
echo $B
oldname=$LOCATION_WK/postProcessing/surfaces/$Latest_time/$B
newname=$LOCATION_DATA/Case$number"_sets_"$Latest_time"_"$B
echo $oldname
echo $newname
cp $oldname $newname

done

