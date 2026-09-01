---
author: jasonsandlin
title: "PFLeaderboardsUnlinkLeaderboardFromStatisticAsync"
description: "Unlinks a leaderboard definition from it's linked statistic definition."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsUnlinkLeaderboardFromStatisticAsync  

Unlinks a leaderboard definition from it's linked statistic definition.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsUnlinkLeaderboardFromStatisticAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsUnlinkLeaderboardFromStatisticRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsUnlinkLeaderboardFromStatisticRequest*](../../pfleaderboardstypes/structs/pfleaderboardsunlinkleaderboardfromstatisticrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardCreateLeaderboardDefinitionAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_LEADERBOARD_NOT_FOUND, E_PF_NO_LINKED_STATISTIC_TO_LEADERBOARD or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
