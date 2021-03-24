#!/usr/bin/env bash
kubectl iexec zeliwna-cassandra-0 --container cassandra bash -- cqlsh -u cassandra -p 6sf0kc0f83
