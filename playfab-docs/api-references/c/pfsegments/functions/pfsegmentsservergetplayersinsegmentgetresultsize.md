---
author: jasonsandlin
title: "PFSegmentsServerGetPlayersInSegmentGetResultSize"
description: "Get the size in bytes needed to store the result of a ServerGetPlayersInSegment call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsServerGetPlayersInSegmentGetResultSize  

Get the size in bytes needed to store the result of a ServerGetPlayersInSegment call.  

## Syntax  
  
```cpp
HRESULT PFSegmentsServerGetPlayersInSegmentGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_EXPIRED_CONTINUATION_TOKEN, E_PF_GET_PLAYERS_IN_SEGMENT_RATE_LIMIT_EXCEEDED, E_PF_INTERNAL_SERVER_ERROR, E_PF_INVALID_CONTINUATION_TOKEN, E_PF_INVALID_SEARCH_TERM, E_PF_INVALID_SEGMENT, E_PF_SEGMENT_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
