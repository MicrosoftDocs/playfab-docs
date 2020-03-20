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

This guide helps you get started using Kusto Explorer along with Insights. To learn more about other tools you can connect Insights with, go to the [connectivity guide](index.md).

## Prerequisites
* A PlayFab user account authenticated with [AAD (Azure Active Directory)](https://docs.microsoft.com/gaming/playfab/features/authentication/aad-authentication/).
* The following [Game Manager permissions](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#assigning-roles) enabled for your user:
    *  Admin status.
    *  Access to the Explorer tab and associated data.
    *  Read and write access to Analytics data.

## Connect with Kusto Explorer
Open [Kusto.Explorer](https://docs.microsoft.com/azure/kusto/tools/kusto-explorer). 
1. First, add a connection. You can do this in two different ways:
   * Select the **Connections** tab, then select **Add connection**.
   * Right-click on the **Connections** folder in the left navigation panel, then select **Add connection**.

2. In the **Add connection** dialog box take the following steps:
   * Under **Cluster connection** enter your API endpoint, which follows the format `https://<titleid>.playfabapi.com`. 
   * Under **Security**, make sure **AAD Federated** is selected. 
   * Expand the **Advanced: Connection String** box and change the value of **Initial Catalog** from `NetDefaultDB` to `<titleID>`. Note that `<titleID>` must be all uppercase here. In the example below, this change is highlighted in the string. 
  
   ![Kusto.Explorer add connection](media/kusto-explorer.png)

3. Select **OK**, and you should now be able to visualize the results of the query.

## Additional resources

* Kusto Explorer [documentation](https://docs.microsoft.com/azure/kusto/tools/kusto-explorer).
* Connect [more tools](index.md) to Insights.