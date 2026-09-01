---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardDefinitionAsync"
description: "Gets the specified leaderboard definition."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardDefinitionAsync  

Gets the specified leaderboard definition.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetLeaderboardDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsGetLeaderboardDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsGetLeaderboardDefinitionRequest*](../../pfleaderboardstypes/structs/pfleaderboardsgetleaderboarddefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardDeleteLeaderboardDefinitionAsync. When the asynchronous task is complete, call [PFLeaderboardsGetLeaderboardDefinitionGetResultSize](pfleaderboardsgetleaderboarddefinitiongetresultsize.md) and [PFLeaderboardsGetLeaderboardDefinitionGetResult](pfleaderboardsgetleaderboarddefinitiongetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
