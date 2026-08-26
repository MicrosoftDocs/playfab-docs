---
author: jasonsandlin
title: "PFLeaderboardsIncrementLeaderboardVersionGetResult"
description: "Gets the result of a successful PFLeaderboardsIncrementLeaderboardVersionAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsIncrementLeaderboardVersionGetResult  

Gets the result of a successful PFLeaderboardsIncrementLeaderboardVersionAsync call.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsIncrementLeaderboardVersionGetResult(  
    XAsyncBlock* async,  
    PFLeaderboardsIncrementLeaderboardVersionResponse* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFLeaderboardsIncrementLeaderboardVersionResponse*](../../pfleaderboardstypes/structs/pfleaderboardsincrementleaderboardversionresponse.md)  
*output*  
  
PFLeaderboardsIncrementLeaderboardVersionResponse object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_CONCURRENT_EDIT_ERROR, E_PF_INVALID_VERSION_RESET_FOR_LINKED_LEADERBOARD, E_PF_LEADERBOARD_DEFINITION_MODIFICATION_NOT_ALLOWED_WHILE_LINKED, E_PF_LEADERBOARD_NOT_FOUND, E_PF_VERSION_INCREMENT_RATE_EXCEEDED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
