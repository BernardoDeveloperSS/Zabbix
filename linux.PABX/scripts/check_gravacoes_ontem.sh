#!/bin/sh
DIA=$(date -d "yesterday" +"%Y%m%d")
QUANTIDADE=$(find /backup/monitor/ -maxdepth 1 -type d -name "$DIA" |wc -l)
DOMINGO=`date -d "yesterday" +%A`

if [ $DOMINGO != "Sunday" ] && [ $QUANTIDADE -eq 0 ]; then
    echo "$DIA"
else
    echo "0"
fi
