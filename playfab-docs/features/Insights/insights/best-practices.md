---
title: Insights Best Practices
author: john-smith-microsoft
description: PlayFab Insights best practices and FAQs
ms.author: john-smith-microsoft
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# PlayFab Insights Best Practices and FAQ

## Best Practices 
- Each performance level comes with a certain quantity of cache. It is a good idea to calculate a daily data footprint and decide how many days of data you would like in cache. A small buffer or very well known data footprint will allow anyone performing queries to know when to expect optimal performance. Running visualizations against that expected performance is also recommended for quick results.
  - For example, a studio has a 5 GB / day data footprint. Selecting a cache size of 450+ GB will allow 90 days of data in cache. Running all visualizations in 90 day running windows will be very efficienct. Joins, unions, and advanced queries will be very efficient. Another option would be to focus live visualizations primarily on 30 day windows and set cache size up to 90 days during working hours and 30 days during off hours, this will create large efficiencies in cost savings.
- Data visualization platforms like PowerBI often run multiple queries for a single visualization. It's recommended that the visualizations be updated serially. If under heavy load it may make sense to increase performance level to the next concurrency to free up simultaneous queries for external tools and analysts. 
- The most common use case for scheduled scaling is scaling down after hours and weekends and scaling up during standard working hours. If making large changes in performance level (e.g. level 3 to 8) it's recommended that you intend to stay at the higher performance level for several hours. Loading terrabytes of data in and out of cache quickly is an inefficient use of resources. All other limits are raised instantly, so you may choose to make the scaling changes if needed.
- Scheduled scaling is not mutually exclusive with manual scaling. If you find that you need more recources in middle of the day, you can make a manual change, the scheduled scaling will continue as expected. 
- Reducing data storage can result in data loss. You will be warned when attempting to reduce storage. Due to the low cost of storage, long term retention is recommended. 
- Insights management commands allow the creation of updating of custom tables. For core reporting and often used tables it's helpful to build custom aggregation tables. Aggregation tables generally have a much smaller data footprint than the source data. This increases query performance and reduces the need for a higher performance level. 
  - For automating aggergation we recommend using Azure Data Factory, a low-cost and scalable automation option. For more information on using Azure Data Factory see the [connectivity]('https://docs.microsoft.com/en-us/gaming/playfab/features/insights/insights/connectivity') section.
- Limit queries by timestamp, don't pull all data to explore the last several days (this is generally good advice in any data system).


## FAQ
1. How can I query data?
   1. the simplest way is to use our built in [data explorer]('https://docs.microsoft.com/en-us/gaming/playfab/features/insights/explorer/')
   2. The [connectivity]('https://docs.microsoft.com/en-us/gaming/playfab/features/insights/insights/connectivity') section has details on additional ways to access data.
2. Why am I getting an error when trying to change my performance level or data retention?
   1. If you have not signed up for a paid account, changing performance levels, retention, exports and some management commands will be unavailable. 
   2. If your Insights cluster is currently changing performance levels you must wait until the change is completed.
3. Can I change between free and paid performance levels?
   1. Sure! You can revert back to the free tier if you don't currently need any of the paid features.
4. How do I get data into my Insights cluster?
   1. Most PlayFab services will automatically generate data for you. 
   2. You can also implement your own telemetry [through PlayStream, or our Telemetry system,]('https://docs.microsoft.com/en-us/rest/api/playfab/events/playstream-events?view=playfab-rest'). 
   3. You can use [Management Commands]('https://review.docs.microsoft.com/en-us/gaming/playfab/features/insights/explorer/management-commands?branch=managementcommands') to ingest custom datasets.
5. What is the standard data schema for PlayFab events?
   1. In PlayFab Insights we load all the data from all events into a single table. This table is named ['events.all]. Inside that table you will see a column called "EventData" that contains the payload of JSON information for each event.  
6. Why can't I write SQL?
   1. As of now, we only support KQL (Kusto Query Language) queries in most scenarios. We're actively exploring adding full SQL support. While KQL takes some getting used to, we think you'll like it once you do.
7. What's the difference between Events Per Second in my Insights performance level and the costs of sending PlayStream events?
   1. Events per second in your Insights performance level represents data ingestion to your cluster through any means. PlayStream write events and write telemetry events are billed independently and represent the cost of writing the the cloud. 
8. Can I have a higher performance level than what I see on my management page?
   1. File a support ticket with us and we'll contact you to talk arrange something that meets your needs.
9.  What is the underlying technology behind PlayFab Insights?
   2. PlayFab Insights uses a specialized variant of Kusto.
10. Why is my data schema different when exporting using custom queries?
   3. The custom query output includes details from the ETL process. Some extra columns will be included. Those columns are generally hidden as they do not serve a purpose.