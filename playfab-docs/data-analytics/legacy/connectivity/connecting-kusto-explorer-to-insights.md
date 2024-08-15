---
title: Connecting Kusto Explorer to Insights
author: natashaorie
description: Guide to connecting Kusto Explorer to Insights. 
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Kusto Explorer to Insights

This guide helps you get started using Kusto Explorer along with Insights. After connecting, you can use Kusto Explorer to query and explore your game data. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

## Prerequisites

### PlayFab account authenticated with AAD

You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. For instructions on creating an AAD-authenticated account or user, see [Azure Active Directory Authentication for Game Manager](../../../features/authentication/aad-authentication/index.md).

Verify that the account or user is set to use the Microsoft authentication provider.

* Navigate to [developer.playfab.com](https://developer.playfab.com).
* Select **Sign in with Microsoft** to access your PlayFab account.

If you can sign in, then the account is set to use the Microsoft authentication provider.

### Game Manager permissions for Insights

You need to assign your account a [user role](/gaming/playfab/gamemanager/playfab-user-roles) with the following Game Manager permissions enabled.

* Admin status.
* Access to the Explorer tab and associated data.
* Read and write access to Analytics data.

You can either create a new user role or add these permissions to an existing role.

### Other prerequisites

* [Kusto.Explorer](/azure/data-explorer/kusto/tools/kusto-explorer)

> [!IMPORTANT]
> Insights only supports the V1 query response schema. You can update the response schema in Kusto Explorer using the steps below.
>

On your local machine, open Kusto.Explorer.

1. Select the **Tools** tab, then select **Options...**
1. Under the **Connections** category, change the following two properties.
   * Set **Query results protocol** to **V1** from the dropdown options.
   * Set **KQL Parser version** to **V1** from the dropdown options.

   ![Kusto.Explorer use V1 query schema](media/kusto-explorer-settings-v1.png)
## Connect with Kusto Explorer

On your local machine, open Kusto.Explorer.

1. Add a connection. You can do this in two different ways:
   * Select the **Connections** tab, then select **Add connection**.
   * Right-click on the **Connections** folder in the left navigation panel, then select **Add connection**.

2. In the **Add connection** dialog box:
   * Under **Cluster connection** enter the PlayFab API endpoint, which is **https://insights.playfab.com**.
   * Under **Security**, make sure **AAD Federated** is selected.
   * Expand the **Advanced: Connection String** box and change the value of **Initial Catalog** from **NetDefaultDB** to `<titleID>`. Note that `<titleID>` must be all uppercase here. In the example below, this change is highlighted in the string.
  
   ![Kusto.Explorer add connection](media/kusto-explorer.png)

3. Select **OK**. Now, you should now be able to visualize the results of the query.

## Additional resources

* [Kusto Explorer documentation](/azure/kusto/tools/kusto-explorer)
* [Connecting external tools to Insights](index.md)
