---
author: jasonsandlin
title: "PFLeaderboardsDeleteLeaderboardEntriesAsync"
description: "Deletes the specified entries from the given leaderboard."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsDeleteLeaderboardEntriesAsync  

Deletes the specified entries from the given leaderboard.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsDeleteLeaderboardEntriesAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsDeleteLeaderboardEntriesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsDeleteLeaderboardEntriesRequest*](../../pfleaderboardstypes/structs/pfleaderboardsdeleteleaderboardentriesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardUpdateLeaderboardEntriesAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_API_NOT_ENABLED_FOR_TITLE, E_PF_LEADERBOARD_NOT_FOUND, E_PF_LEADERBOARD_UPDATE_NOT_ALLOWED_WHILE_LINKED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
