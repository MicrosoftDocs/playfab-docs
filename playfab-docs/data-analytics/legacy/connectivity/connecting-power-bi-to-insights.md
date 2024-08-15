---
title: Connecting Power BI to Insights
author: natashaorie
description: Guide to connecting Power BI with Insights. 
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Power BI to Insights

This guide helps you get started using Power BI along with Insights. After connecting, you can use Power BI to create visualizations of your game data and more. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

## Prerequisites

### PlayFab account authenticated with AAD

You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../../features/authentication/aad-authentication/index.md) for instructions on creating an AAD-authenticated account or user.

To verify that the account, or user, is set to use the Microsoft authentication provider:

* Navigate to [developer.playfab.com](https://developer.playfab.com).
* Select **Sign in with Microsoft** to access your PlayFab account.

If you can sign in, then the account is set to use the Microsoft authentication provider.

### Game Manager permissions for Insights

You need to assign your account a [user role](../../../gamemanager/playfab-user-roles.md) with the following Game Manager permissions enabled:

* Admin status.
* Access to the Explorer tab and associated data.
* Read and write access to Analytics data.

You can either create a new user role or add these permissions to an existing role.

### Other prerequisites

* [Power BI Desktop](https://powerbi.microsoft.com/desktop/)

  > [!NOTE]
  > Power BI Desktop is required. This scenario is not supported in the Power BI Web Portal.

## Connect with Power BI

On your local machine, open Power BI.

1. In the **Power BI Desktop** window, select **Get Data** > **Azure Data Explorer (Kusto)**.

2. In the **Azure Data Explorer (Kusto)** dialog box take the following steps:

   * Under **Cluster** enter the PlayFab API endpoint, which is `https://insights.playfab.com`.
   * Under **Database** enter your title ID in all uppercase, as Database names are case sensitive.
   * Scroll down, and under **Data Connectivity mode** select **DirectQuery**.

   Optionally, enter a table or query. You can set limits for max records or max size. If your query exceeds these limits, it returns a `PartialQueryFailure` error and a message stating that you exceeded the limits.

   The following example specifies a query on the table `events.all` that returns events occurring in the last seven days.

   ![Power BI Setup](media/powerBI.png)
   ![Power BI Setup Extended](media/powerBI-2.png)

3. Select **OK**. You can now execute queries and commands on the database.

## Additional resources

* [Power BI documentation](/power-bi/)
* To learn about other tools to connect to Insights, see [Connecting external tools to Insights](index.md)
