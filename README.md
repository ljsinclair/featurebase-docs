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

Rather than turn the readme into an endless scroll I've created separate help-on-help files.

These are found in the `/help-on-help` folder which is **excluded** from the build in the `/_config.yml` file

Help on help content covers the following subjects:

* Theme setup
* Where to find files
* Building the system locally
* File naming standards
* How the sidebar navigation works
* How common content `include` files work
* Writing guidance
* How to add hyperlinks (hint: one-word anchor text is BAD.)
* How to highlight important information with colored callout boxes
* How to check for broken links
