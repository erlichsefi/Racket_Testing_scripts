
mkdir script
for f in *.zip
	do
		mkdir tmp
		unzip "$f" -d ./tmp/
		cat tmp/* > "./script/$f.rkt"
		rm -rf tmp
	done


for f in *.rar
	do
		mkdir tmp
		unrar x "$f" ./tmp/
		cat tmp/* > "./script/$f.rkt"
		rm -rf tmp
	done
