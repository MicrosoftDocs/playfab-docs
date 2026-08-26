---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardAsync"
description: "Get the leaderboard for a specific entity type and statistic."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardAsync  

Get the leaderboard for a specific entity type and statistic.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetLeaderboardAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsGetEntityLeaderboardRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsGetEntityLeaderboardRequest*](../../pfleaderboardstypes/structs/pfleaderboardsgetentityleaderboardrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFLeaderboardsGetLeaderboardGetResultSize](pfleaderboardsgetleaderboardgetresultsize.md) and [PFLeaderboardsGetLeaderboardGetResult](pfleaderboardsgetleaderboardgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
