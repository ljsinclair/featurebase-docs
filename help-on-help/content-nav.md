# Sidebar navigation

Sidebar navigation is governed by YAML at the top of the markdown files found in `/docs`

IMPORTANT: the folder structure is ignored

The theme supports 3 level of pages

| Level | Description | Optional |
|---|---|---|
| Home | HTML homepage | One or more L1 pages |
| L1 | Appears at navigation root. | One or more L2 pages |
| L2 | Appears beneath L1 page | One or more L3 pages |
| L3 | Appears beneath L2 page |  |

Nesting requires the following keys to be defined:

| Key | L1 | L2 | L3 |
|---|---|---|
| title | yes | yes | yes |
| has_children | For 1+ L2 pages | For 1+ L3 pages | n/a |
| parent | n/a | L1 title | L2 title |
| grandparent | n/a | n/a | L1 title |

## Example YAML

### Homepage `/index.html`

This is a special page with a different layout and can only contain HTML.

```yaml
title: FeatureBase help
layout: home          # remote theme specific layout
has_children: false   # no L1 pages beneath
nav_order: 1          # first item in navigation
has_toc: false        # no auto-generated TOC of L1 pages beneath
```

### Level 1 with no L2 pages

```yaml
title: page title        # page title appears in navigation
layout: default          # default layout in remote theme
has_children: false      # page has no L2 pages
nav_order: 1             # page order in navigation
has_toc: false           # auto-generated list of L2 pages
```

## Level 1 with L2 subpages

```yaml
title: L1 page title    # Page title that appears in nav
layout: default
has_children: true      # L2 pages appear beneath page in nav
nav_order: 3            # position in nav
has_toc: false          # no auto-generated list of L2 pages
```

## Level 2 with no L3 pages

```yaml
title: L2 page title     # page title for nav
layout: default
parent: L1 page title    # L1 page title (requires has_children: true in L1 page)
has_children: false      # no children for this page
nav_order: 3
has_toc: false           # no auto generated list of L3 pages
```

## Level 2 with L3 pages

```yaml
title: L2 page title    # page title for nav
layout: default
parent: L1 page title   # L1 page title (requires has_children: true in L1 page)
has_children: true      # Indicates has level 3 pages beneath
nav_order: 3
has_toc: false          # No auto-generate TOC of child pages
```

## Level 3 page

```yaml
title: L3 page title          # page title for nav
layout: default
parent: L2 page title         # L2 page title (requires has_children: true in L2 page)
grand_parent: L1 page title   # L1 page title (requires has_children: true in L1 page)
nav_order: 3
```
