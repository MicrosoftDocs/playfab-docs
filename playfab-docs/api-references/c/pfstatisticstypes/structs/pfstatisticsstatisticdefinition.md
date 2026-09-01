---
author: jasonsandlin
title: "PFStatisticsStatisticDefinition"
description: "PFStatisticsStatisticDefinition data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsStatisticDefinition  

PFStatisticsStatisticDefinition data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsStatisticDefinition {  
    const char* const* aggregationDestinations;  
    uint32_t aggregationDestinationsCount;  
    const char* const* aggregationSources;  
    uint32_t aggregationSourcesCount;  
    PFStatisticsStatisticColumn const* columns;  
    uint32_t columnsCount;  
    time_t created;  
    const char* entityType;  
    PFStatisticsStatisticsEventEmissionConfig const* eventEmissionConfig;  
    time_t const* lastResetTime;  
    const char* const* linkedLeaderboardNames;  
    uint32_t linkedLeaderboardNamesCount;  
    const char* name;  
    uint32_t version;  
    PFVersionConfiguration const* versionConfiguration;  
} PFStatisticsStatisticDefinition;  
```
  
### Members  
  
**`aggregationDestinations`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of statistic definitions names this definition aggregates to. .
  
**`aggregationDestinationsCount`** &nbsp; uint32_t  
  
Count of aggregationDestinations
  
**`aggregationSources`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of statistic definitions names whose values must be aggregated towards this stat. If AggregationSource is specified, the entityType of this definition MUST be Title (making it a CommunityStat). Currently, only one aggregation source can be specified.
  
**`aggregationSourcesCount`** &nbsp; uint32_t  
  
Count of aggregationSources
  
**`columns`** &nbsp; [PFStatisticsStatisticColumn](pfstatisticsstatisticcolumn.md) const*  
*may be nullptr*  
  
(Optional) The columns for the statistic defining the aggregation method for each column.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
**`created`** &nbsp; time_t  
  
Created time, in UTC.
  
**`entityType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The entity type that can have this statistic.
  
**`eventEmissionConfig`** &nbsp; [PFStatisticsStatisticsEventEmissionConfig](pfstatisticsstatisticseventemissionconfig.md) const*  
*may be nullptr*  
  
(Optional) [In Preview]: Configurations for different Statistics events that can be emitted by the service.
  
**`lastResetTime`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Last time, in UTC, statistic version was incremented.
  
**`linkedLeaderboardNames`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of leaderboards that are linked to this statistic definition.
  
**`linkedLeaderboardNamesCount`** &nbsp; uint32_t  
  
Count of linkedLeaderboardNames
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the statistic.
  
**`version`** &nbsp; uint32_t  
  
Statistic version.
  
**`versionConfiguration`** &nbsp; PFVersionConfiguration const*  
*may be nullptr*  
  
(Optional) The version reset configuration for the leaderboard definition.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
