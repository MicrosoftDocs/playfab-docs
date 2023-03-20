---
author: jasonsandlin
title: "PFSegmentsClientGetPlayerSegmentsAsync"
description: "List all segments that a player currently belongs to at this moment in time."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
PFTitlePlayerHandle to use for authentication.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFSegmentsClientGetPlayerSegmentsGetResult](pfsegmentsclientgetplayersegmentsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
