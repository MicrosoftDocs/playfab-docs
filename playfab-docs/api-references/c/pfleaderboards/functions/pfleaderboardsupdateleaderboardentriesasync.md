---
author: jasonsandlin
title: "PFLeaderboardsUpdateLeaderboardEntriesAsync"
description: "Adds or updates entries on the specified leaderboard."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsUpdateLeaderboardEntriesAsync  

Adds or updates entries on the specified leaderboard.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsUpdateLeaderboardEntriesAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsUpdateLeaderboardEntriesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsUpdateLeaderboardEntriesRequest*](../../pfleaderboardstypes/structs/pfleaderboardsupdateleaderboardentriesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardDeleteLeaderboardEntriesAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_API_NOT_ENABLED_FOR_GAME_CLIENT_ACCESS, E_PF_LEADERBOARD_COLUMN_LENGTH_MISMATCH, E_PF_LEADERBOARD_NOT_FOUND, E_PF_LEADERBOARD_UPDATE_NOT_ALLOWED_WHILE_LINKED, E_PF_METADATA_LENGTH_EXCEEDED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
