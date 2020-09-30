---
title: Insights for XBOX
author: mckmoffatt
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
>Insights for XBOX is in Private Preview only and is not currently available to Second or Third Party Partners of Microsoft. The date for Public Preview and General Availability have not yet been announced. Please contact [PlayFab support](https://playfab.com/contact/) if you have any questions.

Insights for Xbox (IFX) pulls Xbox title data into PlayFab’s Insights offering which is built on top of Azure Data Explorer (Kusto). Access to XBOX title data through PlayFab Insights allows you to query and analyze data through the PlayFab Game Manager.

## Onboarding to IFX

1. Identify the product ids you want to move to Xbox insights. You must have Partner Center permissions to these product ids in order to complete the add.
    - You can validate these permissions by logging into [Partner Center](https://partner.microsoft.com/), selecting the **Dashboard** option, and by selecting **Windows and XBOX** after logging in. Enter the product ID into the search bar. If you have permissions to the product ID, the product will appear in search results.

1. After determining the product ids you want to add, go to the Playfab Game Manager by logging in to [PlayFab.com](https://playfab.com/).
1. From the **My Studios** page, select the title that you want to add products to.
1. From the **Title Overview** page, select the **Add-ons** option from the left navigation panel.
1. The **Insights for XBOX** add-on is now visible in the **Analytics** section of the **Add-ons** page.
1. If this is the first time you are adding products to the given title, select the checkbox to accept “GDPR compliance” and select **Install Xbox and Windows data** to complete acceptance of the terms. If this is not your first time adding products to the given title, skip this step.
1. In the **PRODUCT ID** field, enter the product ids that you would like to add, separated by a comma. For example: *12abc*,*1234bcd*,*1355sjk*
1. Select **Add**. It may take a few minutes for permissions to validate before you see product details appear in the **Xbox title ids** and **Xbox product ids** tables. This action will generate usage data that may be charged by PlayFab Insights. See below for pricing details.
1. To add more products, repeat steps 7 and 8.
1. To delete products, select the **Remove** option next to the product ID that you would like to delete from IFX. When a product is deleted, past product data is removed.

Certain individuals during the onboarding experience might be impacted with product permission authentication issues with Partner Center. Please email the team at pfgaminginsights@microsoft.com if you are impacted by this issue.

## Pricing

IFX will be billed as part of the existing [Insights meter](https://docs.microsoft.com/gaming/playfab/features/insights/insights/pricing) through row writes (ingestion) and storage components of the Insights meter. A new line for IFX Ingestion will appear on the **Billing Summary** to display accumulated IFX charges and storage charges will be included in the existing PlayFab Insights meter. Charges will be calculated based on the size of the data ingested into IFX by counting the number of row writes. The latest ingestion prices can be found on the **Insights for XBOX Add-On** page in **Game Manager**.

Adding and deleting product IDs will trigger data processing which will cause an increase in that month's (and possibly future month's) bill. To keep your monthly bill from increasing, PlayFab recommends adding and deleting Product IDs as infrequently as possible.

## IFX data sets and tables

In order to maintain the highest level of data accuracy, some tables will reprocess the last 7 days of data on a daily basis. This prevents missing data that can be caused by late arriving events or delayed big data pipelines. Tables with 7 day reprocessing are noted in the description column.

### Dimension tables

> [!NOTE]
> Slow-changing dimension data is refreshed daily and static dimension data is refreshed weekly.

Data | Table name | Description
--- | --- | ---
Dim User | dim.usage.xbox_user | User meta data as it relates to presence usage and client usage data from users across all the platforms. Does not not contain anonymous users or external users.
Dim Live Title User | dim.usage.xbox_live_title_user | Title usage report  user and their stats based on client usage.
Dim User Platform | dim.usage.xbox_user_platform | Date a user is first seen on different platforms. Includes users from client usage and presence usage.
Dim Live Title | dim.store.xbox_live_title | *XboxTitleId* meta data related to retail and non-retail products that have been on-boarded to IFX. Data may include demo or test data.
Dim Product | dim.store.xbox_product | Retail and non-retail products related to the on-boarded *XboxTitleID*.
Dim Achievement | dim.usage.xbox_achievement | Achievement meta data for *XboxTitleID*.
Dim Transaction Type | dim.store.xbox_transaction_type | Description of the different transaction types when a purchase traction is made.
Dim Platform | dim.core.xbox_platform | Descriptive data on different usage platforms.
Dim Geography | dim.core.xbox_geography | Geography meta data.
Dim Payment Type | dim.store.xbox_payment_type | Payment type details when a purchase transaction is made.

### Metric tables and data latency
Data | Table name | Latency | Description
--- | --- | --- | ---
Daily Presence Usage | metrics.usage.xbox_usage_intervals | 1-2 hours | Usage based on service and telemetry. Same data as "metrics.usage.xbox_usage_presence" below but has a flatter schema and shorter latency.
Daily Presence Usage | metrics.usage.xbox_usage_presence | 1 Day | Presence usage by title. The source of presence data is xbox live and the data contains information about users on different platforms. Filter on ClientDeviceType == "Win32" for Steam usage and on ClientDeviceType == "WindowsOneCore" for cumulative PC usage. Presence events fire twice when GameBar is enabled when playing on Steam. One event is fired for Win32 and one is fired for WindowsOneCore.
Daily Client Usage | metrics.usage.xbox_daily_usage | 1 Day | Usage based on client end telemetry with AAD users removed. Dataset does not include Steam usage. Daily usage data is only used for backfills or reprocessing. IFX ingests one day's worth of usage data all at once rather than ingesting the data hourly. The entire day will display as YYYY-MM-dd 00:00 in the *metrics.usage.xbox_usage_intervals* table. The exact usage start and end time is recorded in the *UsageStartTime* and *UsageEndTime* columns. 
Daily Purchase Orders | metrics.store.xbox_purchase_orders | 1-2 hours | Same data as "metrics.store.xbox_daily_purchase" below but has a flatter schema and shorter latency. Last 7 days of data is reprocessed on a daily basis.
Daily Purchase | metrics.store.xbox_daily_purchase | 1 Day | Daily purchases with AAD users removed. Last 7 days of data is reprocessed on a daily basis.
Daily Refund | metrics.store.xbox_purchase_refunds | 3 days | Same data as "metrics.store.xbox_order_refunds" below but has a flatter schema. Last 7 days of data is reprocessed on a daily basis.
Daily Refund | metrics.store.xbox_order_refunds | 3 days | Daily refund data. Last 7 days of data is reprocessed on a daily basis.
Daily Cancellation | metrics.store.xbox_purchase_cancellations | 3 days | Same data as "metrics.store.xbox_order_cancellations" below but has a flatter schema. Last 7 days of data is reprocessed on a daily basis.
Daily Cancellation | metrics.store.xbox_order_cancellations | 3 days | Daily cancellation data. Last 7 days of data is reprocessed on a daily basis.
Daily Purchase Failures | metrics.store.xbox_purchase_failures | 3 days | Purchase order metadata on daily failed purchases. Last 7 days of data is reprocessed on a daily basis.
Daily Purchase Chargebacks | metrics.store.xbox_purchase_chargebacks | 3 days | Purchase order metadata on daily chargebacks. Last 7 days of data is reprocessed on a daily basis.
Daily GamePass Purchase | metrics.store.xbox_gamepass_purchase | 3 days | Daily purchases of products in the Game Pass Vault. Last 7 days of data is reprocessed on a daily basis.
Daily GamePass Usage | metrics.usage.xbox_gamepass_usage | 3 days | Game Pass usage based on client telemetry.
Daily GamePass Usage Acquisition | metrics.usage.xbox_gamepass_usage_acquisition | 3 days | Tracks the first time a user plays a GamePass title on each device platform.
Daily GamePass Title Rank | metrics.usage.xbox_gamepass_title_rank | 1 Day | Ranks based on usage against all titles in the Game Pass Vault.
Xbox Subscription Status | metrics.subscription.xbox_subscription_status | 2 days | Same data as "metrics.store.xbox_subscription_status" below with an identical schema. Includes all major game subscription products (Gold, Game Pass, and EA). Only users with purchase or usage data for the title on a single, reported day will be present in the title database. This means that only the status of daily "active" users are shown for that day.
Xbox Subscription Status | metrics.store.xbox_subscription_status | 2 days | Tracks the status of a user's Xbox subscription. Operates similarly to the "metrics.subscription.xbox_subscription_status" Daily Subscription Status table but shows the subscription status of all users that have ever had usage activity from any point in the past.
Daily Retention Cohort | metrics.usage.xbox_retention_cohort | 1 Day | Cohort stats for *XboxTitleId*s on each platform.
Daily Broadcast User | metrics.usage.xbox_broadcaster_activity_user | 1 Day | Daily broadcast user activity data.
Daily Achievement | metrics.usage.xbox_achievement | 1 Day | Daily achievement data. At a very low occurrence rate, an achievement event can be sent to IFX system more than once. This will look like an achievement is achieved more than once on different days, which shouldn't be the reality. In this case, use the later occurrence as the real achieved date. Platform value will indicate all platforms the *XboxTitleId* is available on, rather than the platform the achievement is achieved on.
Daily Concurrency | metrics.usage.xbox_currency | 1 Day | Daily max currency for *XboxTitleId* on each platform.


## Subscription status functions

In the tenant title databases, the following functions can be deployed to let users query Subscription status for each Xuid and DateId combination. The functions populate the subscription state of each Gold, GamePass, EAAccess, PCGamePass, and Ultimate subscription, and displays if the Xuid is entitled for that subscription.

- Xbox_Get_Subscription_Purchase_Orders
- Xbox_Get_Subscription_Purchase_Chargeback
- Xbox_Get_Subscription_Purchase_Failed
- Xbox_Get_Subscription_Purchase_Cancellations
- Xbox_Get_Subscription_Purchase_Refunds
- Xbox_Get_Subscription_Usage

The results can be obtained by running the function with *startDate* and *endDate* inputs as shown below. The example will fetch complete transaction details at Xuid level and which subscriptions it was entitled for.

```javascript
Xbox_Get_Subscription_Purchase_Orders('2020-02-01', '2020-03-01')​​​​​​​
```


### Additional notes

- If the results are not shown, there might not be any transactions for the given date range.
- If the function execution takes longer than expected, run the function on shorter date ranges, especially in the case of querying usage.
