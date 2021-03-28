# Prerequisites

  1. SQLite3
  1. jq
  1. `sh`, `wc`, `uniq`, `sort`.

  1. and a CSV file columned by `timestamp,price,volume` (named as `trades.csv`).

# Procedures And Scripts
  1. `00-verify-timestamps.sh`
  1. `01-create-table-and-import-csv.sh`
  1. `02-mimx-timestamp.sh`
  1. `02-verify-counts.sh`
  1. `03-window-by-timestamp.sh`
  1. `04-all-stat.sh`
