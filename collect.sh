#bash collect.sh > name.txt
for f in *.txt
	do
		echo "------------------------------"
		echo "$f"
		tail -n 1 "$f"
	done
