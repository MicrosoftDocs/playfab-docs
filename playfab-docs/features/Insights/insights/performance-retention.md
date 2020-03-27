---
title: Performance and retention
author: john-smith-microsoft
description: Performance and retention for playfab insights
ms.author: john-smith-microsoft
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---
# Performance Levels & Retention
PlayFab Insights provides studios the ability to change the performance characteristics of their data system. Controls are located in "Insights Management" under the data section in Game Manager. 

## Performance Levels
![Insights Slider](media/performance-level2.png)<br>
Sliding the performance level option will show a comparison of your current select resources and the level you have selected. The most significant resource changes are listed undernearth the slider:

### *Cache Size*
PlayFab Insights uses a specialized variation of Azure Data Explorer (Kusto). Insights separates storage into two categories: Hot Cache and Storage. Hot Cache is memory and SSD storage and is extremely fast to query. Complex queries and data function will be executed quickly when all data is readily accessible in the hot cache. Data stored outside the hot cache in storage is still easily accessible and can be queried, but query times may slow down with large datasets in storage. Data is separated by ingestion time, the most recent data stored first in hot storage. Data storage is an entirely internal process to Insights and data is accessed in the same manner no matter where it's stored. 

Example:<br>
A studio has selected performance level 3 and therefor has 100GB of cache. They have also select 1200 days of retention, so there is just over 3 years of data stored in their cluster. If the studio has a daily data footprint of 1 GB a day, then 100 Days of data is stored in the hot cache. A user may run a query over 90 days and query only hot cache, they may run that same query over all 3 years and query from both sources, no change is needed in query structure. 

**How is cache affected when I change my performance level?**<br>
When you change your performance down, data is loaded from hot cache into storage as the hardware resources are reduced. Similarly, when increasing your performance level, hardware is instantly allocated to you and data is transfered into your cache. This process is generally very fast, but terabyte level shifts in cache size can take a short time to complete. See [Best Practices]('https://docs.microsoft.com/gaming/playfab/features/insights/insights/best-practices') for more information. 

### *Compute Power*
Compute power represents the max quantity of vCPUs allocated for each query. Based on the parallelization of a given query plan, some queries cannot take full advantage of all vCPUs at once (order, distinct). Additionally, to improve interactivity of the querying experience, priority is given to queries by start time, meaning subsequent concurrent queries may see decreased vCPU allocation.

Compute power also increases maximum query length before timeout. the following table represents current numbers:
| Compute Power           | Maximum Compute Time (Seconds) |
|-------------------------|--------------------------------|
| 2 (Free Tier)           | 30s                            |
| 2 (Performance Level 2) | 60s                            |
| 4                       | 120s                           |
| 8                       | 180s                           |
| 16                      | 210s                           |
| 32                      | 240s                           |
| 48                      | 270s                           |
| 64                      | 300s                           |

### *Max Memory Per Query*
This represents the total memory allocated to the query. Note this is different than the memory for storing data. Query memory is specifically for storing query data for computation and processing, this is an important resource for more complex queries. 

### *Max Concurrent Queries*
This value represents the amount of simultaneous queries that can be run at each performance level.

### *Max Events Per Second*
This is the total maximum events per second that can be ingested into the data system. This number is a combination of your playstream and telemetry events and any external ingestion that may be happening. 

**What happens if I exceed my row write limit?**<br>
Paid titles will be charged an overage fee of 1 Credit for every 2.7m (2,700,000) extra events ingested. This overage cost is designed to allow customers with predictable ingestion loads to sit at a smaller performance levels during off hours for cost savings.

### *Event Archives*
Event Archives allow customers to export all or some of their data on a regular schedule to Azure Blob or AWS S3. See [Exporting Data]('https://docs.microsoft.com/gaming/playfab/features/insights/insights/export') for details.

### *Credits Per Hour*
Insights is billed per minute at the credits per hour rate (Credits Per Hour / 60). Insights Credit Pricing can be found [here]('https://playfab.com/pricing/').

## Retention
![Insights Retention](media/insights-retention.png)<br>

The retention setting allows a studio to set the total quantity of days data is kept. The default setting is 30 days, this guarantees GDPR compliance. Retention can be set globally or by table using [Management Commands]('https://review.docs.microsoft.com/gaming/playfab/features/insights/explorer/management-commands?branch=managementcommands'). Retention is charged at a rate of 50 credits per terabyte month, studios are only charged for what is in use by day. Insights Credit Pricing can be found [here]('https://playfab.com/pricing/').

**Example**
A studio has 10 terabytes of data stored at the beginning of the month and does not increase that storage. The total cost would b 500 (10 TB * 50 credits/TB) Credits. 

**Example**
A studio begins the month at 250 GB of data and increases to 750 GB of data throughout the month linearly. The total charge would be 25 (average of each day of the month 0.5 TB * 50 credits/TB) Credits.

