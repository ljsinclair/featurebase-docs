# SITE BUILD DISABLED as of 2022-12-06

This site will replace current docs found in:

* Repo: /molecula/documentation
* URL: docs.featurebase.com

This site is IN DEVELOPMENT and not ready for public consumption.

* Repo is set to **private** which prevents build occurring
* Build scripts are **disabled** to avoid being bombarded with build messages

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
| [README-content-nav]() | Explains how page YAML governs the sidebar navigation |
| [README-content-callouts]() | Use callouts to highlight important text |
| [README-common-include]() | How to use common include files |
| [README-ui-unicode-buttons]() | Unicode for use in docs rather than taking screenshots of SVG buttons (THIS IS NOT IDEAL) |
