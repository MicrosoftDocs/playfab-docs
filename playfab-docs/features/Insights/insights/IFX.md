---
title: Insights for XBOX
author: McKenzie Elliott
description: Insights for Xbox information
ms.author: mcelliot
ms.date: 08/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Insights for Xbox

> [!Note]
Insights for XBOX is in Private Preview only and is not currently available to Third Party Partners of Microsoft. The date for Public Preview and General Availability have not yet been announced. Please contact [PlayFab support](https://playfab.com/contact/) if you have any questions.

Insights for Xbox pulls data from COSMOS and adds it to PlayFab’s Insights offering built on top of Azure Data Explorer (Kusto). Access to XBOX title data through PlayFab Insights allows you to query, segment, and analyze data through the PlayFab Game Manger.

Insights for XBOX (IFX) is a replacement for Central Analytics and has a primary goal of minimizing transition costs by matching the Central Analytics data schema is closely as possible.

## Onboarding to IFX

1. Identify the product ids you want to move to Xbox insights. You must have Partner Center permissions to these product ids in order to complete the add.
    - You can validate these permissions by logging into [Partner Center](https://partner.microsoft.com/en-US/), selecting the **Dashboard** option, and by selecting **Windows and XBOX** after logging in. Enter the product ID into the search bar. If you have permissions to the product ID, the product will appear in search results.

1. After determining the product ids you want to add, go to the Playfab Game Manager by logging in to [PlayFab.com](PlayFab.com).
1. From the **My Studios** page, select the title that you want to add products to.
1. From the **Title Overview** page, select the **Add-ons** option from the left navigation panel.
1. The **Insights for XBOX** add-on is now visible in the **Analytics** section of the **Add-ons** page.
1. If this is the first time you are adding products to the given title, select the checkbox to accept “GDPR compliance” and select **Install Xbox and Windows data** to complete acceptance of the terms. If this is not your first time adding products to the given title, skip this step.
1. In the **Product id** field, enter the product ids that you would like to add, separated by a comma. For example: *12abc*,*1234bcd*,*1355sjk*
1. Select **Add**. It may take a few minutes for permissions to validate before you see product details appear in the **Xbox title ids** and **Xbox product ids** tables. This action will generate usage data that may be charged by PlayFab Insights. See below for pricing details.
1. To add more products, repeat steps 7 & 8.
1. To delete products, select the **Remove** option next to the product ID that you would like to delete from IFX. When a product is deleted, past product data remains in IFX while future product data will no longer populate to IFX.

Certain individuals during the onboarding experience might be impacted with product permissions authentication issues with Partner Center. Please email the team at pfgaminginsights@microsoft.com if you are being impacted by this issue.

## Pricing

IFX will be billed as part of the Insights meter through the row writes and storage components of the Insights meter. In general the costs for IFX will be lower then the current cross charge for Central Analytics so this should be long term cost savings for your studio.

## IFX Data Sets and Tables

### Logic Tables

Pipeline | Table Name | Description
--- | --- | ---
Dim User | dim.usage.xbox_user | Presence usage and client usage data from users across all the platforms. Does not not contain anonymous users or external users.
Dim Live Title User | dim.usage.xbox_live_title_user | Title usage report by user based on client usage.
Dim User Platform | dim.usage.xbox_user_platform | Date a user is first seen on different platforms. Includes users from client usage and presence usage.
Dim Live Title | dim.store.xbox_live_title | **LIVE TITLE DATA?**
Dim Product | dim.store.xbox_product | Retail and non-retail products related to the on-boarded *XboxTitleID*.
Dim Achievement | dim.usage.xbox_achievement | Achievement data for *XboxTitleID*.
Dim Friends List | dim.social.xbox_friends_list | Due to the size of Friends data, this data set is opt-in only. Contains Modern Active Friends. Updated weekly. [Contact PlayFab](https://playfab.com/contact/) to enable.
Dim Transaction Type | dim.store.xbox_transaction_type | **Transaction data related to IFX-enabled titles?**
Dim Platform | dim.core.xbox_platform | **Which platforms a title has been accessed on?**
Dim Geography | dim.core.xbox_geography | **I HAVE NO IDEA** :)
Dim Payment Type | dim.store.xbox_payment_type | **Payment types per transaction by user??**

### Fact Tables
Pipeline | Table Name | Description
--- | --- | ---
Daily Presence Usage | metrics.usage.xbox_usage_presence
Daily Client Usage | metrics.usage.xbox_daily_usage | Client usage based on TTSO telemetry with AAD users removed. Dataset does not include Steam usage.
Daily Purchase | metrics.store.xbox_daily_purchase | Daily purchases with AAD users removed.
Daily Cancellation | metrics.store.xbox_order_cancellations | metrics.store.xbox_order_cancellations | Daily cancellation data.
Daily Refund | metrics.store.xbox_order_refunds | Daily refund data.
Daily GamePass Title Rank | metrics.usage.xbox_gamepass_title_rank | Ranks based on usage against all titles in the Game Pass Vault.
Daily GamePass Usage Acquisition | metrics.usage.xbox_gamepass_usage_acquisition | Tracks the first time a user plays a GamePass title on each device platform.
Daily GamePass Usage | metrics.usage.xbox_gamepass_usage | Game Pass usage based on *AppInterActivity* telemetry.
Daily GamePass Purchase | metrics.store.xbox_gamepass_purchase | Daily purchases of products in the Game Pass Vault.
Daily Achievement | metrics.usage.xbox_achievement |Daily achievement data. If an event is sent to IFX multiple times on different days, the events will show up multiple times in this table with different *DateId*s but with all other fields identical. Additionally, platform values will differ due to showing all platforms the *XboxTitleId* is available on rather than the platform the achievement is achieved on. These are known issues due to Kusto (ADX) limitations.
Daily Broadcast User | metrics.usage.xbox_broadcaster_activity_user | Daily broadcast user activity data.
Daily Concurrency | metrics.usage.xbox_currency | Daily max currency for *XboxTitleId* on each platform.
Daily Retention Cohort | metrics.usage.xbox_retention_cohort | Cohort stats for *XboxTitleId*s on each platform.