---
title: Accept invitation to new organization
layout: default
parent: Manage my account
grand_parent: Cloud
nav_order: 3
---

## How do I accept an invitation to a new organization?
{: .no_toc }

There is a 1:1 relationship between a FeatureBase user and its organisation.

However, FeatureBase users can be invited to join a different organization.

When completed, the user account:
* is unlinked from the original organization
* is linked to the new organization
* can login ONLY to the new organization

{% include page-toc.md %}

{% include /cloud-users/cloud-summary-user-move.md %}

{: .note}
Users can opt-out of the account move by ignoring the invitation email or click **No, thanks** on the confirmation page.

## Before you begin

* [Activate your FeatureBase account](/docs/cloud/my-account/cloud-user-activate-account)
* Administrators only: [Grant the **Administrator** role to another account](/docs/cloud/cloud-users/cloud-user-edit-role) if required

## How do I move my account to another organization?

{: .warning}
Accepting the move means you **cannot** login to your original organization.

## Step one - delete resources

Resources cannot be transferred and must be deleted before an account move can take place.

* [Learn how to drop tables](/docs/cloud/cloud-tables/cloud-table-delete)
* [Learn how to delete databases](/docs/cloud/cloud-databases/cloud-db-delete)

## Step two - accept the invitation to move your account

* Click **Move account** in the invitation email.
* Click **Move account** on the FeatureBase confirmation page.
* Login to the new organization with your current user name and password.
