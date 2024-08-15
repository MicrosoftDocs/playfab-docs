---
author: jasonsandlin
title: "PFSegmentsServerGetPlayerSegmentsAsync"
description: "List all segments that a player currently belongs to at this moment in time."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsServerGetPlayerSegmentsAsync  

List all segments that a player currently belongs to at this moment in time.  

## Syntax  
  
```cpp
HRESULT PFSegmentsServerGetPlayerSegmentsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFSegmentsGetPlayersSegmentsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFSegmentsGetPlayersSegmentsRequest*](../../pfsegmentstypes/structs/pfsegmentsgetplayerssegmentsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerGetAllSegmentsAsync. When the asynchronous task is complete, call [PFSegmentsServerGetPlayerSegmentsGetResultSize](pfsegmentsservergetplayersegmentsgetresultsize.md) and [PFSegmentsServerGetPlayerSegmentsGetResult](pfsegmentsservergetplayersegmentsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
