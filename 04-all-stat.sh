#!/bin/sh

START=1378189897
END=1389290100
#END=1616925895

# Open, Close, High, Low, Start, End, Avg, WAvg, Vol.
sqlite3 ./trades.sqlite3 > 04-all-stat.csv <<EO_SQL
.mode csv

SELECT
	(SELECT price FROM trades WHERE ts_seg=a.ts_seg
   ORDER BY timestamp ASC LIMIT 1) AS open
 ,(SELECT price FROM trades WHERE ts_seg=a.ts_seg
   ORDER BY timestamp DESC LIMIT 1) AS close
 ,MAX(price) AS high
 ,MIN(price) AS low
 ,(SELECT timestamp FROM trades WHERE ts_seg=a.ts_seg
   ORDER BY timestamp ASC LIMIT 1) AS start
 ,(SELECT timestamp FROM trades WHERE ts_seg=a.ts_seg
   ORDER BY timestamp DESC LIMIT 1) AS end
 ,AVG(price) AS avg
 ,SUM(price * volume) / SUM(volume) AS wavg
 ,SUM(volume) as volume
FROM trades a
WHERE a.timestamp BETWEEN ${START} AND ${END}
GROUP BY a.ts_seg;
EO_SQL

jq -Rsn '
[inputs
	| . / "\n"
	| (.[] | select(length > 0) | . / ",") as $input
	| {"open": $input[0], "close": $input[1],
	   "high": $input[2], "low": $input[3],
	   "start": $input[4], "end": $input[5],
	   "average": $input[6], "weighted_average": $input[7],
		 "volume": $input[8] | gsub("[\\r\\t]"; "") }]
	' <04-all-stat.csv


