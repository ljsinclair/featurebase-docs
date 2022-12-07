# SITE BUILD DISABLED as of 2022-12-06

This site is IN DEVELOPMENT and not ready for public consumption.

* Repo is set to **private** which prevents build occurring
* Build scripts are **disabled** to avoid being bombarded with build messages

Doc updates are publicly available in /molecula/documentation > outputs to > docs.featurebase.com

## Deployment setup

* Set repo to public: https://github.com/FeatureBaseDB/featurebase-docs/settings > scroll down and click **Change Visibility** > Public
* Restart scripts: https://github.com/FeatureBaseDB/featurebase-docs/actions/workflows/pages.yml
* Change CName records on featurebase.com to point to new site



 this is a PRIVATE repository and the GitHub Pages build has been disabled because the site is under development.

# FeatureBase site README

Site uses a *gemfile* approach to the theme, which means:
* uses a gem-based approach, i.e. uses a `Gemfile` and loads the `just-the-docs` gem
* uses the [GitHub Pages / Actions workflow] to build and publish the site on GitHub Pages

This approach means:
* this repository contains **only** FeatureBase content and customizations
* it's simpler to determine what's ours and what's theme-based

## Theme help

[Just the docs theme help site](https://just-the-docs.github.io)

FeatureBase specific information is below.

## Local build

### Gemfile dependencies

Check `Gemfile` and `Gemfile.lock` for Ruby, Jekyll and Bundler dependencies.

### First time use

For first time use:
* Clone the repo then cd to the folder `featurebase-docs`
* Download theme dependencies:
```
bundle
```

## Serve site
```
bundle exec jekyll serve
```

## Broken link checker

* html-proofer added to `Gemfile`
* serve site with `bundle exec jekyll build`
* test broken links with `bundle exec htmlproofer ./_site`

You're looking for anything that expressly says "broken".
External links don't count at this point
You'll get a lot of `ref` errors which is about image files.

# Site settings in `/_config.yml`

| Settings | Found under... |
|---|---|
| site name | `title: FeatureBase help` |
| hyperlinks at top of page | `# top of page nav` |
| Featurebase logo | `logo: "/assets/images/FeatureBase-Logo-Gradient-Wide.png"` |
| Top of page navigation | `# Top of page nav` |
| Stylesheet design | `color_scheme: featurebase` |
| Search | `search_enabled: true` plus additional settings below |
| Callout text highlighting | # Text highlighting callouts |

NOTE: It's also possible to add Google analytics and other stuff to the site. [Learn about site settings](https://just-the-docs.github.io/just-the-docs/docs/configuration/) |

## FeatureBase logo

Logo is found at top left and based on the approved logo

Logo file found in: `/assets/images/FeatureBase-Logo-Gradient-Wide.png`

## Top of site nav

Current setup:
* 3x links that open in new window
* new window means users can retain their place in FeatureBase help and refer to other sites in new tabs

**To Do** Add a glossary link once that's been written

## Stylesheet design

| Implemented | Found under |
|---|---|
| FeatureBase colors, red, blue, purple | `/_sass/color_schemes/featurebase.scss` |
| Featurebase css styles | `/_sass/custom/custom.scss` |

Hyperlink color is site-wide and governed by setting in `featurebase.scss`:

```
$link-color: $purple-000;
```

## Search

* [Learn about just-the-docs search](https://just-the-docs.github.io/just-the-docs/docs/search/)

## Callout text highlighting

Callout boxes are styled to FeatureBase standard colors.

### Note

```
<p class="note">This is a note callout</p>

# Or use

{: .note }
This is a note callout

```

### Warning

```
<p class="warning">This is a warning callout</p>

# Or use

{: .warning }
This is a warning callout

```

### Success

```
<p class="success">Q'PLA! This is a success callout with a joke because it's that time of the day.</p>

Or use

{: .success }
Q'PLA! This is a success callout with a joke because it's that time of the day.

```

### Important

```
<p class="important">AWOOGAH! This is something important!</p>

# or use

{: .important}
AWOOGAH! This is something important!

```

# Body Footer

Footer is an include file found in `/_includes/footer_custom.html`

# Writing content and sidebar navigation

All page content is saved to the `/docs` folder.

### Colors

Navigation link colours are governed by the `$link-color` setting in `featurebase.scss`.

## Navigation

By default any page with a `title` will automatically appear in navigation regardless of subfolders.

Page order in the tree is governed by YAML at the top of each page.

Theme supports 3 levels:

```
                             # Required YAML for each page:
├── level 1                  # title: level 1
├── level 1 parent           # level 1 parent, has_children: true
│   ├── level 2 child        # parent: level 1 parent
│   ├── level 2 child        # parent: level 1 parent
│   ├── level 2 parent       # parent: level 1 parent, has_children: true
│   │   ├── level 3 child    # parent: level 2 parent, grandparent: level 1 parent
│   │   ├── level 3 child    # parent: level 2 parent, grandparent: level 1 parent
```

Pages with children are represented as an expandable/collapsible node in the tree.

### Level 1 page YAML (required on all pages)

```
title: Navbar title
layout: default
nav_order: 1
```

Where:
* title - page title that appears in the navigation
* layout - page design, default is the simplest so don't change
* nav_order - integer representing the position of the page in descending order 1...n

### Level 2 page YAML

```
# required YAML plus...
parent: parent title
has_children: [true|false]
```

Where:
* parent - title of the node above the page in the tree
* has_children - `true` means the nav appears as an expandable node

### Level 3 page YAML

```
# required YAML plus...
parent: parent_title
grandparent: grandparent_title
```

Where:
* parent -- title of node above the page in the tree
* grandparent -- title of first level node

## Standard content for pages

It's **really** important to include this information and shortcode on each page.

| Standard content | Description | Source/example |
|---|---|---|
| Page heading | Heading 1 as a question | `# How do I create cloud tables` |
| Exclude a heading from TOC | Add under the page heading to stop it appearing in the TOC | Add `{: .no_toc }` after the heading |
| page description | Give a basic description of the page. Ideally this isn't a retread of the heading, but it's ok if it is. | Learn what's involved with creating a table in FeatureBase cloud. |
| page table of contents | All pages save for troubleshooting issues need a page table of contents | Add shortcode **after** the description: `{% include /docs/page-toc.md %}` |
| Warnings | Any warnings relevant to the process or procedure | * Data cannot be recovered after deleting database tables |
| Before you begin | prerequisites and requirements required **before** reading or performing the content on the page | * [Create a cloud database](#) |
