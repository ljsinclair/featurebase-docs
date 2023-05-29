



This example demonstrates how to:

* identify the unique identifier for each row
*

## Problem

The school needs to identify students and their campus

## Example source data

| Name | Surname | Age | UUID | CampusID | Grade | StudentID |
|---|---|---|---|---|---|---|---|
| Toby | Bandini | 14 | 63a8 | An | 9 | An0 |
| Kham | Thibault | 16 | 98e9 | An | 11 | An1 |
| Neta | Van Ogtrop | 16 | 9ccb | An | 11 | An2 |
| Refilwe | Ahlers | 15 | 7325 | An | 10 | An3 |
| Mitra | Bandini | 17 | 6ed3 | Bo | 12 | Bo1 |
| Hed | Pahlke | 16 | 62a5 | Bo | 11 | Bo2 |
| Rani | Knudsen | 15 | bd6c | Bo | 10 | Bo3 |
| Bahati | Cuesta | 16 | 5651 | Bo | 9 | Bo4 |

| CampusID | Campus | Address | Suburb |
|---|---|---|
| An | Anderson | 123 First street | Anytown |
| Bo | Bowie | 554 Transmission Way | Hobson |

| GradeID |
| 9 |
| 10 |
| 11 |

## Flat file

| Name | Surname | Campus |
|---|---|---|
| Toby | Bandini | Anderson |
| Kham | Thibault | Anderson |
| Neta | Van Ogtrop | Anderson |
| Refilwe | Ahlers | Anderson |
| Mitra | Bandini | Anderson |
| Hed | Pahlke | Anderson |
| Rani | Knudsen | Anderson |
| Bahati | Cuesta | Anderson |
