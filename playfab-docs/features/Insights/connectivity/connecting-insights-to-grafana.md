---
title: Connecting Insights to Grafana
author: natashaorie
description: Guide to connecting Inisghts to Grafana.
ms.author: norie
ms.date: 02/27/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Connecting Insights to Grafana

[comment]: < Replace links with relative links once placement of article is determined. >
This guide helps you get started using Insights along with Grafana To learn more about other tools you can connect Insights with, go [here](insights-connectivity.md).

## Prerequisites
* A PlayFab user account authenticated with [AAD (Azure Active Directory)](https://docs.microsoft.com/gaming/playfab/features/authentication/aad-authentication/).
* The following [Game Manager permissions](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#assigning-roles) enabled for your user:
    *  Admin status.
    *  Access to the Explorer tab and associated data.
    *  Read and write access to Analytics data.

## Get set up with Grafana
1. If you don't have a free Grafana account, create one [here](https://grafana.com/login). You can either download Grafana to run on your computer or use the online hosted instance. 

2. Install the Azure Data Explorer [plugin](https://grafana.com/grafana/plugins/grafana-azure-data-explorer-datasource) for Grafana.

## Create an Azure Active Directory (AAD) application

## Connect the AAD app to your title database

## Create a new data source in Grafana

## Create a new Dashboard

## Run Kusto queries and commands