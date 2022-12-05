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

## Build site
```
bundle exec jekyll serve
```

## Design

| Implemented | Found under |
|---|---|
| FeatureBase colors, red, blue, purple | `/_sass/color_schemes/featurebase.scss` |
| Featurebase css styles | `/_sass/custom/custom.scss` |

Hyperlink color is site-wide and governed by setting in `featurebase.scss`:

```
$link-color: $purple-000;
```

## Navigation

Navigation link colours are governed by the `$link-color` setting in `featurebase.scss`.

### Top of site nav

* Includes 3x external links that open in new window.
* This is to allow users to keep their current context, and then [alt|cmd]+tab for additional information
* Will also include a Glossary link for FeatureBase help which will explain terminology and provide additional information

### LH sidebar nav structure

Navigation structure in LH sidebar is **not** tied to the folder structure.

Instead it uses page YAML to determine what's going on.

[Navbar YAML syntax explained in theme help](https://just-the-docs.github.io/just-the-docs/docs/navigation-structure/#pages-with-children)

## Footer

Footer is an include file found in `/_includes/footer_custom.html`


## Callout boxes (AKA highlight boxes)

### Note

```
<p class="note">This is a note callout</p>

# Or use

{: .note }
This is a note callout

```

{: .note }
This is a note callout

### Warning

{: .warning }
This is a warning callout

### Success

```
<p class="success">Q'PLA! This is a success callout with a joke because it's that time of the day.</p>

Or use

{: .success }
Q'PLA! This is a success callout with a joke because it's that time of the day.

```

{: .success }
Q'PLA! This is a success callout with a joke because it's that time of the day.

### Important

```
<p class="important">AWOOGAH! This is something important!</p>

# or use

{: .important}
AWOOGAH! This is something important!

```

{: .important}
AWOOGAH! This is something important!

## Writing and editing content

See the [Documentation style guide in Confluence](https://molecula.atlassian.net/wiki/spaces/DOCS/pages/1010860035/Style+Guide)

## Page order in left hand navigation

Page order in the tree is governed by YAML at the top of each page.

Theme supports 3 levels of content which can be conceptualised as three generations of a family:

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

### Additional standard content for pages

| standard content | Description | Source/example |
|---|---|---|
| page heading | Heading 1 as a question | `# How do I create cloud tables` |
| disable auto TOC for child pages | All pages auto-generate a list of child pages if they are available. This isn't useful on all pages | Add `{: .no_toc }` after the heading |
| page description | Give a basic description of the page. Ideally this isn't a retread of the heading, but it's ok if it is. | Learn what's involved with creating a table in FeatureBase cloud. |
| page table of contents | All pages save for troubleshooting issues need a page table of contents | Add shortcode **after** the description: `{% include /docs/page-toc.md %}` |
| Warnings | Any warnings relevant to the process or procedure | * Data cannot be recovered after deleting database tables |
| Before you begin | prerequisites and requirements required **before** reading or performing the content on the page | * [Create a cloud database](#) |




The theme allows you to create what I'll call a "stub page" which is a page with little to no content that can stand-in as a parent node for child pages. A page like this auto-inserts a list of child pages after your content. This isn't useful for pages with detailed content, so you needand auto-inserts a TOC of child pages. This isn't useful on pages with detailed content
