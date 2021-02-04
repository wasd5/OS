#!/bin/tcsh -f
gunzip -c w1data.tar.gz | tar xvf -
/bin/rm -f section-A.csh section-B.csh do-this-first.csh
/bin/cp w1data/scripts/section-A.csh .
/bin/cp w1data/scripts/section-B.csh .
/bin/cp w1data/scripts/do-this-first.csh .


if (-f my402list.h) then
	mv my402list.h my402list.h.submitted
endif
if (-f cs402.h) then
	mv cs402.h cs402.h.submitted
endif
/bin/cp w1data/cs402.h .
/bin/cp w1data/my402list.h .
make warmup1

echo "========================== section A ============================="
./section-A.csh
echo "========================== section B ============================="
./section-B.csh
