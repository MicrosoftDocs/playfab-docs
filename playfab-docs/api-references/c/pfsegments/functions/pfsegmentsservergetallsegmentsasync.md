---
author: jasonsandlin
title: "PFSegmentsServerGetAllSegmentsAsync"
description: "Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsServerGetAllSegmentsAsync  

Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.  

## Syntax  
  
```cpp
HRESULT PFSegmentsServerGetAllSegmentsAsync(  
    PFEntityHandle titleEntityHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Request has no paramaters. See also ServerGetPlayersInSegmentAsync. When the asynchronous task is complete, call [PFSegmentsServerGetAllSegmentsGetResultSize](pfsegmentsservergetallsegmentsgetresultsize.md) and [PFSegmentsServerGetAllSegmentsGetResult](pfsegmentsservergetallsegmentsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
