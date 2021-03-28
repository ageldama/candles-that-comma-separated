#!/bin/sh

SEG_SECS=30

MIN=$(echo "SELECT MIN(timestamp) FROM trades;" | sqlite3 ./trades.sqlite3)
echo $MIN

time sqlite3 ./trades.sqlite3 <<EO_SQL
ALTER TABLE trades ADD COLUMN ts_seg INTEGER DEFAULT NULL;

CREATE INDEX ix_trades_ts_seg ON trades (ts_seg);

UPDATE trades SET ts_seg = timestamp / ${SEG_SECS};
EO_SQL



