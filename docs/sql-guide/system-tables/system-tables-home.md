---
title: System Tables
layout: default
parent: SQL guide
---

# System Tables
{: .no_toc }

System Tables are logical tables to describe the databases configuration, settings, and metrics.  All tables except `fb_views` are logical, in-memory, and dynamically created upon database creation.

{% include page-toc.md %}

## fb_views

The `fb_views` table is a system table which provides a catalog of all previously created views.

## fb_database_info

The `fb_database_info` table provides a single row which describes the version and state of the database.

## fb_database_nodes

The `fb_database_nodes` table provides a listing of all the cluster nodes or workers in the database, including their connectivity and state.

## fb_exec_requests

The `fb_exec_requests` table provides a query log of requests executed (and executing) by node.

* `fb_exec_requests` keeps only the latest 2000 records (queries)
* `fb_exec_requests.sql` and `fb_exec_requexts.plan` are limited to 4000 characters.

{% include /sql-guide/query-status.md %}

## fb_table_ddl

The `fb_table_ddl` table provides the corresponding Data Definition Language (DDL) to create the existing database's tables.

## fb_performance_counters

The `fb_performance_counters` table provides metrics about the nodes/workers within the database.
