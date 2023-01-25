---
title: Azure-AD single sign on
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I configure single sign-on from Azure AD?

Configure Azure Active Directory as an authentication IdP.

## Before you begin

* Obtain administrator privileges to your Azure AD account
{% include /com-install/com-install-before-begin.md %}

## Step one: Register FeatureBase as an Azure application

Use these values as you complete the registration process:

| Step | Required value | What to add | Example |
|---|---|---|---|
| 4 | Redirect URL | The fully qualified domain or public IP address with `/redirect` as a suffix | `https://YOUR-DOMAIN-HERE:10101/redirect` |
| 6 | Microsoft Graph permissions | `Microsoft Graph : Delegated : GroupMember.ReadAll.`<br/> `Microsoft Graph : Delegated : User.Read.All.` |  |

* [Register FeatureBase as an application](https://docs.microsoft.com/en-us/powerapps/developer/data-platform/walkthrough-register-app-azure-active-directory#create-an-application-registration){:target="_blank"}

## Step 2 - create an application secret key

* [Create a new application secret key](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal#option-2-create-a-new-application-secret)

## Step 3 - Add the secret key to `featurebase.conf`

* Edit `featurebase.conf`
* Add the application secret as the `client-secret` value

## Step 4 - Create Azure groups

Complete steps 1 to 10.

* [Create groups](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal#create-a-basic-group-and-add-members)

## Step 5 - Add users to Azure groups

Complete steps 11 and 12.

* [Add users to groups](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal#create-a-basic-group-and-add-members)

## Step 6 - Set application authentication

Perform these steps in your Azure application settings.

* Open the Application configuration page.
* Click the Authentication tab > Advanced Settings
* Toggle **Allow public client flows** to **yes**

!["Image of AzureAD app configuration page with Allow public client flows toggled to yes."](/img/public_client_flows.png)

## Next step

* [Setup FeatureBase authentication](/docs/community/com-config/com-config-authentication)
