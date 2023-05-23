---
title: Star schema example
layout: default
parent: Concepts
---

# Concepts - importing data from a star schema

## What is a star schema?

The star schema is an approach used to build data warehouses and features tables designated as **Fact** or **Dimension**

* **Fact** tables reference **Dimension** tables and record metrics that represent specific events.
* **Dimension** tables contain specific attributes to describe **Fact** table data.

* [Learn more about star schemas, fact and dimension tables](https://en.wikipedia.org/wiki/Star_schema){:target="_blank"}

## Example problem

A sales database is setup with a star schema featuring:

* A central **Fact** table that records sales over the past 20 years
* Three **Dimension** tables that contain attributes related to those sales.

A query to determine sales of specific items take a long time to run because:
* the fact table has millions of rows
* multiple joins and conditions are required to draw data from the dimension tables.

Marginal improvements have been gained by creating views on specific tables.

The organization wants to avoid redesigning the database if possible and wants to test if FeatureBase will improve query responsiveness.

{% include /concepts/concept-data-modeling-process-table.md %}

## Analysis



### Fact_Sales

| Row | Data type | Additional information |
|---|---|---|
| `Date_Id` | Timestamp | FK to `Dim_Date.Id` |
| `Store_Id` | String | FK to `Dim_Store.Id` |
| `Product_Id` | String | FK to `Dim_Product.Id` |
| `Units_Sold` | Integer |  |

### Dim_Date

| Row | Data type | Additional information |
|---|---|---|
| `Id` | Integer | PK to `Fact_Sales.Date_Id` |


### Dim_Store

| Row | Data type | Additional information |
|---|---|---|
| `Id` | Integer | PK to `Fact_Sales.Store_Id` |

### Dim_Product

| Row | Data type | Additional information |
|---|---|---|
| `Id` | Integer | PK to `Fact_Sales.Product_Id` |

## Mapping

Based on the analysis, the table row data types map as follow:

| Source row | Source data type | Destination data type | Additional information |
|---|---|---|---|
|  |
|

##
