---
title: Data modeling overview
layout: default
parent: Concepts
nav_order: 2
has_children: true
---

# Data modeling overview
{: .no_toc }

{% include /concepts/summary-data-modeling.md %}

{% include page-toc.md %}

## Before you begin

{% include /com-install/com-install-before-begin.md %}


## Concepts

When importing data into FeatureBase, you have a number of choices about how to represent that data.

Choices about data representation mean trade-offs in both storage and runtime performance, and there are no best answers for all circumstances.

This section offers guidance on likely ways to make these decisions, and a bit of theory describing what's happening under the hood to help you make better choices. If you're not sure, it's always a good idea to try things out and compare results.

## Facts and Dimensions

In a standard relational model, one often hears about "fact" tables vs "dimensions". Each record in a fact table typically represents an immutable event (e.g. someone clicked a link or made a purchase, a temperature reading was recorded, etc). Dimensions on the other hand usually represent slower changing "metadata". If your fact is that a user performed a certain action, one of your dimensions might be a "users" table that records things like date of birth, gender, address. Recording this information along with every fact would lead to a huge amount of duplication so it is typically split out.

In FeatureBase, you can model things as you typically would in a relational database with facts and dimensions split apart, but FeatureBase has some unique capabilities that give you more options. Usually when you're doing queries that involve facts, you're not interested in the events themselves, but one of the dimensions that they affect. For example, you might want to know how many users visited a certain blog post as opposed to how many times that blog post was visited. They sound similar, but the first query is typically much more difficult because you're counting the distinct number of users rather than the number of events. In FeatureBase, you could add a "pages_visited" set type field directly to your users dimension and get the distinct functionality essentially for free. The power of the set field is that it can track multiple pages visited per user without additional overhead.

But wait! There's more. What if you only wanted to get the set of users who visited a page within the past month? You'd have to go back to joining the facts with the dimension right? Nope. FeatureBase also has "time" fields which are just like set fields except you have the option to associate a coarse-grained timestamp with every user-page association (in fact you can have multiple timestamps associated with a single user-page pair). Currently the timestamps can be at yearly, monthly, daily, or hourly granularity, and FeatureBase lets you query across arbitrary time ranges.

It takes up more space to store things like this, but if you have a workload that demands low latency for these types of queries it can be a very worthwhile tradeoff over storing the facts separately and joining across the dimensions at query time.

## Fields

Fields are used to segment rows within an index, for example to define different functional groups. A FeatureBase field might correspond to a single field in a relational table, where each row in a standard FeatureBase field represents a single possible value of the relational field. Similarly, an integer field could represent all possible integer values of a relational field.

<!-- TODO

### Field Options

this section is a placeholder, to provide minimal information about field options that are still exposed in the API, and linked from the http-api page -->

## Ranked

Ranked Fields maintain a sorted cache of column counts by Row ID (yielding the top rows by columns with a bit set in each). This cache facilitates the TopN query. The cache size defaults to 50,000 and can be set at Field creation.

<!-- TODO diagram? -->

### LRU

The LRU cache maintains the most recently accessed Rows.

<!-- TODO diagram? -->

### Time Quantums

Setting a time quantum on a field creates extra views which allow ranged Row queries down to the time interval specified.

* [Learn about IDSet and Time quantums](/docs/sql-guide/data-types/data-type-idset)
* [Learn about STRINGSET and Time quantums](/docs/sql-guide/data-types/data-type-stringset)

### TTL (Time To Live)

TTL is an option for fields with the type of time. Time quantum is required for TTL to function.

* [Learn about IDSet and TTL](/docs/sql-guide/data-types/data-type-idset)
* [Learn about STRINGSET and TTL](/docs/sql-guide/data-types/data-type-stringset)
