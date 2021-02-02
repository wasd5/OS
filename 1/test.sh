gcc warmup1.c -o warmup1
./warmup1 sort test.tfile > mytest.tfile
diff mytest.tfile test.tfile.out
