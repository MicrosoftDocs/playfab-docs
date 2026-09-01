---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardAroundEntityAsync"
description: "Get the leaderboard around a specific entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardAroundEntityAsync  

Get the leaderboard around a specific entity.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetLeaderboardAroundEntityAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsGetLeaderboardAroundEntityRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsGetLeaderboardAroundEntityRequest*](../../pfleaderboardstypes/structs/pfleaderboardsgetleaderboardaroundentityrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFLeaderboardsGetLeaderboardAroundEntityGetResultSize](pfleaderboardsgetleaderboardaroundentitygetresultsize.md) and [PFLeaderboardsGetLeaderboardAroundEntityGetResult](pfleaderboardsgetleaderboardaroundentitygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
