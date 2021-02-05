#!/bin/tcsh
/bin/rm -rf grading_$$
mkdir grading_$$
cd grading_$$
cp ../my402list.c .
cp ../w1data/cs402.h .
cp ../w1data/my402list.h .
cp ../w1data/listtest.c .
cp ../w1data/Makefile .
make
set seeds = (21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1) 
foreach f (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19)
                    @ index = $f + 1
                    echo "===> test_$f"
                    ./listtest -seed=$seeds[$index]
                end
                cd ..
