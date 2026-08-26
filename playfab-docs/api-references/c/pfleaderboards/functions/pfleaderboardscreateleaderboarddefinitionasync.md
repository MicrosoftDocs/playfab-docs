---
author: jasonsandlin
title: "PFLeaderboardsCreateLeaderboardDefinitionAsync"
description: "Creates a new leaderboard definition."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsCreateLeaderboardDefinitionAsync  

Creates a new leaderboard definition.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsCreateLeaderboardDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsCreateLeaderboardDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsCreateLeaderboardDefinitionRequest*](../../pfleaderboardstypes/structs/pfleaderboardscreateleaderboarddefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardDeleteLeaderboardDefinitionAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_API_NOT_ENABLED_FOR_TITLE, E_PF_DUPLICATE_COLUMN_NAME_FOUND, E_PF_DUPLICATE_LINKED_STATISTIC_COLUMN_NAME_FOUND, E_PF_ENTITY_TYPE_MISMATCH_WITH_STAT_DEFINITION, E_PF_EXTERNAL_ENTITY_NOT_ALLOWED_FOR_TIER, E_PF_INVALID_BASE_TIME_FOR_INTERVAL, E_PF_LEADERBOARD_COUNT_LIMIT_EXCEEDED, E_PF_LEADERBOARD_NAME_CONFLICT, E_PF_LEADERBOARD_SIZE_LIMIT_EXCEEDED, E_PF_LINKED_STATISTIC_COLUMN_MISMATCH, E_PF_LINKED_STATISTIC_COLUMN_NOT_FOUND, E_PF_LINKED_STATISTIC_COLUMN_REQUIRED, E_PF_LINKING_STATS_NOT_ALLOWED_FOR_ENTITY_TYPE, E_PF_MAX_QUERYABLE_VERSIONS_EXCEEDED, E_PF_MAX_QUERYABLE_VERSIONS_VALUE_NOT_ALLOWED_FOR_TIER, E_PF_MULTIPLE_LINKED_STATISTICS_NOT_ALLOWED, E_PF_PLAY_FAB_ERROR_EVENT_NOT_SUPPORTED_FOR_ENTITY_TYPE, E_PF_STAT_DEFINITION_ALREADY_LINKED_TO_LEADERBOARD, E_PF_STATISTIC_NOT_FOUND, E_PF_VERSION_CONFIGURATION_IS_REQUIRED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
