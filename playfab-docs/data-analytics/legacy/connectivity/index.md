---
title: Connecting external tools with Insights
author: natashaorie
description: Guide to connecting external tools with Insights. 
ms.author: norie
ms.date: 03/20/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Connecting external tools to Insights

PlayFab Insights offers an unprecedented look into your game's data and the trends created by your users. Part of Insights' power is the flexibility to be paired with many other data and analytics tools. This section contains tutorials that show you how to connect Insights to other tools.

Currently, you can connect the following external tools to Insights: 
  - [Connect to Power BI](#power-bi)
  - [Connect to Kusto Explorer](#kusto-explorer)
  - [Connect to Azure Data Explorer (ADX)](#azure-data-explorer-adx)
  - [Connect to Azure Data Factory (ADF)](#azure-data-factory-adf)
  - [Connect to Grafana](#grafana)
  - [Connect to Python](#python)
  - [Connect to Kusto C# SDK](#kusto-c-sdk)

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

> [!IMPORTANT]
> Insights only supports the V1 query response schema. For some tools, you may need to update your tool's settings to use the V1 parser and results protocol.
>
  
## Power BI
Pairing Power BI with Insights allows you to easily create visualizations of your game data. 

To get started, go to the tutorial [Connecting Power BI to Insights](connecting-power-bi-to-insights.md).

## Kusto Explorer

Kusto Explorer is a rich desktop application that allows you to explore your game data using Kusto query language.

To get started, go to the tutorial [Connecting Kusto Explorer to Insights](connecting-kusto-explorer-to-insights.md).

## Azure Data Explorer (ADX)

Azure Data Explorer is a scalable data exploration service that allows you to discover relevant insights into your game data using a SQL-like query language. 

To get started, go to the tutorial [Connecting Azure Data Explorer to Insights](connecting-azure-data-explorer-to-insights.md).

## Azure Data Factory (ADF)

Azure Data Factory is a managed cloud service and data integration service that allows you to create workflows for orchestrating data movement and transforming data at scale. You can supplement your game data with the proper context to extract meaningful insights. 

To get started, go to the tutorial [Connecting Azure Data Factory to Insights](connecting-azure-data-factory-to-insights.md).

## Grafana

Grafana is an open-source tool for running analytics and monitoring systems. It pulls data from Insights to maintain dashboards with a wide variety of visualization options.

To get started, go to the tutorial [Connecting Grafana to Insights](connecting-grafana-to-insights.md).

## Python

You have the option to connect Python to Insights and query your game data with it, including using the library from Jupyter Notebooks.

To get started, go to the tutorial [Connecting Python to Insights](connecting-python-to-insights.md).

## Kusto C# SDK

The Kusto C# SDK offers all the capabilities of Kusto, with the additional ability to query Insights from Azure functions. 

To get started, go to the tutorial [Connecting Kusto C# SDK to Insights](connecting-kusto-csharp-to-insights.md).