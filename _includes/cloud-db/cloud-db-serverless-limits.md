### SQL limitations

| Limitation | Supported? | Additional information |
|---|---|---|
| [SELECT...GROUP BY clause](/docs/sql-guide/statements/statement-select/#group-by-clause) | Not supported for IDSET or STRINGSET data types | * [IDSET() data type](/docs/sql-guide/data-types/data-type-idset)<br/>* [STRINGSET() data type](/docs/sql-guide/data-types/data-type-stringset) |
| [SELECT...HAVING clause](/docs/sql-guide/statements/statement-select/#having-clause) | Not supported |  |
| [SELECT...TOP clause](/docs/sql-guide/statements/statement-select/#top-clause) | Not supported |  |
| [SELECT...LIMIT clause]() | Not supported | LIMIT can be used with `FROM` and `GROUP BY` clauses |
| [IDSETQ() data type](/docs/sql-guide/data-types/data-type-idsetq) | Not supported |
| [STRINGSETQ() data type](/docs/sql-guide/data-types/data-type-stringsetq) | Not supported |

### PQL limitations

| Limitation | Supported? |
|---|---|
| [PQL Percentile](/docs/pql-guide/pql-read-percentile) | Not supported |

### Database backup and recovery limitations

Serverless databases do not support:
* Database snapshotting
* Database restore from backup
