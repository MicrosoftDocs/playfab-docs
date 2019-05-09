---
title: Xbox Data Add On Quickstart
author: belmer831
description: Get started with Xbox Data Add On. 
ms.author: Brent.Elmer
ms.date: 04/24/2019
ms.topic: article
ms.prod: playfab
keywords: playfab. analytics, xbox data
ms.localizationpriority: low
---

# Xbox Data Add On Quickstart

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).
> 
> Note: This feature is currently only available to customers participating in the PlayFab Insights private preview. For information on the PlayFab Insights Private Preview, visit [PlayFab Insights quickstart](../data-warehouse/quickstart.md). 

The Xbox Data Add On provides transaction-level usage and purchase data from Microsoft's Xbox and Store to your PlayFab Insights database/cluster. From here, you can run direct queries against the data. It is designed to benefit any Xbox developer, whether or not they use the PlayFab SDK. 

#### Step 1 | Create a PlayFab Account

To onboard to the Xbox Data Add On, first sign up for a PlayFab account and create a title at [www.playfab.com](https://www.playfab.com). Follow the account creation flow to create a studio and at least one title you'd like to receive data for.

#### Step 2 | Request to the PlayFab Insights Private Preview

Email [pfgaminginsights@microsoft.com](mailto:pfgaminginsights@microsoft.com) to request access to both the Insights program and the Xbox Data Add On. Once onboarded, follow the instructions on the [Insights quickstart](../data-warehouse/quickstart.md) tutorial to set up your database and cluster from which you'll access the data. 

#### Step 3 | Map Your Product IDs

With the credentials used to publish your Xbox title, log in to your [Microsoft Partner Center](https://partner.microsoft.com) account. Navigate to the Dashboard:
 ![Image of all services menu item](../../media/feature-partner-center-dashboard.png)

From the dashboard, find each of the parent Product, Bundle, or Edition you want mapped:
 ![Image of all services menu item](../../media/feature-partner-center-productid.png)

Copy the Product ID using right-click, copy link, and paste into a document. Now copy the 12 digit Product ID and share the request in an email to [pfgaminginsights@microsoft.com](mailto:pfgaminginsights@microsoft.com). The mapping step is handled by a PlayFab team member.

#### Step 4 | Access the Data

Once a PlayFab team member has mapped your product IDs, processing your new title's data takes will take approximately eight hours. When the data is ready, visit www.PlayFab.com, sign in, select your mapped title, choose Analytics from the left-hand nav. Choose Insights (Preview) from the top nav. Click "Open in Azure Data Explorer." Once connected, find the following tables in your title's database:

1. Fact_Xbox_Purchase_ChargeBack
2. Fact_Xbox_Purchase_OrderCancellations
3. Fact_Xbox_Purchase_Orders
4. Fact_Xbox_Purcahse_Refunds
5. Fact_Xbox_Usage
