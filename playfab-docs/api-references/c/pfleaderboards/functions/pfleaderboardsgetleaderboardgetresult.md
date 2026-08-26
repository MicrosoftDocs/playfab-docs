---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardGetResult"
description: "Gets the result of a successful PFLeaderboardsGetLeaderboardAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardGetResult  

Gets the result of a successful PFLeaderboardsGetLeaderboardAsync call.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsGetLeaderboardGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFLeaderboardsGetEntityLeaderboardResponse** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the result value and its fields.  
  
**`result`** &nbsp; [PFLeaderboardsGetEntityLeaderboardResponse**](../../pfleaderboardstypes/structs/pfleaderboardsgetentityleaderboardresponse.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_LEADERBOARD_NOT_FOUND, E_PF_NO_LEADERBOARD_FOR_STATISTIC, E_PF_SPECIFIED_VERSION_LEADERBOARD_NOT_FOUND, E_PF_STATISTIC_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
