# Writing bans

Pull Requests **will be sent back for rework** if any of the following are found[^45b9]:

## Images and videos

**NOTE** the BNF diagrams in the SQL guide are the ONLY exception to this rule[^63bd].

Images and videos are **BANNED** for the following reasons:

1. They become maintenance overhead with changing GUI
2. They don't scale well on smart devices (yes, CSS and whatnot can help, but read on before you leap to a conclusion)
3. CSS styling images for different screens doesn't help unless the user is willing to manually zoom to see what it's showing, or tap and open in another tab, and IN BOTH CASES, the instructions that back-up the image will be lost
4. You need image `alt` tags to make them accessible to sight/hearing impaired people, which adds more complexity
5. However small the resolution of filesize an image is, it'll still affect site build and load time either locally or on a user browser

Or put another way, if you think you need an image, revise your instructions to verify:
  * [you've written the content clearly enough for a novice user](/help-on-help/writing-help/writing-rules)
  * whether the GUI is too complicated and is the **root-cause** of the need for an image. If so, raise a Jira, explain the problem and get the Devs to fix it.

### Videos have some additional issues

Videos have ALL the above problems plus some more:

* A user who wants to do something will be moving at a slower pace than an expert demonstrator, therefore will need to pause, go back, go forward and get LOST in the video.
* Videos take a lot longer than screenshots to put together, even with handy-dandy screen-capture/recording software.
* They're more than likely going to duplicate written procedures and processes, so represent a duplication of effort
* And if they don't duplicate existing content, you need to ask yourself WHY it's not documented, and WHY you're putting together a video rather than doing it properly in the first place.

## Banned text styling

Please **DO NOT** use any of the following to make information stand out:

| Do not use | Issue | Use instead |
|---|---|---|
| heading styles for sentences and paragraphs | The Table Of Contents shortcode reads heading styles, which means it'll expand uncontrollably if you use any heading style for highlighting | [Text callouts](/help-on-help/writing-help/writing-content-callouts) |
| **bold** for more than a specific UI element | Menu items can be bold. Anything else cannot. | [Text callouts](/help-on-help/writing-help/writing-content-callouts) |
| *italic text* | Italic text isn't clear enough on its own. | [Text callouts](/help-on-help/writing-help/writing-content-callouts) |
| html styles | The SCSS has been customised for the FeatureBase style guide, so anything else is unnecessary | [Text callouts](/help-on-help/writing-help/writing-content-callouts) |
| Manual syntax highlighting | The css is likely to override them, and they may not render properly in production help | Raise a question in the [Slack docs-feedback-team channel](https://moleculacorp.slack.com/archives/C02JJQR01EY) where your issues can be discussed and fixed |
| HTML5/Javascript features (e.g., [Collapsibles/accordion](https://www.w3schools.com/howto/howto_js_accordion.asp)) | The only reason you'd use a collapsible/accordion (or related feature) is to compress a page that is **too long** and contains **too much information**, which is the opposite approach to stated in this stye guide. In short: don't do it. | [Write modular content instead](/help-on-help/writing-help/writing-modular-content) |

---
[^45b9]: Software development is one of these things where there's **always** time pressures, which makes it tempting to:
* Roll your own docs to get them done before the end of the sprint
* Cut corners with videos and screenshots
* Avoid writing docs altogether because it's something you're not good at
* Assume end-users should *just know* the stuff you do

And now I've accepted things aren't always perfect, I'll reiterate that PRs will be rejected/sent for rework if any of these things occur.

[^63bd]: BNF diagrams **do** get out-of-date, and they **are** a maintenance overhead with the **only** benefit being they can be rebuilt **moderately** easily now I've documented the process.
