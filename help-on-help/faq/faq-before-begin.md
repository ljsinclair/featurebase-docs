# FAQ on Before you begin

## Questions

* What's "Before you begin" for?
* Why do I need to list stuff under a "Before you begin"?
* Why do we need to state the obvious?
* What goes under "Before you begin?
* What can I leave out of "Before you begin"?
* Are third party applications and systems out-of-scope?

## Answers

### What's "Before you begin" for? / Why list stuff under here?

**Before you begin** gives the user a list of things they need to:
* be aware of (e.g., Admin users can perform steps)
* need to have in place (e.g., Docker running)
* need to have setup/performed (e.g., added a database)

The list of items serves to:
* inform the user about what's required **before** they continue
* provide guidance on prerequisites which **will** prevent successful understanding/execution of the content that follows
* list all systems and their states that will allow FeatureBase to function as expected when steps are performed
* act as a first port-of-call for troubleshooting if something **does** go wrong

### Why do we need to state the obvious?

What's obvious to **you** may not be obvious to our **customers**.

We can assume the following of our customers:
* know how to do **their** jobs
* have expertise in **their** systems
* have **zero** to **none** experience with FeatureBase

Furthermore users are **unlikely** to have their systems setup like a FeatureBase developer on which the system and requirements are **already installed**.

## What goes under **Before you begin**? / What can I leave out? / Should I document Third-party systems?

Some examples:

* You can't create a Table without a Database
* You can't query data if you haven't ingested anything
* You can't run FeatureBase commands in a Terminal unless you've added `/featurebase` to the PATH variable OR are in the correct directory
* You can't install FeatureBase in Docker without first installing and running Docker
* You can't run `curl`, `wget` or `make` commands if they're not installed

As mentioned earlier, **you** might think these are obvious, but you're **not the customer**.

## Should I document third-party systems?

In brief:

* We **do not** document third party systems
* We **DO** hyperlink to information to help our users install/configure/setup the third-party system so that **FeatureBase will work as expected**.
* We **DO** inform users what they need to do with a third-party system in order that **FeatureBase will work as expected**.

Why do we do these things?
* So users have no surprises when running through our documentation and FeatureBase
* So users have a single point where they can find the things they need to make FeatureBase work for them
* So FeatureBase support is not forced to repeat information to different users so those users can perform tasks in FeatureBase

Or to put it bluntly: FeatureBase is a brand new product and **anything** that makes a customer's life easier is a **benefit** to them and to us.
