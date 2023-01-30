# Writing hyperlinks

## Hyperlink styles

Hyperlink colours (including those in navigation bars) are governed by the `$link-color` setting in `featurebase.scss`.

## Internal or external hyperlinks

| Type of link | Structure | Example |
|---|---|---|
| Internal | `[meaningful-anchor-text](/docs/folder/filename)` | `[Learn how to create tables in FeatureBase cloud](/docs/cloud/cloud-tables/cloud-table-create)` |
| External | `[meaningful-anchor-text](https://url){:target="_blank"}` | [Visit the FeatureBase website](https://featurebase.com){:target="_blank"} |

## Why write meaningful anchor text?

Writing meaningful anchor text for a hyperlink:
* helps give context to what's on the other end of the link
* makes hyperlinks more visible and clearer in text
* are more likely to be indexed because they'll invariably feature a keyword

## What's wrong with a single word?

>AKA if it was good enough for the web in 1998, it's good enough in the 2020s...

Single word anchor text is sub-optimal, especially if you use the same word over and over again.

| Example | Problem | Solution |
|---|---|---|
| "...once you've created a database you should create your tables and you can learn how to do that [here](#). Once you've done that you can begin ingesting data..." | It's harder to see a single hyperlink in a block of text, which means users will miss them. | "Once you've created a database you should create your tables.</br>* [Learn how to manage and create tables](#)<br/> When that task is complete, you can..." |

## Other issues with single-word hyperlinks

* No-one searches on a single word unless it's a recognised keyword (which itself can be > 1 word), therefore things like `click [here](#)` are useless.
* Single words won't be indexed in search so that again makes information harder to find.
* They're not accessible for screen readers or people with sight impairment.

## Further information

* [W3Schools page on accessible anchor text](https://www.w3schools.com/accessibility/accessibility_link_text.php)
* [W3Schools page on regional accessibility laws](https://www.w3.org/WAI/policies/united-states/)
* [CSUN best practices for accessible links with a video](https://www.csun.edu/universal-design-center/best-practices-accessible-links)
