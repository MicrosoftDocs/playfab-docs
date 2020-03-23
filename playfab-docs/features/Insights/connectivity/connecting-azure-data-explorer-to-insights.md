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

This guide helps you get started using Azure Data Explorer (ADX) along with Insights. After connecting, you can use Azure Data Explorer to query your game data and discover relevant insights. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

## Prerequisites
* A PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../authentication/aad-authentication/index.md) for instructions on creating an AAD-authenticated account or user. 
  
> [!NOTE]
> To verify that the account, or user, is set to use the Microsoft authentication provider:
>    * Visit the PlayFab [log in page](https://developer.playfab.com/login).
>    * Use the the Sign in with Microsoft link to access your PlayFab account.
> 
> If you can sign in, then the account is set to use the Microsoft authentication provider.
* The following [Game Manager permissions](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#permissions-and-roles) enabled for your user:
    *  Admin status.
    *  Access to the Explorer tab and associated data.
    *  Read and write access to Analytics data.

## Connect with Azure Data Explorer (ADX)
 
To connect with Azure Data Explorer:

1. Open [Azure Data Explorer](https://dataexplorer.azure.com/). Select **Add Cluster**. 

   ![ADX Add connection](media/adx-add-cluster-button.png)

2. Enter your title API endpoint, which follows the format `https://<titleID>.playfabapi.com`. 
3. Select **Add**, and you should now be able to execute queries or commands on the database. 

## Additional resources

* [Azure Data Explorer documentation](https://docs.microsoft.com/azure/data-explorer/)
* Connect more tools to Insights at [Connecting external tools to Insights](index.md)