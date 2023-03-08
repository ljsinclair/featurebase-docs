# Writing rules

This is not an exhaustive list and doesn't go into grammar rules.

It is a set of guidelines you should double-check before you raise a PR.

## Rule 1 - write in plain English

Plain English makes the content easier to understand and follow for native speakers and users with English as an additional language.

For example:

| Rule | Informal English | Problem | Plain English |
|---|---|---|---|
| If it's important enough to write, it's important enough to make it clear. | "...If you are the inquisitive type, you may be interested in the [architectural overview]()..." | It’s not possible to tell if this is required information or something that’s only important to specific people. | System Administrators can find further information in the [architectural overview](URL) |
| Write clear, unambiguous instructions | "...but if you’d rather look at the finished tutorial, please see the [full source code]().." | Unclear, long-winded instruction. | [Learn more about <task/tutorial>](URL) |
| Get to the point; Help is not a conversation | "...As you work through the guide, please note any questions or feedback that you may have for the FeatureBase team. We’re always looking for ways to improve the experience!..." | Documentation is different to a verbal tutorial. It’s direct, factual and accurate because it’s going to be used by a user to complete specific tasks.<br/>You can be chatty and informal in Slack conversations or face-to-face but not in documentation. | **Further support**<br/> [Contact FeatureBase support with questions or issues](#) |
| Tell users what to expect BEFORE providing examples | [EXAMPLE CODE BLOCK]<br/>Above, bind tells FeatureBase to listen for HTTP request on all IPv4 addresses on the local machine at port 10101. | Telling a user what to expect after they’ve done it is like signing a contract without reading it. | Break this down into syntax, then explain arguments, then provide an example |

## Rule 2 - Context is king

Every single page should be written from a **SINGLE** context. This means each page has a **single purpose** that:

* is easier to follow
* is easier to find in search
* can be used in different contexts

Refer to [Page purpose and layout](/help-on-help/style-guide/page-purpose-layout) for further information.

### Example of mixed context

Quick start guides are a good example of mixing context because they include:

* Context 1 - install FeatureBase on Linux
* Context 2 - install FeatureBase on Mac
* Context 3 - login
* Context 4 - add sample data via command line
* Context 5 - query sample data
* ...etc

From a user point of view, this leads to two outcomes:

1. Endless scroll confusion where they can't find where they are
2. Having to skip content because it's not relevant to them (and invariably getting lost)

### Example of splitting context to make it easier for users

The new Community installation guides are an example of how to handle this situation more elegantly.

* Starting with an installation homepage that explains the options
* A standalone Linux install page (which can be reused for Windows)
* A standalone Mac install page (which includes links to mac-specific issues)
* A standalone Windows install page (which helps the user install Windows Subsystem for Linux, THEN links to the Linux install page)

These will be followed by new pages to:

* Guide the user through creating demo data
* Explain how the user can query the demo data

## Rule 3 - Don’t document what’s obvious in the UI

You don’t need to document what’s in the UI unless it’s **NOT** immediately obvious to the user.

| Don't say this | Do say this |
|---|---|
| Fill in your name, surname, date of birth, mother’s maiden name, your Social Security number or equvialent then  tick the Terms of service on the sign-up page. | Complete the fields on the sign-up page. |

## Rule 4 - If everything is important, nothing is

Excessive use of character and paragraph styles makes finding important information next to impossible.

We allow five ways to provide a way to make information stand out:

| Text style | Used for | Example |
|---|---|---|
| Headings | Page title is heading 1, Then headings go from Heading 2-4 | [Standard headings](/help-on-help/style-guide/standard-headings)<br/>[Custom headings](/help-on-help/style-guide/custom-heading-page-title) |
| **bold** | UI menu items or buttons | Click **Databases** > **Create Database** |
| `code-highlight in paragraph` | Used sparingly for flags or arguments. | The `min` constraint... |
| code blocks | Code blocks with three back-ticks should have the language included | >```go |
| Text callouts/colored background | Important information such as warnings | [Text callouts](/help-on-help/writing-help/writing-content-callouts) |

## Rule 5 - Hyperlink anchor text

Single-word anchor text (e.g., "click [here](#) for information") is sub-optimal for reading content on a page, and where there's dozens of hyperlinks with the same name, they won't be any use in search.

* [Learn more about hyperlink anchor text](/help-on-help/writing-help/writing-hyperlinks)

## Rule 6 - Avoid content duplication

Content duplication occurs when:
* there's insufficient time available to review and revise existing documentation
* when existing documentation has been [written from too many contexts](/)
* when it's too difficult to work out which page to revise

Content duplication is a problem:

* For users -- how do they know which content is up-to-date and correct for their particular use-case?
* For maintenance -- how do we tell which content is accurate, if it's for a particular version of the product(s), etc

Further information:
* [Writing modular content](/help-on-help/writing-help/writing-modular-content)
* [Writing reusable content](/help-on-help/writing-help/writing-common-include)

## Rule 7 - Don't leave stuff out

An end-user can be assumed to know how to do their job.

They **cannot** be assumed to know how to use the product.

Therefore, you **MUST** include:

* dependencies under the **Before you begin** heading
* all steps in a logical order
* useful links under **Further information**
