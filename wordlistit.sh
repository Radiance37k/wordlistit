#!/bin/bash

#Full path to tok/main.go file
tok=/opt/git/hacks/tok/main.go

domain=$1

SECONDS=0
echo "Fetching data with gau, this might take a while..."
gau $domain > $domain-temp.txt
echo "Extracting info..."
cat $domain-temp.txt | unfurl -u keys > $domain-keys.txt
cat $domain-temp.txt | unfurl -u values > $domain-values.txt
cat $domain-temp.txt | unfurl -u domains > $domain-domains.txt
cat $domain-temp.txt | unfurl -u paths > $domain-paths.txt

#+++
# This section fetches files and directories using fff (takes quite some time)
# and searches it for certain attributes
# add this as a flag later, since it takes quite some time

#echo "This will most likely take quite some time..."
#cat $domain-temp.txt | fff -s 202 -s 404 --output $domain > /dev/null

#echo "Finding filenames..."
#find $domain/ -type f -name '*.body' | html-tool attribs src | grep '\.js$'
#---

rm $domain-temp.txt

echo "Combining words from gau..."
cat $domain-keys.txt > temp.txt
sed 's#/#\n#g' $domain-paths.txt | sort -u >> temp.txt
cat $domain-values.txt >> temp.txt
cat $domain-domains.txt >> temp.txt

echo "Deleting gau related temp files..."
rm $domain-keys.txt
rm $domain-paths.txt
rm $domain-values.txt
rm $domain-domains.txt

echo "Fetching with curl..."
curl https://tools.ietf.org/html/rfc1866 -o rfc.html -s
curl $domain -o words.html -s

echo "Cleaning up data from curl..."
cat rfc.html | go run $tok | tr '[:upper]' '[:lower]' | sort -u > rfc-words.txt
rm rfc.html
cat words.html | go run $tok | tr '[:upper]' '[:lower]' | sort -u > $domain-words-full.txt
rm words.html

echo "Extracting and cleaning data from curl..."
comm -13 rfc-words.txt $domain-words-full.txt >> temp.txt
rm $domain-words-full.txt

cat temp.txt | sort -u > $domain_wordlist.txt
rm temp.txt

duration=$SECONDS
echo "Wordlist creation completed in : $(($duration / 60)) minutes and $(($duration % 60)) seconds."
