---
author: jasonsandlin
title: "PFSegmentsClientGetPlayerSegmentsAsync"
description: "List all segments that a player currently belongs to at this moment in time."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFSegmentsClientGetPlayerSegmentsAsync  

List all segments that a player currently belongs to at this moment in time.  

## Syntax  
  
```cpp
HRESULT PFSegmentsClientGetPlayerSegmentsAsync(  
    PFEntityHandle entityHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
When the asynchronous task is complete, call [PFSegmentsClientGetPlayerSegmentsGetResultSize](pfsegmentsclientgetplayersegmentsgetresultsize.md) and [PFSegmentsClientGetPlayerSegmentsGetResult](pfsegmentsclientgetplayersegmentsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
