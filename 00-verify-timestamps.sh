#!/bin/sh

cat korbitKRW.csv | cut -f1 -d , > timestamps.txt

echo -n "Total rows: "
wc -l timestamps.txt

echo -n "Unique rows: "
cat timestamps.txt | sort | uniq | wc -l

