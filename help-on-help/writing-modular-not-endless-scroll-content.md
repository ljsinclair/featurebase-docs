# Write content in small chunks NOT endless scroll

Endless scroll articles seem a good way to present information to users but **only** from the point of view of someone who **already knows how to use the system**.

For everyone else, they're a nightmare.

## Issue: A user may not complete a process in one go

It is impossible to guarantee a user will have time to complete a long process in one go.

What’s more likely is they’ll stop and start for:
* lunch, conversations, meetings
* go home & come back
* turn computer off and on at beginning/end of day (or the computer crashes and restarts)

If this happens, they need to:
* search a long page for where they were up to
* hope they're right about where they left off, OR
* start the whole thing again in the hope the system will forgive them for repeating steps.

## Issue: A user may be searching for specific information

On the whole, website search indexes everything in a site, so when the user enters a keyword, it'll be displayed.

But what's **not** guaranteed is that search will take the user **straight** to the search keyword.

More likely, the user will be dumped at the top of a given page that **features** the search term, then have to search **again** to find the term.

## Issue: Search takes the user to the correct content in a longer page

If search **does** take the user to a specific instance of a keyword in a long page of content, they have an additional problem:

> Is the preceding content a requirement to understand or perform what I've searched for?

## Solution: How we avoid these problems

Very simply, we don't write endless scroll content.

Or put another way:

> If you wouldn't write all your code in one huge file, don't write content as endless scroll

For example:

| Writing Code | Writing Docs |
|---|---|
| Reuse common functions/code/components | Don’t code the same thing in multiple places |
| If you’ve already explained something, reuse it by creating:<br/>* a workflow of individual pages which can be used for different use cases<br/>* Jekyll include files (reusable files) which can be inserted into other pages
| Use third-party components rather than writing your own | Don’t reinvent the wheel.<br/>* If someone else has already documented something, just hyperlink to it (e.g., SQL guide)<br/>* If you’ve already explained a concept or a procedure, create an `/_include` file so it can be reused |
| Code reference systems to refer to when writing code | Code reference files to help end users understand syntax, arguments and usage of API and other systems. These are then be hyperlinked from procedural help rather than duplicating the content. |
| Spaghetti code is difficult to debug and regression test. | Rambling content that jumps from one idea to the next in no logical order is difficult to follow for the user, and makes it easier to make mistakes |
| Raise a Pull Request so code changes can be reviewed and tested before being merged and deployed. | Raise a Pull Request so help content changes can be reviewed and tested before being merged and deployed. |

### Plan your content

* [Learn about planning content](/help-on-help/planning content.md)

Don't just dive in and start writing then create a PR and think "job done".

* Determine the information the user needs to know by reviewing what's already in help
* Look at the structure of the system being documented and see if there are changes of context (e.g., Adding a column can only be done once you've created a table)

### If there's a change of context or a new task, give it a new page

In the original help, creating a table was one long page that included:

* Creating a table with the UI
* Creating a table using the API
* Adding a column with the UI
* Adding a column with the API
* Data types for the columns
* Constraints for the columns
* Deleting a column with the UI
* Deleting a column with the API
* Dropping a table with the UI
* Dropping a table with the API

Result: a confusing to read, endless scroll page that included:
* 8 different tasks (the list above)
* 2 changes of context in the UI (create/drop table and add/delete column)
* 4 API discussions plus examples
* Duplicated data type and constraint content found in a standalone page

If the user searched for **any** content that happened to be on that page, the search system dropped them at the top of the page rather than what they were looking for.

#### Solving this problem

Here's how this problem was solved:
* UI content split into individual task pages under `/docs/cloud/cloud-tables`
* Before you begin header to direct user to any requirements (e.g., you can't add columns unless you've created a table)
* API content now found exclusively in the Redoc.ly site
* Data types and constraints now documented in full under `/SQL-guide/data-types`

Where additional information is necessary to give the user context, it's hyperlinked using **meaningful** anchor text
