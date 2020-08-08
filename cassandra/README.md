# deploy Cassandra 3.11.3 w/o LOCAL_JMX

### build custom image

```
docker  build -t cassandra-no-local-jmx:3.11.3 .
```

### run conatainers

```
docker-compose up -d
```

### make sure username and password with nodetool

```
nodetool -u cassandra -pw cassandra status
```

### test query

```
$ cqlsh -u cassandra -p cassandra -e "select * from test.test_table;"

 id        | data           | update_time
-----------+----------------+---------------------------------
   test_id |           text | 2019-09-10 11:21:59.001000+0000
 cassandra | extension test | 2020-07-07 00:06:00.001000+0000

(2 rows)
```

# AppDynamics machine agent Cassandra monitoring extension config

```
### ANY CHANGES TO THIS FILE DOES NOT REQUIRE A RESTART ###
#This will create this metric in all the tiers, under this path
metricPrefix: Custom Metrics|Cassandra

#This will create it in specific Tier. Replace <TIER_NAME>
#metricPrefix: "Server|Component:<TIER NAME OR TIER ID>|Custom Metrics|Cassandra"

# List of JMX Servers
servers:
  - displayName: "Cassandra 3.11.3"
    # displayName is a required field. This will be your server name that will show up in metric path.

    # you can use just a host and port to connect or use your full serviceURL to make the connection
    # DO NOT choose both, comment one out and only use the other.
    host: ""
    port: ""
    serviceUrl: "service:jmx:rmi:///jndi/rmi://localhost:7199/jmxrmi"
    username: "cassandra"
    password: "cassandra"
```
