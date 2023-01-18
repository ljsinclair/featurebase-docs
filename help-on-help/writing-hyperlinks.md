# Writing hyperlinks

Single word anchor text is sub-optimal, especially if you use the same word over and over again.

* It's harder to see a single hyperlink in a block of text, which means users will miss them
* No-one searches on a single word unless it's a recognised keyword (which itself can be > 1 word), therefore things like `click [here](#) for information` is useless
* Built-in search won't return meaningful results if a user is trying to search on keywords

On the other hand, if you write meaningful anchor text that informs the user why they should click a link or what’s at the destination, this makes the hyperlink:
* clearer to the user and for users using screen readers
* searchable

| Do this | Don’t do this | Why? |
|---|---|---|
| Hyperlink to the company contact page | Add email hyperlinks in text | It’s a maintenance overhead to keep adding email hyperlinks in text |
| [Learn more information on <subject>]() | "...you can find this information [here]()..." | Single word hyperlinks don’t index and aren’t as easy to notice while reading as anchor text that **says what it means** |
