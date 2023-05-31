---
title: Concepts
layout: default
has_children: true
nav_order: 2
---
# How does FeatureBase differ to a traditional database?

This high-level overview explains the concepts of cardinality and normalization in relation to traditional databases.

This information provides context for the FeatureBase approach to data storage.

## What is cardinality?

The relationships between data is called **Cardinality** and can be conceptualized as follows:

| Example | Data relationships | Cardinality | Dimensions to represent |
|---|---|---|---|
| A country and capital city | one-to-one | High | Two |
| A country and citizens | one-to-many | Low | Three or more |
| Citizens and government services | many-to-many | Low | Three or more |

### High cardinality data

High cardinality data has a high number of unique relationships which can be represented in a two dimensional table:

{% include /concepts/concept-eg-high-cardinality.md %}

## Low cardinality data

Data described as **low cardinality** have multiple relationships has a one-to-many or many-to-many relationship:

{% include /concepts/concept-eg1-one-many.md %}

## Database normalization in relation to data cardinality

Database normalization has a set of **normal forms** which provide guidance on how data is represented.

The **first normal form** provides guidance on:
* arranging data into two dimensions
* the use of relation names, attributes and keys to reference rows

This set of rules means:
* High cardinality data requires no alteration (because there is no duplication and the relationships are one-to-one)
* Low cardinality data that has one-to-many or many-to-many relationships are:
  * inserted into separate two dimensional tables, and
  * relationships are maintained using keys

For example, the low cardinality table above can be normalized as follows:

| SubjectID | SubjectName |
|---|---|
| En | English |
| Fi | Finance |
| Fr | French |
| Ge | Geography |
| Hi | History |

The SubjectID can then be linked with a key to the `Students` table `StudentID` key.

<!--Need a schema diagram for this relationship for better clarity-->

## Benefits and costs of data normalization

Data normalization is not a perfect solution to data cardinality:

| Benefit | Cost |
|---|---|
| Data integrity is easier to maintain | Data in separate tables makes indexing less efficient |
| Less duplication of data means faster inserts, updates and a smaller footprint | `JOIN` clauses are required to query data which makes queries more complex and therefore slower to return results |

DBAs responsible for normalized systems use different methods to overcome the issues and should the benefits outweigh the costs, may denormalize data.

## How does FeatureBase handle data cardinality?

FeatureBase does not use Database normalization. Instead, the system inserts data into a two-dimensional bitmap index which is:
* designed to overcome issues with low cardinality data
* optimized to reduce storage overheads and query execution time

[Learn how data is encoded in bitmap indexes](/docs/concepts/concept-fb-bitmaps)

## How should I structure data to be imported to FeatureBase?

{% include /concepts/concept-data-modeling-summary.md %}

[Learn how to structure your data ready to import to FeatureBase](/docs/concepts/overview-data-modeling)

## Examples with data

* [Data import examples](/docs/concepts/concept-examples)

## Further information

* [Cardinality(data modeling) on Wikipedia](https://en.wikipedia.org/wiki/Cardinality_(data_modeling)){:target="_blank"}
* [Database Normalization on Wikipedia](https://en.wikipedia.org/wiki/Database_normalization){:target="_blank"}
* [Database denormalization on Wikipedia](https://en.wikipedia.org/wiki/Denormalization){:target="_blank"}
