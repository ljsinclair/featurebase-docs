---
title: Duplication solution
layout: default
parent: Concepts
nav_order: 4
---

# How does FeatureBase overcome the duplication problem?

In a traditional database, a one-to-many cardinality between data is resolved by normalizing the data and creating multiple tables.

As FeatureBase ingests data in a flat, denormalized structure, there is a resulting duplication of data.

This duplication can be resolved using `SET` data types which remove duplication by creating an array of values in a single row.

For example:

| sepal_len_cm | sepal_wid_cm | petal_len_cm | petal_wid_cm | class |
|---|---|---|---|---|
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

Using the `SET` data type, the table above is reduced to three rows:

<table>
  <tr>
    <th>_id</th
    <th>sepal_len_cm</th>
    <th>sepal_wid_cm</th>
    <th>petal_len_cm</th>
    <th>petal_wid_cm</th>
    <th>Class</th>
  </tr>
  <tr>
    <td rowspan="5">1</td>
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
  <tr>
    <td rowspan="5">2</td>
    <td>7.0</td>
    <td>3.2</td>
    <td>4.7</td>
    <td>3.1</td>
    <td rowspan="5">Iris-versicolor</td>
  </tr>
  <tr>
    <td>6.4</td>
    <td>3.2</td>
    <td>4.5</td>
    <td>1.5</td>
  </tr>
  <tr>
    <td>6.9</td>
    <td>3.1</td>
    <td>4.9</td>
    <td>1.5</td>
  </tr>
  <tr>
    <td>5.5</td>
    <td>2.3</td>
    <td>4.0</td>
    <td>1.3</td>
  </tr>
  <tr>
    <td>6.5</td>
    <td>2.8</td>
    <td>4.6</td>
    <td>1.5</td>
  </tr>
  <tr>
    <td rowspan="5">1</td>
    <td>6.3</td>
    <td>3.3</td>
    <td>6.0</td>
    <td>2.5</td>
    <td rowspan="5">Iris-virginica</td>
  </tr>
  <tr>
    <td>5.8</td>
    <td>2.7</td>
    <td>5.1</td>
    <td>1.9</td>
  </tr>
  <tr>
    <td>7.1</td>
    <td>3.0</td>
    <td>5.9</td>
    <td>2.1</td>
  </tr>
  <tr>
    <td>6.3</td>
    <td>2.9</td>
    <td>5.6</td>
    <td>1.8</td>
  </tr>
  <tr>
    <td>6.5</td>
    <td>3.0</td>
    <td>5.8</td>
    <td>2.2</td>
  </tr>
</table>

## IDSET data type


## STRINGSET data type




## Further information

* [IDSET data type](/docs/sql-guide/data-types/data-type-idset)
* [STRINGSET data type](/docs/sql-guide/data-types/data-type-stringset)
