#!/bin/sh

USER=elastic
PASSWD=password
curl -u $USER:$PASSWD -X GET "localhost:9200/_cat/health?v&pretty"
curl -u $USER:$PASSWD -X PUT "localhost:9200/customer?pretty&pretty"
curl -u $USER:$PASSWD -X GET "localhost:9200/_cat/indices?v&pretty"
curl -u $USER:$PASSWD -X PUT "localhost:9200/customer/_doc/1?pretty&pretty" -H 'Content-Type: application/json' -d'
{
  "name": "John Doe"
}
'
curl -u $USER:$PASSWD -X GET "localhost:9200/customer/_doc/1?pretty&pretty"
