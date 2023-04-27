---
title: Community cluster
layout: default
parent: Community
has_children: true
---

# How do I manage a FeatureBase Community cluster?

A FeatureBase Cluster is a distributed system that is maintained by `etcd` which runs on each node.

The system requires at least three nodes to maintain data consistency and fault tolerances. <!--from https://stackoverflowteams.com/c/molecula/questions/179-->

## Before you begin
{% include /com-install/com-install-before-begin.md %}

## How do I setup a cluster?

* [Learn how to setup a FeatureBase cluster](/docs/community/com-cluster/com-cluster-setup)

## How do I resize a cluster?

FeatureBase clusters cannot be resized. However, they can be scaled by backing-up then restoring to a newer, larger cluster.

* [Learn about FeatureBase backup and restore](/docs/community/com-backup/com-backup-home)

## How do I safely change the `partition-to-node-assignment` parameter?

* [Safely change cluster partition-to-node-assignment](/docs/community/com-cluster-change-partition-node)

## How do I setup cluster metrics?

Cluster metrics are a subset of FeatureBase metrics.

* [Learn about FeatureBase metrics](/docs/community/com-monitoring/com-monitoring-metrics-fb#cluster-metrics)
* [Learn how to setup FeatureBase metrics](/docs/community/com-monitoring/com-monitoring-runtime-enable)
