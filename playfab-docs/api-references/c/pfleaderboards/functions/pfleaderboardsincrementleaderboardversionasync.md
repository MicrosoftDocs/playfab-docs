---
author: jasonsandlin
title: "PFLeaderboardsIncrementLeaderboardVersionAsync"
description: "Increment a leaderboard version."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsIncrementLeaderboardVersionAsync  

Increment a leaderboard version.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsIncrementLeaderboardVersionAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsIncrementLeaderboardVersionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsIncrementLeaderboardVersionRequest*](../../pfleaderboardstypes/structs/pfleaderboardsincrementleaderboardversionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardCreateLeaderboardDefinitionAsync. When the asynchronous task is complete, call [PFLeaderboardsIncrementLeaderboardVersionGetResult](pfleaderboardsincrementleaderboardversiongetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
