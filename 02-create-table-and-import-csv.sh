#!/bin/sh

rm -v ./trades.sqlite3

time sqlite3 ./trades.sqlite3 <<'EO_SQL'
CREATE TABLE trades (
  timestamp INTEGER NOT NULL,
  price DECIMAL(30, 12) NOT NULL,
  volume DECIMAL(30, 12) NOT NULL
);

CREATE INDEX ix_trades_timestamp ON trades (timestamp);


.separator ","
.headers off
.import trades.csv trades


EO_SQL

