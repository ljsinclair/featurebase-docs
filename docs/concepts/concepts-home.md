---
title: Concepts
layout: default
has_children: true
nav_order: 2
has_toc: true
---
FIRST DRAFT

# FeatureBase concepts

{: .note}
While FeatureBase is a Bitmap index, we refer to Tables and columns rather than indexes for ease of understanding.

In traditional databases, data is saved to different tables to:
* avoid duplication which would slow queries down
* reduce the storage footprint

RAID https://en.wikipedia.org/wiki/Cardinality_(data_modeling)

However, indexes and JOINS become unwieldly and queries slow down once the [DATA DENSITY? Need official term] reaches a certain point.

DBAs engage in database tuning to overcome this problem and may in certain cases need to redesign some or all the database.

FeatureBase overcomes this problem in 2 ways.

| Solution | Description | Benefit | Cost |
|---|---|---|
| Encoding and conversion | Ingestion converts source data in batches to base-2, range-encodes and bit slices before saving to FeatureBase | Data footprint can be reduced by up to 10% |
| Flat files | All ingested data is saved to a single flat file which is structured based on:<br/>* how the data is keyed<br/>* the queries you want to run | Simpler queries with no joins | Higher data footprint |

## How does FeatureBase overcome the duplication problem?

FeatureBase supplies a number of data types which help avoid the very duplication that multiple RDBMS tables overcome.

### An array of values in a single row

The `SET` data type allows you to create an array of values in a table cell [OFFICIAL TERM LATER].

For example:

| sepal_len_cm | sepal_wid_cm | petal_len_cm | petal_wid_cm | class |
| 4.8 | 3.0 | 1.4 | 0.3 | Iris-setosa |
| 5.1 | 3.8 | 1.6 | 0.2 | Iris-setosa |
| 4.6 | 3.2 | 1.4 | 0.2 | Iris-setosa |
| 5.3 | 3.7 | 1.5 | 0.2 | Iris-setosa |
| 5.0 | 3.3 | 1.4 | 0.2 | Iris-setosa |
| 7.0 | 3.2 | 4.7 | 1.4 | Iris-versicolor |
| 6.4 | 3.2 | 4.5 | 1.5 | Iris-versicolor |
| 6.9 | 3.1 | 4.9 | 1.5 | Iris-versicolor |
| 5.5 | 2.3 | 4.0 | 1.3 | Iris-versicolor |
| 6.5 | 2.8 | 4.6 | 1.5 | Iris-versicolor |
| 6.3 | 3.3 | 6.0 | 2.5 | Iris-virginica |
| 5.8 | 2.7 | 5.1 | 1.9 | Iris-virginica |
| 7.1 | 3.0 | 5.9 | 2.1 | Iris-virginica |
| 6.3 | 2.9 | 5.6 | 1.8 | Iris-virginica |
| 6.5 | 3.0 | 5.8 | 2.2 | Iris-virginica |

For a FeatureBase table:
* The class becomes the unique key
* the other columns are [turned into?] `SET` fields

The result:
<table>
  <tr>
    <th>sepal_len_cm</th>
    <th>sepal_wid_cm</th>
    <th>petal_len_cm</th>
    <th>petal_wid_cm</th>
    <th>Class</th>
  </tr>
  <tr>
    <td>4.8</td>
    <td>3.0</td>
    <td>1.4</td>
    <td>0.3</td>
    <td rowspan="5">Iris-setosa</td>
  </tr>
  <tr>
    <td>5.1</td>
    <td>3.8</td>
    <td>1.6</td>
    <td>0.2</td>
  </tr>
  <tr>
    <td>4.6</td>
    <td>3.2</td>
    <td>1.4</td>
    <td>0.2</td>
  </tr>
  <tr>
    <td>5.5</td>
    <td>3.7</td>
    <td>1.5</td>
    <td>0.2</td>
  </tr>
  <tr>
    <td>5.0</td>
    <td>3.3</td>
    <td>1.4</td>
    <td>0.2</td>
  </tr>
</table>
