---
title: Insights Export
author: mckmoffatt
description: Overview for PlayFab Insights Export
ms.author: mcelliot
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, archive
ms.localizationpriority: medium
---

# Exporting Data
Event Export is the primary mechanism for exporting data from your Insights data cluster without querying. Event Export can be reached under the data section of PlayFab Game Manager. The amount of distinct export commands you can run is tied to your performance level. 

![Insights Schedule](data-explorer/media/export-modified.png)

To create a new export:
1. Navigate to the Event Export page.
2. Select "New Event Export".
3. Fill out the required fields with your external storage account information.
4. There are several options for which data to export to choose from
   1. You may select the checkbox for all events, this will export all data.
   2. You may select one more more tables to export
   3. You may select to use a custom query to define the output of the export. **NOTE** Using a custom query for exporting all data will result in a slight addition of columns from the ETL process. **NOTE** When using custom query, the output must have a timestamp column named timestamp.
5. You can choose between once an hour and once a day for export frequency
6. You can choose to have your data partitioned into individual files for more efficient storage and loading

### Use Cases
1. Export all data to be ingested into a separate data system. Exporting all data allows for an efficient way to create files to save for cold storage or for ingestion into another data processesing system. While this is functional it is not the intended use case for Insights and Export. PlayFab Insights is excellent at data modification and tranformation, the second case is recommended over this case.
2. Export custom query data. Using a custom query allows you to select custom datasets for export. This is ideal for loading cleaned data models into machine learning systems like Spark and pandas (python), or into other data systems and visualization platforms that provide specialized use cases.

