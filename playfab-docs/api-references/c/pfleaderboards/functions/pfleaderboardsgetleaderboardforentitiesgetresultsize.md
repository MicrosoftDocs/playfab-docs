---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardForEntitiesGetResultSize"
description: "Get the size in bytes needed to store the result of a GetLeaderboardForEntities call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardForEntitiesGetResultSize  

Get the size in bytes needed to store the result of a GetLeaderboardForEntities call.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetLeaderboardForEntitiesGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_API_NOT_ENABLED_FOR_TITLE, E_PF_LEADERBOARD_NOT_FOUND, E_PF_NO_LEADERBOARD_FOR_STATISTIC, E_PF_SPECIFIED_VERSION_LEADERBOARD_NOT_FOUND, E_PF_STATISTIC_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
