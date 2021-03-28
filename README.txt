# Prerequisites

  1. SQLite3
  1. jq
  1. `sh`, `wc`, `uniq`, `sort`.

  1. and a CSV file columned by `timestamp,price,volume` (named as `trades.csv`).

# Procedures And Scripts
  1. `00-download-csv.sh`
  1. `01-verify-timestamps.sh`
  1. `02-create-table-and-import-csv.sh`
  1. `03-mimx-timestamp.sh`
  1. `04-verify-counts.sh`
  1. `05-window-by-timestamp.sh`
  1. `06-all-stat.sh`
