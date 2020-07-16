#!/bin/sh

while true
do
  date
  curl -u elastic:password -X GET "localhost:9200/customer/_doc/1?pretty&pretty"
  sleep 1 5
done
