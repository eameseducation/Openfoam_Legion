#!/bin/bash


resolution1=0.1
resolution2=0.1
no_obstacles=1
no_layers=10
lock_length=1.0
width=0.15
total_length=2.0
obstacle_length=0.08
obstacle_width=$obstacle_length
obstacle_centre=1.0
Height=0.15

number=2

lock_length=`bc <<< 0.5*$number+0.5`
lock_length2=`expr $lock_length1`
c=`bc <<< 0.5*$number+0.5`; 
echo HELLO
echo $c
echo $lock_length2

Length_simulation=(0.4 0.8 1.0 2.0 4.0 6.0 8.0 10)

number=3
lock_length=${Length_simulation[$number-1]}


echo $lock_length

