#!/bin/sh

sqlite3 ./trades.sqlite3 <<'EO_SQL'
.mode csv
SELECT MIN(timestamp), MAX(timestamp) FROM trades;
EO_SQL

