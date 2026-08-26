---
author: jasonsandlin
title: "Services C API overview - PFStatistics.h"
description: "Services C API overview - PFStatistics.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# Services C API overview - PFStatistics.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFStatisticsCreateStatisticDefinitionAsync](functions/pfstatisticscreatestatisticdefinitionasync.md) | Create a new entity statistic definition. |  
| [PFStatisticsDeleteStatisticDefinitionAsync](functions/pfstatisticsdeletestatisticdefinitionasync.md) | Delete an entity statistic definition. Will delete all statistics on entity profiles and leaderboards. |  
| [PFStatisticsDeleteStatisticsAsync](functions/pfstatisticsdeletestatisticsasync.md) | Delete statistics on an entity profile. This will remove all rankings from associated leaderboards. |  
| [PFStatisticsDeleteStatisticsGetResult](functions/pfstatisticsdeletestatisticsgetresult.md) | Gets the result of a successful PFStatisticsDeleteStatisticsAsync call. |  
| [PFStatisticsDeleteStatisticsGetResultSize](functions/pfstatisticsdeletestatisticsgetresultsize.md) | Get the size in bytes needed to store the result of a DeleteStatistics call. |  
| [PFStatisticsGetStatisticDefinitionAsync](functions/pfstatisticsgetstatisticdefinitionasync.md) | Get current statistic definition information |  
| [PFStatisticsGetStatisticDefinitionGetResult](functions/pfstatisticsgetstatisticdefinitiongetresult.md) | Gets the result of a successful PFStatisticsGetStatisticDefinitionAsync call. |  
| [PFStatisticsGetStatisticDefinitionGetResultSize](functions/pfstatisticsgetstatisticdefinitiongetresultsize.md) | Get the size in bytes needed to store the result of a GetStatisticDefinition call. |  
| [PFStatisticsGetStatisticsAsync](functions/pfstatisticsgetstatisticsasync.md) | Gets statistics for the specified entity. |  
| [PFStatisticsGetStatisticsForEntitiesAsync](functions/pfstatisticsgetstatisticsforentitiesasync.md) | Gets statistics for the specified collection of entities. |  
| [PFStatisticsGetStatisticsForEntitiesGetResult](functions/pfstatisticsgetstatisticsforentitiesgetresult.md) | Gets the result of a successful PFStatisticsGetStatisticsForEntitiesAsync call. |  
| [PFStatisticsGetStatisticsForEntitiesGetResultSize](functions/pfstatisticsgetstatisticsforentitiesgetresultsize.md) | Get the size in bytes needed to store the result of a GetStatisticsForEntities call. |  
| [PFStatisticsGetStatisticsGetResult](functions/pfstatisticsgetstatisticsgetresult.md) | Gets the result of a successful PFStatisticsGetStatisticsAsync call. |  
| [PFStatisticsGetStatisticsGetResultSize](functions/pfstatisticsgetstatisticsgetresultsize.md) | Get the size in bytes needed to store the result of a GetStatistics call. |  
| [PFStatisticsIncrementStatisticVersionAsync](functions/pfstatisticsincrementstatisticversionasync.md) | Increment an entity statistic definition version. |  
| [PFStatisticsIncrementStatisticVersionGetResult](functions/pfstatisticsincrementstatisticversiongetresult.md) | Gets the result of a successful PFStatisticsIncrementStatisticVersionAsync call. |  
| [PFStatisticsListStatisticDefinitionsAsync](functions/pfstatisticsliststatisticdefinitionsasync.md) | Get all current statistic definitions information |  
| [PFStatisticsListStatisticDefinitionsGetResult](functions/pfstatisticsliststatisticdefinitionsgetresult.md) | Gets the result of a successful PFStatisticsListStatisticDefinitionsAsync call. |  
| [PFStatisticsListStatisticDefinitionsGetResultSize](functions/pfstatisticsliststatisticdefinitionsgetresultsize.md) | Get the size in bytes needed to store the result of a ListStatisticDefinitions call. |  
| [PFStatisticsUpdateStatisticDefinitionAsync](functions/pfstatisticsupdatestatisticdefinitionasync.md) | Update an existing entity statistic definition. |  
| [PFStatisticsUpdateStatisticsAsync](functions/pfstatisticsupdatestatisticsasync.md) | Update statistics on an entity profile. Depending on the statistic definition, this may result in entity being ranked on various leaderboards. |  
| [PFStatisticsUpdateStatisticsGetResult](functions/pfstatisticsupdatestatisticsgetresult.md) | Gets the result of a successful PFStatisticsUpdateStatisticsAsync call. |  
| [PFStatisticsUpdateStatisticsGetResultSize](functions/pfstatisticsupdatestatisticsgetresultsize.md) | Get the size in bytes needed to store the result of a UpdateStatistics call. |  
