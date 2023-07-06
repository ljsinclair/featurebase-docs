---
title: Part 3 - Roaring Bitmap Format
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 3
---
# FeatureBase bitmaps part 3 - Roaring Bitmap Format

<!-- From https://www.featurebase.com/blog/featurebase-technical-white-paper

-->

Data encoded to standard and bit-sliced bitmaps are compressed using Roaring Bitmap Format, a b-tree database structure based on Roaring Bitmaps.

## Before you begin

* [Learn about Roaring Bitmaps]()
* [Learn about FeatureBase bitmaps](/docs/concepts/concept-bitmaps)
* [Part 1 - standard bitmaps and equality encoding data](/docs/concepts/concept-bitmaps-standard)
* [Part 2 - FeatureBase bit-sliced bitmaps](/docs/concepts/concept-bitmaps-bit-slice)

## What is RBF?

Roaring Bitmap Format (RBF) is a b-tree database with full ACID (Atomicity, Consistency, Isolation, Durability) transaction support which allows incremental updates.

Roaring performs the following operations on bitmaps:
* splits each bitmap into containers of 2^16-1 (65,535) bits wide
* chooses an encoding type that will give the best compression

## RBF containers

There are three types of encoding types for containers:

| Container encoding type | Description |
|---|---|
| Array | Used for sparse containers with few bits set. An array of 16-bit integers is kept to tell which of the 65,535 bits are set. |
| Bitmap | Uncompressed and always take up 8KB (65,536 bits) |
| Run (length) | Run containers can efficiently represent containers where most or all bits are set |

## Bitwise operations

Bitwise operations (AND, OR, XOR, DIFFERENCE, NOT, etc.) are defined on each possible pair of encodings which means:
* decode-operate-encode processes are not required
* all operations take place on the data in the format it's already in
* compression benefits double as performance benefits
* it takes fewer processor instructions to skip over sections of containers where no bits or all bits are set

## The RBF database file

The database file for each bitmap contains a sequential collection of 8kb page files which are:
* numbered from zero
* contain pages of the following types:

<!-- update this from https://molecula.atlassian.net/wiki/spaces/EN/pages/684556291/On+Disk+Structure+RBF -->

| Page type | Description |
|---|---|
| Root record | Stores a list of bitmap index, field, view and shard number that point to a root page for that b-tree |
| Leaf | Stores raw container data of three types:<br/>* array containers<br/>* Run Link Encoding containers<br/>*  bitmap containers |
| Branch | Stores pointers to child leaf or branch nodes which help when expanding the size of the database |
| Bitmap | Stores a full bitmap container which helps avoid fragmentation |

## Transactions, updates and containers

To maintain a consistent snapshot of transactions, changes are batched into containers of:
* 2^16 integers, or
* 65536 bits

These changes are then recorded sequentially in the Write Ahead Log (WAL).

When transactions finish, a checkpointing process:
* updates each database page with changes from the WAL file
* truncates the WAL file when updates are complete

## Further information

* [Learn about Roaring Bitmaps](https://roaringbitmap.org/about/)
* [Roaring specification](https://github.com/RoaringBitmap/RoaringFormatSpec){:target="_blank"}
* [ACID transactions](https://www.databricks.com/glossary/acid-transactions){:target="_blank"}
