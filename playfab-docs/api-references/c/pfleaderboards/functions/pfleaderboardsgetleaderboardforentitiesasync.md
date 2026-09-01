---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardForEntitiesAsync"
description: "Get the leaderboard limited to a set of entities."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardForEntitiesAsync  

Get the leaderboard limited to a set of entities.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetLeaderboardForEntitiesAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsGetLeaderboardForEntitiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsGetLeaderboardForEntitiesRequest*](../../pfleaderboardstypes/structs/pfleaderboardsgetleaderboardforentitiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. When the asynchronous task is complete, call [PFLeaderboardsGetLeaderboardForEntitiesGetResultSize](pfleaderboardsgetleaderboardforentitiesgetresultsize.md) and [PFLeaderboardsGetLeaderboardForEntitiesGetResult](pfleaderboardsgetleaderboardforentitiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
