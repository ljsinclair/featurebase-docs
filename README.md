# FeatureBase Docs

[![Deploy Jekyll site to Pages](https://github.com/FeatureBaseDB/featurebase-docs/actions/workflows/pages.yml/badge.svg)](https://github.com/FeatureBaseDB/featurebase-docs/actions/workflows/pages.yml)

## Help on Help

Full documentation on writing, building and testing help, the style guide and standards is found in the Help-on-help directory:

* [Help on Help](/help-on-help/README.md)

## Introduction

FeatureBase-docs is a Jekyll site deployed to GitHub Pages.

The site uses the *Just the Docs* gemfile theme which was set up based on the following instructions:

* [Just the docs gemfile theme](https://github.com/just-the-docs/just-the-docs-template/blob/main/README.md)

A gemfile theme:
* Automatically pulls the latest version of the theme when the site is built locally, deployed to staging or production
* Can be modified with local files (e.g., stylesheets, etc)

## Important site folders and files

An overview of folder structure and files

### Important folders

| Folder | Description | Status |
|---|---|---|
| `/assets/images` | Site image files found in logically named subfolders | As of 2023-02-21 contains images from /molecula/documentation which will be removed in future PRs |
| `/docs` | All content pages found in this folder. |  |
| `/docs/cloud` | All FeatureBase Cloud help pages | `old` prefix folders and files are originals to be rewritten |
| `/docs/cloud/cloud-faq` | High level conceptual information regarding FeatureBase applications | Updates in progress |
| `/docs/pql-guide` | All FeatureBase PQL-Guide help pages | Files largely unchanged from `/molecula/documentation` |
| `/docs/sql-guide` | All FeatureBase SQL-Guide help pages | Was `/sql-preview` |
| `/help-on-help` | Internal only help on FeatureBase Docs | Folder excluded from production build in `/_config.yml` |
| `/_includes` | Repository of reusable content saved in logically named subfolders |
| `/_sass` | Styleguides | Modifications made to align site with FeatureBase style guide |

### Important files

**IMPORTANT** Create a [Git Issue](https://github.com/FeatureBaseDB/featurebase-docs/issues) if you need to make any changes to the following settings.

| Filename | Purpose |
|---|---|
| `/_config.yml` | Site configuration, permalinks, search, callout highlighting, etc |
| `CNAME` | Used for domain `docs.featurebase.com` |
| `docker-compose.yml` | 1 of 2 files to build site locally using docker |
| `Dockerfile` | 2 of 2 files to build site locally using docker |
| `Gemfile` and `Gemfile.lock` | Gemfile dependencies for site build locally or in production |
| `index.html` | Site homepage |
| `sitemap.xml` | Sitemap helps search engines index the site |
| `/_includes/contact-support.md` | Standard text for contacting support that can be inserted into any page. Ideally this will point to Jira support |
| `/_includes/head_custom.html` | Load Google material icons stylesheet |
| `/_includes/footer_custom.html` | FeatureBase links for support |
| `/_includes/nav_footer_custom.html` | Blank page used to remove theme advertising link |
| `/_includes/page-toc` | Insertable shortcode to build a table of contents on a content page |
| `search_placeholder_custom.html` | Standard text for the search field |
| `/_sass/color_schemes/featurebase.scss` | Custom stylesheet to add FeatureBase specific colors |
| `/_sass/custom/custom.scss` | Custom stylesheet to add FeatureBase specific fonts and other stylesheet modifications |

## Further information

* [Just-The-Docs Theme help](https://just-the-docs.github.io/just-the-docs/){:target="_blank"}
