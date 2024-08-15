---
author: jasonsandlin
title: "PFSegmentsServerGetPlayersInSegmentGetResult"
description: "Gets the result of a successful PFSegmentsServerGetPlayersInSegmentAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsServerGetPlayersInSegmentGetResult  

Gets the result of a successful PFSegmentsServerGetPlayersInSegmentAsync call.  

## Syntax  
  
```cpp
HRESULT PFSegmentsServerGetPlayersInSegmentGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFSegmentsGetPlayersInSegmentResult** result,  
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
  
**`result`** &nbsp; [PFSegmentsGetPlayersInSegmentResult**](../../pfsegmentstypes/structs/pfsegmentsgetplayersinsegmentresult.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_EXPIRED_CONTINUATION_TOKEN, E_PF_GET_PLAYERS_IN_SEGMENT_RATE_LIMIT_EXCEEDED, E_PF_INTERNAL_SERVER_ERROR, E_PF_INVALID_CONTINUATION_TOKEN, E_PF_INVALID_SEARCH_TERM, E_PF_INVALID_SEGMENT, E_PF_SEGMENT_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
