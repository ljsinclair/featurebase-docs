# Theme configuration

The featurebase-docs repository is a Jekyll system and uses the *Just the Docs* gemfile theme. This means theme files are automatically kept up to date, but custom changes are possible.

I've made the following customizations.

## Content files

| Folder | Description | Further information |
|---|---|---|
| `/docs` | all content pages that render on build |  |
| `/includes` | Common content inserted into 1+ pages | common-include.md |
| `/includes/footer_custom.html` | FeatureBase footer links |

## Site configuration

* `/_config.yml`

This includes:
* Site title and description
* Header navigation
* Search
* Custom stylesheet
* Permalink settings

## Styleguide

Material icons stylesheet added via include file:

`/_includes/head_custom.html`

Theme customizations are found in the `/_sass` directory.

| File/Folder | Settings |
|---|---|
| `/_sass/color_schemes/featurebase.scss` | `/_config.yml` > `color_scheme: featurebase` |
| Custom CSS | `/_sass/custom/custom.css` | Automatically loaded |

* [Theme typography](https://just-the-docs.github.io/just-the-docs/docs/ui-components/typography/)
* [built-in colors](https://just-the-docs.github.io/just-the-docs/docs/utilities/color/)

## Featurebase image files

| File/Folder | Settings |
|---|---|
| `/favicon.ico` | automatically loaded with site |
| `/assets/images/FeatureBase-Logo-Gradient-Wide.png` | `/_config.yml` > `logo:` |

## Theme help

[Just the docs theme help site](https://just-the-docs.github.io)
