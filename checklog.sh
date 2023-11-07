#!/bin/bash

#grep "tcp" access.log | cut -d ' ' -f 1,5 | sort | uniq

current=`date +"%Y/%m/%d"`
yesterday=`date -d "1 day ago" +"%Y/%m/%d"`
grep $yesterday access.log | grep "tcp" | cut -d ' ' -f 1,5  | sort | uniq
grep $current access.log | grep "tcp" | cut -d ' ' -f 1,5  | sort | uniq

