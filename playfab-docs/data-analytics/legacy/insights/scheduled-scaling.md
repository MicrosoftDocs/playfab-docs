---
title: Scheduled Scaling
author: joannaleecy
description: Scheduled Scaling for playfab insights
ms.author: joanlee
ms.date: 02/28/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Insights Scheduled Scaling

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Scheduled Scaling**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

The Insights Performance Level can be set to scale up and down at specific times of the day. This allows a studio to match their analytics resources demand to their supply and optimize costs. Scheduled Tasks can be found under automation in Game Manager. It can also be reached by clicking the *Add Insights scaling scheduled task* button in Insights Management. 
<br>
![Insights Schedule](media/insights-schedule.png)


To create a task for scaling your cluster:
1. Provide a name and description for the task.
2. Select the type "Insights scheduled scaling".
3. Select the performance level you wish to scale to.  
4. Select "recurring" on the right under "SCHEDULE" and provide a valid cron expression.
5. Select Save at the bottom.

The scheduled scale appears in the scheduled tasks section and in the Insights Management Page. The task can be deactivated without deleting if you don't want it to run, but also don't want to delete it.

### **Recommendation**
Changing your performance level allocates hardware resources to your data system immediately. However, transferring data into your new resources can take several minutes. It isn't recommended that you schedule large changes in performance level quickly after previous changes. See [Best Practices](/gaming/playfab/features/insights/best-practices) for recommendations. 

