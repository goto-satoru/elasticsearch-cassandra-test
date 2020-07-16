#!/bin/sh

while true;
do
  cqlsh -u cassandra -p cassandra -e "select * from test.test_table;"
  sleep 1  
done
