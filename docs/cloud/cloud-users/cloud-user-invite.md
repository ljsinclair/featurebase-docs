---
title: Invite users
layout: default
parent: Manage users

nav_order: 2
has_toc: false
---

## How do I invite Cloud users?
{: .no_toc }

{% include /cloud-users/cloud-summary-users.md %}

{% include page-toc.md %}

## Before you begin

{: .note}
You will need a user with the `ADMINISTRATOR` role to invite users to your organization.

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage cloud users](/docs/cloud/cloud-users/cloud-users-manage)

### Invite a user

When you invite a user, FeatureBase:
* generates a unique invitation URL that expires after 7 days
* sends the invitation URL to the provided email address
* adds the user email address to the **Invited users** list

* Click **Configuration** > **Manage users**.
* Click **Invite new user**.
* Enter one or more email addresses, using commas to separate them.
* Click **Send invitation**.

## Provide invitation URL (optional)

You can copy the invitation URL and provide it to the user if required.

* Click **Configuration** > **Manage users**.
* Scroll to **Invited users**.
* Click <span class="material-icons md-18">more_vert</span> on the user > **Copy invite URL**.

## Next step

* [Learn how to change user roles](/docs/cloud/cloud-users/cloud-user-edit-role)

## Further information

* [Learn about the user status](/docs/cloud/cloud-users/cloud-ref-user-status)
