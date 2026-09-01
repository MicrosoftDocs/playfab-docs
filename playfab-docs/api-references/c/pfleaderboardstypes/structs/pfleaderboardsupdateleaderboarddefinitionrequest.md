---
author: jasonsandlin
title: "PFLeaderboardsUpdateLeaderboardDefinitionRequest"
description: "PFLeaderboardsUpdateLeaderboardDefinitionRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsUpdateLeaderboardDefinitionRequest  

PFLeaderboardsUpdateLeaderboardDefinitionRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsUpdateLeaderboardDefinitionRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFLeaderboardsLeaderboardEventEmissionConfig const* eventEmissionConfig;  
    const char* name;  
    int32_t const* sizeLimit;  
    PFVersionConfiguration const* versionConfiguration;  
} PFLeaderboardsUpdateLeaderboardDefinitionRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`eventEmissionConfig`** &nbsp; [PFLeaderboardsLeaderboardEventEmissionConfig](pfleaderboardsleaderboardeventemissionconfig.md) const*  
*may be nullptr*  
  
(Optional) [In Preview]: The configuration for the events emitted by this leaderboard. If not specified, no events will be emitted.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of the leaderboard to update the definition for.
  
**`sizeLimit`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Maximum number of entries on this leaderboard.
  
**`versionConfiguration`** &nbsp; PFVersionConfiguration const*  
*may be nullptr*  
  
(Optional) The version reset configuration for the leaderboard definition.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
