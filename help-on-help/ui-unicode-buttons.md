# Unicode for buttons

This is a list of unicode characters and include files used in help to represent GUI buttons. These are **not** identical to GUI at present, but this method means:

* there's a consistent Unicode character available for all GUI buttons
* if the GUI button changes, we can make a single change to the include file and it will be pushed through the help.

## Usage example

User needs to click the 3-dot menu in Cloud > Databases to open the context menu and delete the database.

|---|---|
| Instruction | Click <3-dot-menu> for the database, then click **Delete**. |
| Construction | [include file] for the database, then click **Delete** |
| Include file content | `Click &#8942;` |
| Method to insert into text | `{% include /cloud-icons/icon-click-context-menu.md %} for the database, then click **Delete**.` |

## Cloud product

Cloud icon include files are found in `/_includes/cloud-icons`

| UI button | Unicode character | Include file |
|---|---|---|
| vertical 3-dot menu item | `&#8942;`` | icon-click-context-menu.md |
| search field delete | `&#2297;` | icon-click-clear-field.md |

## Community product

In progress as of 2023-01-05
