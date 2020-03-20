---
title: Connecting Azure Data Explorer to Insights
author: natashaorie
description: Guide to connecting Azure Data Explorer to Insights. 
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Azure Data Explorer to Insights

This guide helps you get started using Azure Data Explorer (ADX) along with Insights. To learn more about other tools you can connect Insights with, go to the [connectivity guide](index.md).

## Prerequisites
* A PlayFab user account authenticated with [AAD (Azure Active Directory)](https://docs.microsoft.com/gaming/playfab/features/authentication/aad-authentication/).
* The following [Game Manager permissions](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#assigning-roles) enabled for your user:
    *  Admin status.
    *  Access to the Explorer tab and associated data.
    *  Read and write access to Analytics data.

## Connect with Azure Data Explorer (ADX)
 
1. Open [Azure Data Explorer](https://dataexplorer.azure.com/). Select **Add Cluster**. 

   ![ADX Add connection](media/adx-add-cluster-button.png)

2. Enter your title API endpoint, which follows the format `https://<titleID>.playfabapi.com`. 
3. Select **Add**, and you should now be able to execute queries or commands on the database. 

## Additional resources

* Azure Data Explorer [documentation](https://docs.microsoft.com/azure/data-explorer/).
* Connect [more tools](index.md) to Insights.