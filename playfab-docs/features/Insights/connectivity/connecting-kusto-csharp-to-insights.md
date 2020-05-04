---
title: Connecting Kusto C# SDK to Insights
author: natashaorie
description: Guide to connecting Azure Data Factory (ADF) to Insights.
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Azure Data Factory (ADF) to Insights

This guide helps you get started using Azure Data Factory (ADF) along with Insights. After connecting, you can use Azure Data Factory to create workflows for orchestrating data movement and transforming game data at scale. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

In this tutorial you learn how to:

> [!div class="checklist"]
> * Create a data factory in Azure
> * Create a pipeline

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
  *  [Create an Azure Active Directory (AAD) application and connect it to your title database](creating-AAD-app-for-insights.md)