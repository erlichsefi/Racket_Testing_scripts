
TESTFILE="test.txt"
TESTAMOUNT=5
REPORT="greadreports"
POINTSLOSS=15

rm -r $REPORT
mkdir $REPORT
for f in *.rkt
	do
	FAILS=0;
	echo "tests results: " > "$REPORT/${f}_grade.txt"
	for t in `seq $TESTAMOUNT`
		do	
		cp "$f" "$f.tmp.rkt"
		echo `sed "${t}q;d" $TESTFILE` >> "$f.tmp.rkt"
		racket "$f.tmp.rkt" > tmp.txt
		
		if tail -n 1 tmp.txt | grep --quiet "tests passed."; then
	  		echo "[ V ] `sed "${t}q;d" $TESTFILE`" >> "$REPORT/${f}_grade.txt"
		else
  			echo "[ X ] `sed "${t}q;d" $TESTFILE`" >> "$REPORT/${f}_grade.txt"
			((FAILS++))
		fi
		
		rm "$f.tmp.rkt" tmp.txt
	done
	echo "Final results: $((100-FAILS*POINTSLOSS))" >> "$REPORT/${f}_grade.txt"
	echo "**********Done**********"
done




