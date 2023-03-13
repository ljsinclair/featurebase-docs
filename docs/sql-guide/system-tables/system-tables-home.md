---
title: System Tables
layout: default
parent: SQL guide
---

# System Tables
{: .no_toc }

System Tables are logical tables to describe the databases configuration, settings, and metrics.  All tables except fb_views are logical and dynamically created upon looking at them.

{% include page-toc.md %}

## fb_views

The fb_views table is a system table which provides a catalog of all previously created views.

## fb_cluster_info

The fb_cluster_info table provides a single row which describes the version and state of the cluster.

## fb_cluster_nodes

The fb_cluster_nodes table provides a listing of all the cluster nodes including their connectivity and state.

## fb_exec_requests

The fb_exec_requests table provides a query log of requests executed by node.

## fb_table_ddl

The fb_table_ddl table provides the corresponding Data Definition Language to create the existing database's tables.

## fb_performance_counters

The fb_performance_counters table provides metrics of the nodes within the cluster.