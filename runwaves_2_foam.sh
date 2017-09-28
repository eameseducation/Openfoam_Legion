#!/bin/bash


###############################################
#
#      Solver information
#
#
echo WAVES_APPBIN=$FOAM_APPBIN
echo WAVES_LIBBIN=$FOAM_LIBBIN
echo WAVES_DIR=/home/ucemiea/Scratch/waves2Foam
#
##################################################


name_of_job="Dam_$locklength"

###############################################
#
#      Start of bash for parallel
#
##################################################


# 1. Force bash
#$ -S /bin/bash

# 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=0:10:0

# 3. Request 1 gigabyte of RAM.
#$ -l mem=1G

# 4. Request 15 gigabyte of TMPDIR space (default is 10 GB)
#$ -l tmpfs=15G

# 5. Set up the job array.  In this instance we have requested 1000 tasks
# numbered 1 to 1000.
#$ -t 1-1

# 6. Set the name of the job.
#$ -N Wave_break

# 7. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/ucemiea/Scratch/Dam_break/

# 8. Parse parameter file to get variables.
number=$SGE_TASK_ID

# 9. Run the program (replace echo with your binary and options).
##
## 
## mesh creation using gmsh on the fly
module load mesa gsl
module load mesa gmsh
module load python/2.7.9
module load boost/1_54_0/mpi/intel-2015-update2
module load openfoam/2.3.1/intel-2015-update2



LOCATION=$(pwd)

LOCATION_WK=$LOCATION/Interfoam$name_of_job$number
cp -r $LOCATION/Interfoam0 $LOCATION_WK
 
lock_length=`bc <<< 0.5*$number+0.5`

echo "######################################"
echo "Testing the data in gmsh with openfoam"
echo $LOCATION_WK
echo $number
echo "######################################"

