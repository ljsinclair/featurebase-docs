# FeatureBase Docs
This repository is hosted with GitHub pages with the live site found at: https://docs.featurebase.com.

## SITE BUILD

[![Deploy Jekyll site to Pages](https://github.com/FeatureBaseDB/featurebase-docs/actions/workflows/pages.yml/badge.svg)](https://github.com/FeatureBaseDB/featurebase-docs/actions/workflows/pages.yml)

### Site GitHub pages settings

This repository uses the [Just the Docs](https://just-the-docs.github.io/just-the-docs/) theme and builds using the `gh-pages` branch

* [Theme setup and GH pages build settings](https://github.com/just-the-docs/just-the-docs-template/blob/main/README.md#publishing-your-site-on-github-pages)

### Deploy using Github actions

featurebase-docs > Actions > Deploy Jekyll site to Pages > Re-run all jobs

Site build URL: https://featurebasedb.github.io/featurebase-docs/

### Change CNAME records

Point featurebase.com to new featurebase-docs GitHub pages site

* featurebase-docs > Settings > Pages > Custom Domain
* add `docs.featurebase.com`
* change CNAME file in repository to `docs.featurebase.com`

## Docs documentation

> I don't like how meta this is getting, Rick...

Documentation, help, and guides for using FeatureBase docs can be found under `/help-on-help` folder in the `/featurebase-docs` root. This includes:

* two ways to build the site locally
* two ways to check for broken links
* writing rules of engagement (TODO)
* writing guidance -- how to plan and design docs, write them clearly, etc
* writing using common include files rather than duplications
* Style guide for highlighted callout boxes, hyperlink anchor text, etc
* Guidance on use of material icons to represent GUI elements in FB Cloud
* File naming standards
* Setting up navigation order and structure
...and much more.

NOTE: The folder is explicitly excluded from the build in the `/_config.yml` file

* [Help-on-help](https://github.com/FeatureBaseDB/featurebase-docs/tree/main/help-on-help)
