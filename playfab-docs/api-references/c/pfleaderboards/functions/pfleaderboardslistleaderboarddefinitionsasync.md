---
author: jasonsandlin
title: "PFLeaderboardsListLeaderboardDefinitionsAsync"
description: "Lists the leaderboard definitions defined for the Title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsListLeaderboardDefinitionsAsync  

Lists the leaderboard definitions defined for the Title.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsListLeaderboardDefinitionsAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsListLeaderboardDefinitionsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsListLeaderboardDefinitionsRequest*](../../pfleaderboardstypes/structs/pfleaderboardslistleaderboarddefinitionsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also LeaderboardDeleteLeaderboardDefinitionAsync. When the asynchronous task is complete, call [PFLeaderboardsListLeaderboardDefinitionsGetResultSize](pfleaderboardslistleaderboarddefinitionsgetresultsize.md) and [PFLeaderboardsListLeaderboardDefinitionsGetResult](pfleaderboardslistleaderboarddefinitionsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
