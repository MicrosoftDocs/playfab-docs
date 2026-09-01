---
author: jasonsandlin
title: "PFLeaderboardsCreateLeaderboardDefinitionRequest"
description: "PFLeaderboardsCreateLeaderboardDefinitionRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsCreateLeaderboardDefinitionRequest  

PFLeaderboardsCreateLeaderboardDefinitionRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsCreateLeaderboardDefinitionRequest {  
    PFLeaderboardsLeaderboardColumn const* columns;  
    uint32_t columnsCount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* entityType;  
    PFLeaderboardsLeaderboardEventEmissionConfig const* eventEmissionConfig;  
    const char* name;  
    int32_t sizeLimit;  
    PFVersionConfiguration const* versionConfiguration;  
} PFLeaderboardsCreateLeaderboardDefinitionRequest;  
```
  
### Members  
  
**`columns`** &nbsp; [PFLeaderboardsLeaderboardColumn](pfleaderboardsleaderboardcolumn.md) const*  
  
Leaderboard columns describing the sort directions, cannot be changed after creation. A maximum of 5 columns are allowed.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entityType`** &nbsp; const char*  
*is null-terminated*  
  
The entity type being represented on the leaderboard. If it doesn't correspond to the PlayFab entity types, use 'external' as the type.
  
**`eventEmissionConfig`** &nbsp; [PFLeaderboardsLeaderboardEventEmissionConfig](pfleaderboardsleaderboardeventemissionconfig.md) const*  
*may be nullptr*  
  
(Optional) [In Preview]: The configuration for the events emitted by this leaderboard. If not specified, no events will be emitted.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
A name for the leaderboard, unique per title.
  
**`sizeLimit`** &nbsp; int32_t  
  
Maximum number of entries on this leaderboard.
  
**`versionConfiguration`** &nbsp; PFVersionConfiguration const*  
*may be nullptr*  
  
(Optional) The version reset configuration for the leaderboard definition.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
