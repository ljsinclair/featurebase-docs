---
title: Material Icons
---

The Cloud product uses Material Icons. Find the code here:

## Icons

https://mui.com/material-ui/material-icons/

## Theme modifications

| File | Modification |
|---|---|
| `/_includes/head_custom.html` | `<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet">` |
| `/_sass/custom/custom.html` | `.material-icons.md-18 { font-size: 18px; }`

* added material icons stylesheet ref to `/_includes/head_custom.html`
* added material icons stylesheet style to

## Usage

```
<span class="material-icons md-18">icon_name</span>
```

## Icons in use

Icon source = [Material icons filled](https://fonts.google.com/icons?icon.style=Filled&icon.set=Material+Icons)

| Menu item/page | icon | Renders as |
|---|---|---|
| Announcement (top right) | `<span class="material-icons md-18">sms_failed</span>` | <span class="material-icons md-18">sms_failed</span> |
| Home | `<span class="material-icons md-18">home</span>` | <span class="material-icons md-18">Home</span> |
| Databases | `<span class="material-icons md-18">dynamic_feed</span>` | <span class="material-icons md-18">DynamicFeed</span> |
| Tables | `<span class="material-icons md-18">table_view</span>` | <span class="material-icons md-18">table_view</span> |
| Data sources | `<span class="material-icons md-18">cloud_upload</span>`| <span class="material-icons md-18">cloud_upload</span> |
| Query | `<span class="material-icons md-18">manage_search</span>` | <span class="material-icons md-18">manage_search</span> |
| Configuration | `<span class="material-icons md-18">settings</span>` | <span class="material-icons md-18">settings</span> |
| Get Help | `<span class="material-icons md-18">help_outline</span>` | <span class="material-icons md-18">help_outline</span> |
| Search field cancel | `<span class="material-icons md-18">cancel</span>` | <span class="material-icons md-18">cancel</span> |
| Grid 3 vertical dot submenu | `<span class="material-icons md-18">more_vert</span>` | <span class="material-icons md-18">more_vert</span> |
| Query > Run query | `<span class="material-icons md-18">play_circle_filled</span>` | <span class="material-icons md-18">play_circle_filled</span> |
| Query > History > Folder icon | `<span class="material-icons md-18">folder_open</span>` | <span class="material-icons md-18">folder_open</span> |
