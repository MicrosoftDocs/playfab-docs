---
title: Insights Best Practices
author: joannaleecy
description: PlayFab Insights best practices and FAQs
ms.author: joanlee
ms.date: 02/28/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Best Practices and FAQ

Here we examine some best practices for using PlayFab Insights and address the most frequently asked questions.

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for best practice details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

## Best Practices

- Each performance level comes with a certain quantity of cache. It's a good idea to calculate a daily data footprint and decide how many days of data you would like in cache. A small buffer or well known data footprint allows anyone performing queries to know when to expect optimal performance. Running visualizations against that expected performance is also recommended for quick results.
  - For example, a studio has a 5 GB / day data footprint. Selecting a cache size of 450+ allows 90 days of data in cache. Running all visualizations in a 90-day running window will be efficient. Joins, unions, and advanced queries will also be efficient. Another option would be to focus live visualizations primarily on 30 day windows and set cache size up to 90 days during working hours and 30 days during off hours. This creates large efficiencies in cost savings. Also keep in mind that data is compressed in cache.


 - Data visualization platforms like Power BI often run multiple queries for a single visualization. It's recommended that the visualizations be updated serially. If under heavy load, or being used by many users, it may make sense to increase performance level to a level that has higher concurrent queries allowed to free up simultaneous queries for external tools and analysts. 


- The most common use case for scheduled scaling is to scale up during standard working hours and to scale down after hours and weekends. If making large changes in performance level (for example, level 3 to 8) it's recommended that you intend to stay at the higher performance level for several hours. Loading Terabytes of data in and out of cache quickly is an inefficient use of resources. All other limits are raised instantly, so you may choose to make the scaling changes if needed.


- Scheduled scaling isn't mutually exclusive with manual scaling. If you find that you need more resources in the middle of the day, you can make a manual change, the scheduled scaling continues as expected. 


- Reducing data storage can result in data loss. You'll be warned with the message "Selected retention setting is lower than current setting. Doing so may result in a loss of data." when attempting to reduce storage. Due to the low cost of storage, long term retention is recommended. 


- Insights management commands allow the creation and updating of custom tables. For core reporting and often used tables it's helpful to build custom aggregation tables. Aggregation tables generally have a smaller data footprint than the source data. This increases query performance and reduces the need for a higher performance level. 
  - For automating data aggregation we recommend using Azure Data Factory, a low-cost and scalable automation option. For more information on using Azure Data Factory, see the [connectivity](../connectivity/index.md) section.


- Limit queries using timestamp is a good data management practice. You don't pull all the data in the last several days at a go.


## FAQ
### How can I query data?

   1. The simplest way is to use our built-in [data explorer](/gaming/playfab/features/insights/data-explorer/).
   2. The [connectivity](../connectivity/index.md) section has details on more ways to access data.
### I sent a Microsoft authentication link (using Azure Active Directory) and it didn't work, what happened?
  - If you already have a PlayFab account, you need to sign out before accepting an invite with a different authentication method. 
###  Why am I getting an error when trying to change my performance level or data retention?
   1. If you haven't signed up for a paid account, changing performance levels, retention, exports and some management commands will be unavailable. 
   2. If your Insights cluster is currently changing performance levels, you must wait until the change is completed.
###  Can I change between free and paid performance levels?
   - Sure! You can revert back to the free tier if you don't currently need any of the paid features.
###  How do I get data into my Insights cluster?
   1. Most PlayFab services automatically generate data for you. 
   2. You can also implement your own telemetry [through PlayStream, or our Telemetry system](/gaming/playfab/features/automation/playstream-events/).
   3. You can use [Management Commands](/gaming/playfab/features/insights/management-commands) to ingest custom datasets.
###  What is the standard data schema for PlayFab events?
   - In PlayFab Insights we load all the data from all events into a single table. This table is named ['events.all]. Inside that table you'll see a column called "EventData" that contains the payload of JSON information for each event. For complete information about the events.all table, see [About the events.all table](../../acting-data/schemas-events-all.md) for more complete information. 
###  Why can't I write SQL?
   - As of now, we only support KQL (Kusto Query Language) queries in most scenarios. We're actively exploring adding SQL support. While KQL takes some getting used to, we think you'll like it once you do. For information on converting SQL to Kusto queries, see [SQL to Kusto query translation](/azure/data-explorer/kusto/query/sqlcheatsheet).
###  What's the difference between Events Per Second in my Insights performance level and the costs of sending PlayStream events?
   - Events per second in your Insights performance level represents data ingestion to your cluster through any means. PlayStream write events and write telemetry events are billed independently and represent the cost of writing to the cloud. 
###  Can I have a higher performance level than what I see on my management page?
   - File a [support ticket](https://support.playfab.com/hc/requests/new) with us and we'll contact you to arrange something that meets your needs.
###   What is the underlying technology behind PlayFab Insights?
   - PlayFab Insights uses a specialized variant of Azure Data Explorer (Kusto).
###  Why is my data schema different when exporting using custom queries?
  - The custom query output includes details from the ETL (Extract Transform Load) process. Some extra columns are included. Those columns are hidden in the query environment as they don't serve a purpose.
### What happens if I reduce my retention setting to a quantity of days that is less than the total number of days I have data for?
   - You're warned that if you reduce your retention you might delete data. For example, if you have been operating for one year and reduce the retention to six months, only the most recent six months of data is saved, the rest is discarded.
### How do I increase the timeout time on my queries?
   - The time-out limits on queries is relative to your compute power that is defined in your performance level. Refer to the compute power table in [Performance and Retention](/gaming/playfab/features/insights/performance-retention) under compute power.
### Is there a limit to how much telemetry I can send?
   - The following limits exist for the [WriteTelemetryEvents](xref:titleid.playfabapi.com.events.playstreamevents.writetelemetryevents) API call:

     | Limit Name | Limit Value | Notes |
     |--|--|--|
     | Events per request | 200 events per request | Exceeding this limit results in a `BadRequest` error. |
     | Events per entity | 8,000 per second | Exceeding this limit results in a `PerEntityEventRateLimitExceeded` error. An entity most often represents an individual player, but can also be a player group or title. | 
     | Max payload size  | 10,240 bytes (10 KB) | |

     If you run into any of these limits, contact the Playfab Support team for assistance. In the upper right-hand corner of Game Manager select the question mark icon, then select **Contact Us**.

### I get an error “Query execution has exceeded the allowed limits” when I try to run a query.
- This error occurs when the size of the result set or the number of rows in the result set exceeds the allowed limit. Try limiting the amount of data returned by scoping the query to relevant data using the *where*, *limit*, or *summarize* operators 
- To export all of your data, navigate to the **Event Export Tab** under **Data** on the **Title Overview** page in PlayFab Game Manager.
- If you want to pull only segments of data or if you're still hitting the query limit, you can partition the data by time or unique ID (ex. Player ID, Title ID) and run multiple, smaller queries. The follow is an example of how to partition based on time:

Where
```sql
let start = datetime(2020-08-03);
let end = datetime(2020-08-07);
['events.all'] | where Timestamp between(start .. end)
```

Limit
```sql
['events.all'] | limit 1000
```

Summarize
```sql
['events.all'] | summarize count() by FullName_Name, bin(Timestamp, 1d)
```

- View [Kusto documentation](/azure/data-explorer/kusto/concepts/querylimits) for more information.

### I set truncationmaxsize and truncationmaxrecords variables to a larger value, but I'm still getting an error.
- PlayFab Insights doesn't currently support setting these variables. See above for query formulation tips.

### Will querying Insights data prevent events from being ingested? 
- No. PlayFab events will flow into your title’s database with no performance 
- penalty.

### My queries return a “Partial query failure: Low memory condition” error 
- This means the query is too complex and is unable to fit within the memory limits of your Performance Level. Try simplifying your query. For example, a summarize call may have too many groups, or you may be trying to operate on too many rows at once. You can also upgrade your Performance level to allow more memory to be allocated to each query.
- View [Kusto documentation](/azure/data-explorer/kusto/concepts/partialqueryfailures) for more information.

### Will I lose data if my volume of events is higher than what is allowed by my performance level?
- No, but you will be charged for overrages. Overages are measured in the number of Insights Credits consumed. Insights Credit prices can be found on [PlayFab.com/Pricing](https://playfab.com/pricing/).

### How do I decide by performance level?

- The right performance level for you is best determined by your title's usage. By raising performance level, you'll gain access to more data in cache and other query resources resulting in faster running queries. For more information, see [Performance levels and retention](/gaming/playfab/features/insights/performance-retention) to learn more about performance levels.

## How do I grant a user permissions to the Data > Explorer page for a particular title?

- Follow the [PlayFab User Roles](../../../gamemanager/playfab-user-roles.md) guide to access, create, and grant user permissions.
- A user needs the following 3 permissions to access the Data Explorer:

  - Explorer data & tab (Read and Write permissions)
  - Analytics data read access (Read permissions)
  - Analytics data write access (Write permissions)
