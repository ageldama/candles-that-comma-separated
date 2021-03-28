#!/bin/sh
curl -O http://api.bitcoincharts.com/v1/csv/korbitKRW.csv.gz
gzip -d korbitKRW.csv.gz
mv korbitKRW.csv trades.csv

