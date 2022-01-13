#!/bin/bash

echo "Joining meta nodes to cluster..."
# Join meta nodes to cluster
docker exec cnosdb-meta-01 cnosdb-ctl add-meta cnosdb-meta-01:8091
docker exec cnosdb-meta-01 cnosdb-ctl add-meta cnosdb-meta-02:8091
docker exec cnosdb-meta-01 cnosdb-ctl add-meta cnosdb-meta-03:8091

docker exec cnosdb-meta-01 bash -c "cnosdb-ctl show"

echo "Joining data nodes to cluster..."
# Join data nodes to cluster
docker exec cnosdb-meta-01 cnosdb-ctl add-data cnosdb-data-01:8088
docker exec cnosdb-meta-01 cnosdb-ctl add-data cnosdb-data-02:8088

echo "Cluster successfully created"

docker exec cnosdb-meta-01 bash -c "cnosdb-ctl show"
