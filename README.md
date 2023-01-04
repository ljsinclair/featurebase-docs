# SITE BUILD DISABLED as of 2022-12-06

This site is IN DEVELOPMENT and not ready for public consumption.

* Repo is set to **private** which prevents build occurring
* Build scripts are **disabled** to avoid being bombarded with build messages

Doc updates are publicly available in /molecula/documentation > outputs to > docs.featurebase.com

## Deployment setup

* Set repo to public: https://github.com/FeatureBaseDB/featurebase-docs/settings > scroll down and click **Change Visibility** > Public
* Restart scripts: https://github.com/FeatureBaseDB/featurebase-docs/actions/workflows/pages.yml
* Change CName records on featurebase.com to point to new site

## Site documentation

Rather than turn the readme into an endless scroll I've created separate README files for each area of interest:

| File | Description |
|---|---|---|
| [README-theme.md]() | Site setup and where to find files and dependencies |
| [README-local-build.md]() | How to setup a local build |
| [README-broken-link-check]() | Two methods to check for broken links before committing and creating a Pull Request |
|

## Callout text highlighting

Callout boxes are styled to FeatureBase standard colors.


### File naming

#### UI file naming

```
<product>-<feature>-<task>
```

| Item | Description |
|---|---|
| product | cloud or com (community) |
| feature | features include install, database, table, etc |
| task | a task to perform in the feature |

For example:
* cloud-database-create - creates a database in the cloud product
* com-install-linux - install FeatureBase community on Linux

NOTE: you may think this will mean more pages, and you'd be right. However, more pages with a single focus are easier to follow than endless scroll pages that have everything in the one place.

#### Reference file naming

NOTE: At time of writing (2022-12-08) this naming standard is NOT IMPLEMENTED. Changes will come in the very near future.

Reference files are named to this standard:

```
<language><feature><task>
```

| Item | Description |
|---|---|
| language | PQL or SQL (sql-preview) |
| feature | The same as above, where there's something you can CRUD |
| task | what you can do to the feature |

Examples:
* pql-all
* sql-table-create


### Hyperlinks

Hyperlink colours (including those in navigation bars) are governed by the `$link-color` setting in `featurebase.scss`.

WARNING: Use meaningful multi-word anchor text. Single word (e.g., "here") is now BANNED. **YOU HAVE BEEN WARNED!**

| Type of link | Structure | Example |
|---|---|---|
| Internal | `[meaningful anchor text](/docs/folder/filename)` | `[Learn how to create tables in FeatureBase cloud](/docs/cloud/cloud-tables/cloud-table-create)` |
| External | `[meaningful anchor text](https://url){:target="_blank"}` | [Visit the FeatureBase website](https://featurebase.com){:target="_blank"} |

### Common/reusable content

Common/reusable content is stored in the `/_includes` folder:
* /cloud - cloud specific content
* /community - community specific content
* /concepts - descriptions and definitions of conceptual information which can include stuff that's common to cloud and community (e.g., database descriptions)
* /sql-preview - shared content used in SQL preview pages (e.g., timeQuantum and ttl which are included in IDSET and STRINGSET )

Files are markdown unless absolutely necessary to use something like html.

Add an include file as follows:

```
{% include /folder/filename.md %}
```

NOTE: if there is a filename conflict with a content file, add the suffix `source` to the end of the filename. e.g., c`om-install-linux.md` is the content page, while `com-install-linux-source.md` is the include file.

WARNING: Missing include files **will** break the build.
