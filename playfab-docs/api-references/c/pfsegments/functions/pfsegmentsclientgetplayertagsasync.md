---
author: jasonsandlin
title: "PFSegmentsClientGetPlayerTagsAsync"
description: "Get all tags with a given Namespace (optional) from a player profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsClientGetPlayerTagsAsync  

Get all tags with a given Namespace (optional) from a player profile.  

## Syntax  
  
```cpp
HRESULT PFSegmentsClientGetPlayerTagsAsync(  
    PFEntityHandle entityHandle,  
    const PFSegmentsGetPlayerTagsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFSegmentsGetPlayerTagsRequest*](../../pfsegmentstypes/structs/pfsegmentsgetplayertagsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This API will return a list of canonical tags which includes both namespace and tag's name. If namespace is not provided, the result is a list of all canonical tags. TagName can be used for segmentation and Namespace is limited to 128 characters. When the asynchronous task is complete, call [PFSegmentsClientGetPlayerTagsGetResultSize](pfsegmentsclientgetplayertagsgetresultsize.md) and [PFSegmentsClientGetPlayerTagsGetResult](pfsegmentsclientgetplayertagsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
