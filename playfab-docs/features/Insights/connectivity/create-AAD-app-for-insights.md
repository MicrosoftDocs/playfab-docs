---
title: Creating an AAD app and connecting it to title database
author: natashaorie
description: Creating an AAD app and connecting it to title database
ms.author: norie
ms.date: 02/27/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Create an Azure Active Directory (AAD) Application to use with Insights

This tutorial covers a prerequisite for connecting Insights with following tools:
* Azure Data Factory (ADF)
* Grafana
* Python

## Create an Azure Active Directory (AAD) application

You are going to create a new AAD application to link to your title database. 

1. Log into the [Azure portal](https://portal.azure.com). If you don't have an Azure subscription, [create a free account](https://azure.microsoft.com).

2. After logging into the portal, use the search bar to find and select **App Registrations**. Then, select **New registration** in the upper left-hand corner.  

   ![ADF New Registrations](media/adf-new-registration.png)

3. In the **Register an application** window enter a name for your registration, then select which account types you would like this registration to support. (If you need help deciding, select the **Help me choose** link which will open a window with more information.)

   ![ADF Register App](media/adf-register-app.png)  

4. Select **Register**. You will be directed to a page with an overview of your newly-registered applcation. Save the **Application (client) ID** and **Directory (tenant) ID** somewhere (you will need these later).

5. In the navigation panel on the left-hand side select **Certificates & secrets** -> **New client secret**. 

   ![ADF Certificates & Secrets](media/adf-certificates-secrets.png)

6. Enter a description for the secret and select how long you would like it to be valid. 

   ![ADF Add Secret](media/adf-add-secret.png)

7. Select **Add**, and the new secret will appear below **Client secrets**. Now make sure to copy the secret key and save it somewhere secure. *It's essential that you do this now, since you won't be able to access the secret key once you leave this page.*

## Connect the AAD app to your title database

Now we will connect the Azure app to your title database. 

1. From the **Explorer** page in GameManager or in Kusto.Explorer, run the following command, replacing with your own Title ID and client/tenant ID:
   > `.add database <titleID> Admin ('aadapp=<app/client ID>;<tenant ID>') `

   `titleID` is case sensitive, so make sure it is in all caps.

   ![Explorer Add Database](media/explorer-add-database.png)

   You can verify that this command was successful by going to the **Users** page in [GameManager](https://developer.playfab.com/login). There should be an entry that matches the Client/Tenant ID.

   Note that this will make the Azure app an Admin on your game in PlayFab. If you would like the Azure app to have lesser permissions, assign the Azure app a [custom role](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#assigning-roles) in PlayFab that only has permissions for the Kusto database. The necessary permissions are:
   * **Explorer data & tab**.
   * **Analytics data read access**, to run queries and simple management commands.
   * **Analytics data write access**, to create/drop tables, alter retention policy, ingest data, purge.

   ![Connectivity Custom Role](media/connectivity-cutom-role.png)

   ## Next steps

   Now that you have created an Azure app and linked it to your title database, follow the steps to connect Insights with your tool of choice:
   *  [Connect with Azure Data Factory (ADF)](connecting-insights-to-azure-data-factory.md)
   * [Connect with Grafana](connecting-insights-with-grafana.md)
   * [Connect with Python](connecting-insights-with-python.md)