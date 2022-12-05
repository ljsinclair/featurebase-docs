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
