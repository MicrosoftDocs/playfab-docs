---
author: jasonsandlin
title: "PFLeaderboardsGetFriendLeaderboardForEntityAsync"
description: "Get the friend leaderboard for the specified entity. A maximum of 25 friend entries are listed in the leaderboard."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetFriendLeaderboardForEntityAsync  

Get the friend leaderboard for the specified entity. A maximum of 25 friend entries are listed in the leaderboard.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetFriendLeaderboardForEntityAsync(  
    PFEntityHandle entityHandle,  
    const PFLeaderboardsGetFriendLeaderboardForEntityRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLeaderboardsGetFriendLeaderboardForEntityRequest*](../../pfleaderboardstypes/structs/pfleaderboardsgetfriendleaderboardforentityrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFLeaderboardsGetFriendLeaderboardForEntityGetResultSize](pfleaderboardsgetfriendleaderboardforentitygetresultsize.md) and [PFLeaderboardsGetFriendLeaderboardForEntityGetResult](pfleaderboardsgetfriendleaderboardforentitygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
