---
title: FeatureBase SQL CLI
layout: default
parent: Community configuration
grand_parent: Community
---

# FeatureBase SQL Command Line Interface (CLI)

The SQL endpoint allows you to execute SQL statements:
* on the command-line
* over an HTTP endpoint

## Before you begin

* [Start the FeatureBase Community server](/docs/community/com-startup-connect) with the `--sql.endpoint-enabled` flag
* CD to the `/featurebase/opt` directory

## Start the FeatureBase SQL CLI

{: .note}
The `--help` flag gives a full list of flags

```
./featurebase cli [--help]
```

## FeatureBase SQL CLI flags

These flags can be used within the CLI.

| Flag | Description |
|---|---|
| `\?` | Get help |
| `\q` | Quit the CLI and return to the terminal |

## Further information

* [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home)
* [Run SQL over an HTTP endpoint](/docs/community/com-api/old-sql-endpoint)
