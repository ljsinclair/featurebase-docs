# Include files are for common content

We use `include` files to avoid:
* typing the same thing over and over again in different ways, and
* creating a maintenance nightmare

Include files work a little like GitHub gist files in that they are inserted into the target file at build.

## Where are include files found?

`/_includes/<foldername>`

Folders are setup to keep the files in a logical order

## File naming

Points to remember:
* Folders have parallel names (but NEVER identical) to the relevant content folder.
* Filenames are prefixed by the product
* The filename should be a general summary of the content
* Naming include files can be a bit convoluted, so do your best.

| Filename | Description | Example |
|---|---|---|
| `<product>-summary-<feature>.md` | Summary of functionality | cloud-summary-billing-contract.md |
| `<product>-<feature>-<description>.md` | describe whatever is in the file as best you can | `cloud-user-edit-steps.md` |

## Inserting an include file

Add an include file as follows:

```
{% include /folder/filename.md %}
```

## Warnings

* Conflicts are likely if include filenames match those under `/docs`
* **NEVER* nest include files within each other because this makes editing and troubleshooting harder to resolve
* Missing include files **will* break the build
