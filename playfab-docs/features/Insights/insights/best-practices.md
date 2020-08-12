---
title: Insights Best Practices
author: john-smith-microsoft
description: PlayFab Insights best practices and FAQs
ms.author: johsmi
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---
# Best Practices & FAQ
Here we examine some best practices for using PlayFab Insights as well as address the most frequently asked questions. 

## Best Practices 
- Each performance level comes with a certain quantity of cache. It is a good idea to calculate a daily data footprint and decide how many days of data you would like in cache. A small buffer or very well known data footprint will allow anyone performing queries to know when to expect optimal performance. Running visualizations against that expected performance is also recommended for quick results.
  - For example, a studio has a 5 GB / day data footprint. Selecting a cache size of 450+ GB will allow 90 days of data in cache. Running all visualizations in 90 day running windows will be very efficienct. Joins, unions, and advanced queries will be very efficient. Another option would be to focus live visualizations primarily on 30 day windows and set cache size up to 90 days during working hours and 30 days during off hours, this will create large efficiencies in cost savings. Also keep in mind that data is compressed in cache.


 - Data visualization platforms like PowerBI often run multiple queries for a single visualization. It's recommended that the visualizations be updated serially. If under heavy load, or being used by many users, it may make sense to increase performance level to a level that has higher concurrent queries allowed to free up simultaneous queries for external tools and analysts. 


- The most common use case for scheduled scaling is to scale up during standard working hours and to scale down after hours and weekends. If making large changes in performance level (e.g. level 3 to 8) it's recommended that you intend to stay at the higher performance level for several hours. Loading terrabytes of data in and out of cache quickly is an inefficient use of resources. All other limits are raised instantly, so you may choose to make the scaling changes if needed.


- Scheduled scaling is not mutually exclusive with manual scaling. If you find that you need more recources in middle of the day, you can make a manual change, the scheduled scaling will continue as expected. 


- Reducing data storage can result in data loss. You will be warned with the message "Selected retention setting is lower than current setting. Doing so may result in a loss of data." when attempting to reduce storage. Due to the low cost of storage, long term retention is recommended. 


- Insights management commands allow the creation and updating of custom tables. For core reporting and often used tables it's helpful to build custom aggregation tables. Aggregation tables generally have a much smaller data footprint than the source data. This increases query performance and reduces the need for a higher performance level. 
  - For automating data aggregation we recommend using Azure Data Factory, a low-cost and scalable automation option. For more information on using Azure Data Factory see the [connectivity](https://docs.microsoft.com/gaming/playfab/features/insights/connectivity) section.


- Limit queries by timestamp, don't pull all data to explore the last several days (this is generally good advice in any data system).


## FAQ
### How can I query data?
   1. The simplest way is to use our built in [data explorer](https://docs.microsoft.com/gaming/playfab/features/insights/explorer/).
   2. The [connectivity](https://docs.microsoft.com/gaming/playfab/features/insights/connectivity) section has details on additional ways to access data.
### I sent a Microsoft authentication link (AAD) and it didn't work, what happened?
  - If you already have a PlayFab account, you need to sign out before accepting an invite with a different authentication method. 
###  Why am I getting an error when trying to change my performance level or data retention?
   1. If you have not signed up for a paid account, changing performance levels, retention, exports and some management commands will be unavailable. 
   2. If your Insights cluster is currently changing performance levels you must wait until the change is completed.
###  Can I change between free and paid performance levels?
   - Sure! You can revert back to the free tier if you don't currently need any of the paid features.
###  How do I get data into my Insights cluster?
   1. Most PlayFab services automatically generate data for you. 
   2. You can also implement your own telemetry [through PlayStream, or our Telemetry system](https://docs.microsoft.com/rest/api/playfab/events/playstream-events). 
   3. You can use [Management Commands](https://docs.microsoft.com/gaming/playfab/features/insights/insights/management-commands) to ingest custom datasets.
###  What is the standard data schema for PlayFab events?
   - In PlayFab Insights we load all the data from all events into a single table. This table is named ['events.all]. Inside that table you will see a column called "EventData" that contains the payload of JSON information for each event. For complete information about the events.all table, see [About the events.all table](https://docs.microsoft.com/gaming/playfab/features/insights/schemas/events-all) for more complete information. 
###  Why can't I write SQL?
   - As of now, we only support KQL (Kusto Query Language) queries in most scenarios. We're actively exploring adding SQL support. While KQL takes some getting used to, we think you'll like it once you do. For information on converting SQL to Kusto queries, see [SQL to Kusto query translation](https://docs.microsoft.com/azure/kusto/query/sqlcheatsheet).
###  What's the difference between Events Per Second in my Insights performance level and the costs of sending PlayStream events?
   - Events per second in your Insights performance level represents data ingestion to your cluster through any means. PlayStream write events and write telemetry events are billed independently and represent the cost of writing to the cloud. 
###  Can I have a higher performance level than what I see on my management page?
   - File a [support ticket](https://support.playfab.com/hc/requests/new) with us and we'll contact you to arrange something that meets your needs.
###   What is the underlying technology behind PlayFab Insights?
   - PlayFab Insights uses a specialized variant of Azure Data Explorer (Kusto).
###  Why is my data schema different when exporting using custom queries?
  - The custom query output includes details from the ETL (Extract Transform Load) process. Some extra columns will be included. Those columns are generally hidden in the query environment as they do not serve a purpose.
### What happens if I reduce my retention setting to a quantity of days that is less than the total number of days I have data for?
   - You're warned that if you reduce your retention you might delete data. For example, if you have been operating for 1 year and reduce the retention to 6 months, only the most recent 6 months of data is saved, the rest is discarded.
### How do I increase the timeout time on my queries?
   - The time out limits on queries is relative to your compute power which is defined in your performance level. Refer to the compute power table in [Performance and Retention](https://docs.microsoft.com/gaming/playfab/features/insights/insights/performance-retention) under compute power.
### Is there a limit to how much telemetry I can send?
   - The following limits exist for the [WriteTelemetryEvents](xref:titleid.playfabapi.com.events.playstreamevents.writetelemetryevents) API call:

     | Limit Name | Limit Value | Notes |
     |--|--|--|
     | Events per request | 200 events per request | Exceeding this limit will result in a `BadRequest` error. |
     | Events per entity | 8,000 per second | Exceeding this limit will result in a `PerEntityEventRateLimitExceeded` error. An entity most often represents an individual player, but can also be a player group or title. | 
     | Max payload size  | 10240 bytes (10KB) | |

     If you run into any of these limits, please contact the Playfab Support team for assistance. In the upper right-hand corner of Game Manager select the question mark icon, then select **Contact Us**.

### I get an error “Query execution has exceeded the allowed limits” when I try to run a query.
- This error occurs when the size of the result set or the number of rows in the result set exceeds the allowed limit. Try limiting the amount of data returned by scoping the query to relevant data using the *where*, *limit*, or *summarize* operators 
- To export all of your data, navigate to the **Event Export Tab** under **Data** on the **Title Overview** page in PlayFab Game Manager.
- If you want to pull only segments of data or if you are still hitting the query limit, you can partition the data by time or unique id (ex. Player ID, Title ID) and run multiple, smaller queries. The follow is an example of how to partition based on time:

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

- View [Kusto documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/concepts/querylimits) for more information.

### I set truncationmaxsize and truncationmaxrecords variables to a larger value, but I am still getting an error.
- PlayFab insights does not currently support setting these variables. See above for query formulation tips.

### Will querying Insights data prevent events from being ingested? 
- No. PlayFab events will flow into your title’s database with no performance penalty.

### My queries return a “Partial query failure: Low memory condition” error 
- This means the query is too complex and is unable to fit within the memory limits of your Performance Level. Try simplifying your query. For example, a summarize call may have too many groups, or you may be trying to operate on too many rows at once.You can also upgrade your Performance level to allow more memory to be allocated to each query.
- View [Kusto documentation]( https://docs.microsoft.com/en-us/azure/data-explorer/kusto/concepts/partialqueryfailures) for more information.