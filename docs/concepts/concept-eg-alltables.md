---
title: RDBMS example
layout: default
parent: Concepts
nav_order: 11
---

# Concepts -- import all RDBMS tables

The conversion to FeatureBase Bitmap indexes can reduce data and storage overheads by 10%

## Problem description

Weather data is saved every thirty minutes to a database designed to collect 12 months data from four weather stations in the system.

The project was extended for an additional five years and there is funding to redesign the database to make queries more efficient.

{% include /concepts/concept-data-modeling-process-table.md %}

## Analysis

Station data is stored in a Dimension table:

| Column | Data type | Additional information |
|---|---|---|
| Station.id | Integer |
| Station.name | String |
| Station.lat | Decimal |
| Station.lon | Decimal |
| Station.heightm | Decimal |

Station readings are stored as follows:

| Column | Data type | Additional information |
|---|---|---|
| Reading.station | Integer | FK to station ID |
| Reading.time | string |
| Reading.tempc | Decimal |
| Station.humidityrel | Decimal |
| Station.windkmh | Decimal |
| Station.winddir | String |

### Station example data

| station | lat | lon | heightm |
|---|---|---|---|
| Ring | -37.83 | 144.98 | 7.53 |
| Ceres | -37.67 | 144.83 | 113.4 |
| Pallas | -38.03 | 144.48 | 10.6 |
| Eros | -38.36 | 145.18 | 12.69 |

### Ring station example data

| id | station | time | tempc | humidityrel | winddir | windkmh |
|---|---|---|---|---|---|---|---|---|
| 1 | Ring | 24/03:30pm | 15.1 | 58 | N | 20 |
| 2 | Ceres | 24/03:30pm | 15.3 | 57 | N | 19 |
| 3 | Pallas | 24/03:30pm | 16.0 | 56 | NNW | 22 |
| 4 | Eros |  | 14.9 | 58 | N | 19 |

## Mapping

While most values will map directly to their equivalent data type, additional work can be done to further reduce the data footprint, including:

* converting `Reading.time` from `string` to `timestamp` which will make queries more efficient
* using `setq` data types to store data and the corresponding timestamp as an array of values in a single row.

For example



The data footprint of the above tables can be reduced by:

* converting existing time stamps to unix epoch which can be stored as timestamp

There are several things that can be done to reduce the data footprint of the above


Data types will map one-to-one in FeatureBase, but further improvements can be made using `SET` data types which are used to pair a logical id with two or more unique traits.

For example:

| station_name | readings |
|---|---|
| ring | time<br/>tempc<br/>humidityrel<br/>winddir<br/>windkmh |

In a FeatureBase table the traits become an array in a single column:






`SET` and `SETQ` data types are used to represent data where multiple traits are logically independent.

For example, the timestamps are independent traits for temp, humidity, UV and wind readings.





timestamp for each of humidity, uv, wind, temp = stringsetq + timequantum

## Destination



## Method




## Testing




## Production
