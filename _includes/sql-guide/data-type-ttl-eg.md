### TTL deletion examples

| TIMEQUANTUM | Timestamp | `TTL 30d` | Description |
|---|---|---|---|
| `TIMEQUANTUM 'Y'`| 2022 | 2023-01-30 | TTL assumes date is 2022-12-31 |
| `TIMEQUANTUM 'YM'`| 2022-09 | 2022-10-30 | TTL assumes date is 09-30 |
| `TIMEQUANTUM 'YMD' | 2022-09-02 | 2022-10-02 | Deletion after 30 days as intended |
