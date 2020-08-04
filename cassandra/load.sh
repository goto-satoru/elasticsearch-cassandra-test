#!/bin/sh

while true;
do
  date
  cqlsh -u cassandra -p cassandra -e "select * from test.test_table;"
  sleep 2 
done
