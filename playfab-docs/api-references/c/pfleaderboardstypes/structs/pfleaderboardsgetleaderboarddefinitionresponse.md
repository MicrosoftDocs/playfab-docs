---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardDefinitionResponse"
description: "PFLeaderboardsGetLeaderboardDefinitionResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardDefinitionResponse  

PFLeaderboardsGetLeaderboardDefinitionResponse data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsGetLeaderboardDefinitionResponse {  
    PFLeaderboardsLeaderboardColumn const* columns;  
    uint32_t columnsCount;  
    time_t created;  
    const char* entityType;  
    PFLeaderboardsLeaderboardEventEmissionConfig const* eventEmissionConfig;  
    time_t const* lastResetTime;  
    const char* name;  
    int32_t sizeLimit;  
    uint32_t version;  
    PFVersionConfiguration const* versionConfiguration;  
} PFLeaderboardsGetLeaderboardDefinitionResponse;  
```
  
### Members  
  
**`columns`** &nbsp; [PFLeaderboardsLeaderboardColumn](pfleaderboardsleaderboardcolumn.md) const*  
  
Sort direction of the leaderboard columns, cannot be changed after creation.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
**`created`** &nbsp; time_t  
  
Created time, in UTC.
  
**`entityType`** &nbsp; const char*  
*is null-terminated*  
  
The entity type being represented on the leaderboard. If it doesn't correspond to the PlayFab entity types, use 'external' as the type.
  
**`eventEmissionConfig`** &nbsp; [PFLeaderboardsLeaderboardEventEmissionConfig](pfleaderboardsleaderboardeventemissionconfig.md) const*  
*may be nullptr*  
  
(Optional) [In Preview]: The configuration for the events emitted by this leaderboard. If not specified, no events will be emitted.
  
**`lastResetTime`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Last time, in UTC, leaderboard version was incremented.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
A name for the leaderboard, unique per title.
  
**`sizeLimit`** &nbsp; int32_t  
  
Maximum number of entries on this leaderboard.
  
**`version`** &nbsp; uint32_t  
  
Latest Leaderboard version.
  
**`versionConfiguration`** &nbsp; PFVersionConfiguration const*  
  
The version reset configuration for the leaderboard definition.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
