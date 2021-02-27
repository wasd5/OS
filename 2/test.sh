gunzip -c w2data.tar.gz | tar xvf -
/bin/rm -f section-A.csh section-B.csh analyze-trace.txt
/bin/cp w2data/scripts/section-A.csh .
/bin/cp w2data/scripts/section-B.csh .
/bin/cp w2data/scripts/analyze-trace.txt .
chmod 755 *.csh analyze-trace.txt

make warmup2
