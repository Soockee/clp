#!/bin/bash
mkdir archives
mkdir readable-archives
rm -rf archives/*
rm -rf readable-archives

./clp c --print-archive-stats-progress ./archives/arch-apache /mnt/logs/apache.log
./clp c --print-archive-stats-progress --schema-path ./schemas/apache-scheme.txt ./archives/apache-user /mnt/logs/apache.log

#./clp c --print-archive-stats-progress ./archives/arch-thunderbird /mnt/logs/thunderbird.log
#./clp c --print-archive-stats-progress --schema-path ./schemas/thunderbird-shit-scheme.txt ./archives/arch-thunderbird-shit-scheme /mnt/logs/thunderbird.log

cd archives
du -sh -- *