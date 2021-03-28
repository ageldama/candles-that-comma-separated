#!/bin/sh

echo -n "Total rows (CSV): "
wc -l korbitKRW.csv

echo -n "Total rows (SQLite3): "
sqlite3 ./trades.sqlite3 <<'EO_SQL'
.mode csv
SELECT COUNT(*) FROM trades;
EO_SQL


