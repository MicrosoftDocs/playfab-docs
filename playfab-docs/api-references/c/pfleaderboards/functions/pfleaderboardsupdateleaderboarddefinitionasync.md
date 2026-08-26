---
author: jasonsandlin
title: "PFLeaderboardsUpdateLeaderboardDefinitionAsync"
description: "Updates a leaderboard definition."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsUpdateLeaderboardDefinitionAsync  

Updates a leaderboard definition.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsUpdateLeaderboardDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsUpdateLeaderboardDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsUpdateLeaderboardDefinitionRequest*](../../pfleaderboardstypes/structs/pfleaderboardsupdateleaderboarddefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also LeaderboardDeleteLeaderboardDefinitionAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_LEADERBOARD_SIZE_LIMIT_EXCEEDED, E_PF_MAX_QUERYABLE_VERSIONS_EXCEEDED, E_PF_MAX_QUERYABLE_VERSIONS_VALUE_NOT_ALLOWED_FOR_TIER, E_PF_PLAY_FAB_ERROR_EVENT_NOT_SUPPORTED_FOR_ENTITY_TYPE, E_PF_RESET_INTERVAL_CANNOT_BE_MODIFIED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
