# File naming

Content files are added to `/docs` subfolders.



| Area of interest | Parent | Subfolders | Filenames | Example |
|---|---|---|---|
| High level overviews | `/docs/concepts` | none | `/concepts/overview-<concept>.md` | `/concepts/overview-data-modeling.md` |
| Cloud product | `/docs/cloud` | `/cloud-<feature>` | `cloud-<feature>-<task>.md` | `/cloud/cloud-database/cloud-database-manage.md` |
| Community product | `/docs/community/` | `/com-<feature>` | `com-<feature>-<task>.md` | `/community/com-tables/com-tables-create.md` |
| PQL | `/docs/pql/` | `pql-<statement>.md` |  |
| SQL-preview | `/docs/sql-preview` | `sql-preview-<statement>.md` |  |
| Data types & constraints | `/docs/data-types` | `data-type-<type>.md` |  |

## Include filenames

Include files contain common, reusable content and behave a little like `Github gist` files.

WARNING: Conflicts are likely if include filenames match those under `/docs`

Points to remember:
* Folders have parallel names (but NEVER identical) to the relevant content folder.
* Filenames are prefixed by the product
* The filename should be a general summary of the content
* Naming include files can be a bit convoluted, so do your best.

| Filename | Description | Example |
|---|---|---|
| `<product>-summary-<feature>.md` | Summary of functionality | cloud-summary-billing-contract.md |
| `<product>-<feature>-<description>.md` | describe whatever is in the file as best you can | `cloud-user-edit-steps.md` |
