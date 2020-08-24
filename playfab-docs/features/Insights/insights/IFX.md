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

> [!WARNING]
This page is a WIP


# Insights for Xbox

> [!Note]
Insights for XBOX is in Private Preview only and is not currently available to Third Party Partners of Microsoft. The date for Public Preview and General Availability have not yet been announced. Please contact [PlayFab support](https://playfab.com/contact/) if you have any questions.

Insights for Xbox pulls Xbox title data into PlayFab’s Insights offering which is built on top of Azure Data Explorer (Kusto). Access to XBOX title data through PlayFab Insights allows you to query, segment, and analyze data through the PlayFab Game Manger.

[ Does this even matter to the public?] Insights for XBOX (IFX) is a replacement for Central Analytics and has a primary goal of minimizing transition costs by matching the Central Analytics data schema is closely as possible.

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

Certain individuals during the onboarding experience might be impacted with product permission authentication issues with Partner Center. Please email the team at pfgaminginsights@microsoft.com if you are impacted by this issue.

## Pricing

IFX will be billed as part of the exisiting [Insights meter](https://docs.microsoft.com/en-us/gaming/playfab/features/insights/insights/pricing) through row writes (ingestion) and storage components of the Insights meter. A new line for IFX Ingestion will appear on the **Billing Summary** to display accumulated IFX charges. Charges will be calculated based on the size of the data ingested into IFX by counting the number of row writes. The latest ingestion prices can be found on the **Insights for XBOX Add-On** page in **Game Manager**.

## IFX Data Sets and Tables

### Logic Tables

Pipeline | Table Name | Description
--- | --- | ---
Dim User | dim.usage.xbox_user | Presence usage and client usage data from users across all the platforms. Does not not contain anonymous users or external users.
Dim Live Title User | dim.usage.xbox_live_title_user | Title usage report by user based on client usage.
Dim User Platform | dim.usage.xbox_user_platform | Date a user is first seen on different platforms. Includes users from client usage and presence usage.
Dim Live Title | dim.store.xbox_live_title | *XboxTitleId* meta data related to IFX onboarded titles. Data may include retail, demo or test data.
Dim Product | dim.store.xbox_product | Retail and non-retail products related to the on-boarded *XboxTitleID*.
Dim Achievement | dim.usage.xbox_achievement | Achievement data for *XboxTitleID*.
Dim Transaction Type | dim.store.xbox_transaction_type | Description of the different transaction types when a purchase traction is made.
Dim Platform | dim.core.xbox_platform | Device platform data.
Dim Geography | dim.core.xbox_geography | Geography-related usage data for a title
Dim Payment Type | dim.store.xbox_payment_type | Payment type details when a purchase transaction is made.

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

## Latency by Data Type

Pipeline | Latency | Explanation
--- | --- | ---
Hourly Purchase Data | 1-2 Hours | IFX ingests hourly purchase order events from Xbox Live. Latency is no more than 2 hours from the time when the event was emitted. For example, purchase order events happening on 03/11 between 13:00 and 14:00 will be ingested on 03/11 by 15:00
Daily Purchase Data | 1 Day | IFX ingests daily purchase data from various cosmos ConsumerModules. For purchase orders, we overwrite the hourly data ingested during the prior day. For example, on 03/11, we will overwrite the hourly purchase order data we ingested for 03/10 and replace with it with daily purchase data for 03/10. When hourly event data is not available due to failures, cancellations, chargebacks, or refunds, daily data is the deepest granularity available.
7 Day Purchase Reprocess | 1 Day | Reprocessed purchase data undergoes constant updates. For example, if a customer buys a product and then cancels their order, the purchase data is updated. Every day IFX will back process purchase day on a rolling 7 days basis to ensure any late arriving events and updates are captured. For example, on 03/11, we will populate 03/10 data for all purchase scenarios, as well as reprocess data for 03/04~03/09.
Hourly Usage Data | 1-2 Hours | When tracking presence via title usage, *Microsoft.Xbox.Presence.BackEnd.Service.Logging.TitleEnd* events signify a session has ended. This event is ingested near real time and batch processed every hour but no more than 2 hours after the event is emitted. For example, if presence usage occurs on 03/11 between 13:00 and 14:00, usage data will be ingested by 03/11 15:00.
Daily Usage Data | 1 Day | Daily usage data is only used for backfills or reprocessing. IFX ingests one day's worth of usage data all at once rather than ingesting the data hourly. The entire day will display as YYYY-MM-dd 00:00 in the *metrics.usage.xbox_usage_intervals* table. The exact usage start and end time is recorded in the *UsageStartTime* and *UsageEndTime* columns. 
Daily Subscription Status (*metrics.subscription.xbox_subscription_status*) | 2 Days | Represents users' subscription status from the reported day. Includes all major game subscription products (Gold, Game Pass, and EA). Only users with purchase or usage data for the title on the reported day will be present in the title database. This means that only the status of daily "active" users are shown for that day.
Daily Subscription Status (*metrics.store.xbox_subscription_status*) | **INFO NEEDED** | Operates similarly to  the Daily Subscription Status but shows the subscription status of all users that have ever had usage activity.

> [!WARNING] 
> Should the below be public data?! My guess is no... not going to clean up the text until confirmed it should be here.

### Subscription Status functions
In the tenant title databases, the following functions can be deployed to let users query Subscription status for each Xuid and DateId combination. The functions populate the subscription state of each Gold, GamePass, EAAccess, PCGamePass, and Ultimate subscription, and displays if the Xuid is entitled for that subscription.

- Xbox_Get_Subscription_Purchase_Orders
- Xbox_Get_Subscription_Purchase_Chargeback
- Xbox_Get_Subscription_Purchase_Failed
- Xbox_Get_Subscription_Purchase_Cancellations
- Xbox_Get_Subscription_Purchase_Refunds
- Xbox_Get_Subscription_Usage

The results can be obtained by running the function with *startDate* and *endDate* inputs as shown below. The example will fetch complete transaction details at Xuid level and which subscriptions it was entitled for.

Xbox_Get_Subscription_Purchase_Orders('2020-02-01', '2020-03-01')​​​​​​​


​​Run for shorter date range in case the function execution taking longer time, especially in the case of usage.
- If the results are not shown, there might not be any transactions for the given date range.