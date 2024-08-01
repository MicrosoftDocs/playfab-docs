---
title: Connecting Azure Data Explorer to Insights
author: natashaorie
description: Guide to connecting Azure Data Explorer to Insights. 
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Azure Data Explorer to Insights

This guide helps you get started using Azure Data Explorer (ADX) along with Insights. After connecting, you can use Azure Data Explorer to query your game data and discover relevant insights. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

## Prerequisites

### PlayFab account authenticated with AAD

You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../../features/authentication/aad-authentication/index.md) for instructions on creating an AAD-authenticated account or user.

To verify that the account, or user, is set to use the Microsoft authentication provider:

* Navigate to [developer.playfab.com](https://developer.playfab.com).
* Select **Sign in with Microsoft** to access your PlayFab account.

If you can sign in, then the account is set to use the Microsoft authentication provider.

### Other prerequisites

> [!IMPORTANT]
> Insights only supports the V1 query response schema. You can update the response schema in Azure Data Explorer using the steps below.
>

Navigate to [Azure Data Explorer](https://dataexplorer.azure.com/).

1. Click on the gear icon next to your user account name in the upper right-hand corner.
1. Select the **Connection** setting section.
   * Set **Server parser** to **V1** from the dropdown options.

     ![ADX use V1 query schema](media/adx-settings-v1.png)

### Game Manager permissions for Insights

You need to assign your account a [user role](../../../gamemanager/playfab-user-roles.md) with the following Game Manager permissions enabled:

* Admin status.
* Access to the Explorer tab and associated data.
* Read and write access to Analytics data.

You can either create a new user role or add these permissions to an existing role.

## Connect with Azure Data Explorer (ADX)

To connect with Azure Data Explorer:

1. Open [Azure Data Explorer](https://dataexplorer.azure.com/). Select **Add Cluster**.

   ![ADX Add connection](media/adx-add-cluster-button.png)

2. Enter the PlayFab API endpoint, which is `https://insights.playfab.com`.

3. Select **Add**. Now you can execute queries or commands on the database.

## Additional resources

* [Azure Data Explorer documentation](/azure/data-explorer/)
* To learn about other tools to connect to Insights, see [Connecting external tools to Insights](index.md)
