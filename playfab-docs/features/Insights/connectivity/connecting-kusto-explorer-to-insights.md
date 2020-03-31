---
title: Connecting Kusto Explorer to Insights
author: natashaorie
description: Guide to connecting Kusto Explorer to Insights. 
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Kusto Explorer to Insights

This guide helps you get started using Kusto Explorer along with Insights. After connecting, you can use Kusto Explorer to query and explore your game data. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

## Prerequisites
* ### PlayFab account authenticated with AAD
   You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../authentication/aad-authentication/index.md) for instructions on creating an AAD-authenticated account or user. 
   
   To verify that the account, or user, is set to use the Microsoft authentication provider:
   * Visit the PlayFab [log in page](https://developer.playfab.com/login).
   * Use the the Sign in with Microsoft link to access your PlayFab account.
   
   If you can sign in, then the account is set to use the Microsoft authentication provider.

* ### Game Manager permissions for Insights
   You need to assign your account a [user role](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles) with the following Game Manager permissions enabled:
   * Admin status.
   * Access to the Explorer tab and associated data.
   * Read and write access to Analytics data.

   You can either create a new user role or add these permissions to an existing role.

* ### Other prerequisites
  * [Kusto.Explorer](https://docs.microsoft.com/azure/kusto/tools/kusto-explore)

## Connect with Kusto Explorer
On your local machine, open Kusto.Explorer.
1. Add a connection. You can do this in two different ways:
   * Select the **Connections** tab, then select **Add connection**.
   * Right-click on the **Connections** folder in the left navigation panel, then select **Add connection**.

2. In the **Add connection** dialog box:
   * Under **Cluster connection** enter the PlayFab API endpoint, which is `https://insights.playfab.com`. 
   * Under **Security**, make sure **AAD Federated** is selected. 
   * Expand the **Advanced: Connection String** box and change the value of **Initial Catalog** from `NetDefaultDB` to `<titleID>`. Note that `<titleID>` must be all uppercase here. In the example below, this change is highlighted in the string. 
  
   ![Kusto.Explorer add connection](media/kusto-explorer.png)

3. Select **OK**, and you should now be able to visualize the results of the query.

## Additional resources

* [Kusto Explorer documentation](https://docs.microsoft.com/azure/kusto/tools/kusto-explorer)
* To learn about other tools to connect to Insights, see [Connecting external tools to Insights](index.md)