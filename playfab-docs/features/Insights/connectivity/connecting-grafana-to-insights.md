---
title: Connecting Grafana to Insights
author: natashaorie
description: Guide to connecting Grafana to Insights.
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Grafana to Insights

This guide helps you get started using Grafana along with Insights. To learn more about other tools you can connect Insights with, go to the [connectivity guide](index.md).

## Prerequisites
* A PlayFab user account authenticated with [AAD (Azure Active Directory)](https://docs.microsoft.com/gaming/playfab/features/authentication/aad-authentication/).
* The following [Game Manager permissions](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#assigning-roles) enabled for your user:
    *  Admin status.
    *  Access to the Explorer tab and associated data.
    *  Read and write access to Analytics data.

## Create an Azure Active Directory (AAD) application and connect it to your title database

1. Follow the steps in this [guide](creating-AAD-app-for-insights.md) to create an Azure Active Directory (AAD) application and connect it to your title database.

## Get set up with Grafana
1. If you don't have a free Grafana account, [create one](https://grafana.com/login). You can either download Grafana to run on your computer or use the online hosted instance. 

2. Install the Azure Data Explorer [plugin](https://grafana.com/grafana/plugins/grafana-azure-data-explorer-datasource) for Grafana.

## Create a new data source in Grafana
Now that your title database is linked to an Azure app, you can use the app to connect with Grafana.

1. Log into Grafana.

   ![Grafana Login](media/grafana-login.png)

2. On the **Welcome to Grafana** page, select **Add data source**. 

   ![Grafana Welcome](media/grafana-welcome.png)

2. On the **Add Datasource** page, select the **Azure Data Explorer Datasource**. You can search for it with the searchbar or find it listed under the section **Others**. If you don't see the **Azure Data Explorer Datasource** option, you need to install the [plugin](https://grafana.com/grafana/plugins/grafana-azure-data-explorer-datasource).

   ![Grafana Add Datasource](media/grafana-add-datasource.png)

3. On the **Azure Data Explorer Datasource** configuration page, take the following steps:
   *  For **Cluster URL**, enter your API endpoint. This will follow the format `https://<titleID>.playfabapi.com`.
   *  Enter your **Tenant Id**, **Client Id**, and **Client secret** from your Azure Active Directory (AAD) application into their respective fields. 
   *  Select **Save & Test**. You should see a **Connection Successful** return message.
   *  For **Default Database**, select your Title ID or database name. This should automatically populate after you successfully save and test the datasource. If it doesn't show up after a successful connection, try exiting and re-opening the configuration page. 

   ![Grafana Datasource Configuration](media/grafana-datasource-configuration.png)

## Create a new Dashboard

1. Return to the Grafana homepage. Select **New dashboard**.

   ![Grafana New Dashboard](media/grafana-new-dashboard.png)

2. In the **New Panel** dialog box, select **Add Query**.

   ![Grafana New Panel](media/grafana-new-panel.png)

3. In the **Query** panel next to **Database** select your own database from the drop-down menu. In this example our database is named **Unicorn Battle**.
   
   ![Grafana New Query](media/grafana-new-query.png)

## Run Kusto queries and commands

Now you are going to use your newly-created Dashboard to run Kusto queries and commands on your database. 

1. In the **Query** panel next to **Format As**, select **Table** from the drop-down menu.

   ![Grafana Table Format](media/grafana-table-format.png)

2. Use the icons on the left to switch to the Visualization panel. Select the drop-down menu to the right of **Visualization**, then select the **Table** option.

   ![Grafana Table Visualization](media/grafana-table-visualization.png)

3. Return to the **Query** tab. Enter a query and select **Run**. You will see the results appear in the table above the **Query** tab. In this example, we ran the query `['events.all'] | limit 100`.

   ![Grafana Run Query](media/grafana-run-query.png)

   Running a Kusto command follows the same process. Simply enter your command in the **Query** tab and press **Run**. The results will be displayed above. In this example, we ran the command `.show tables`. 

   ![Grafana Run Command](media/grafana-run-command.png)

## Additional resources

* Grafana [documentation](https://grafana.com/docs/grafana/latest/).
* Connect [more tools](index.md) with Insights.