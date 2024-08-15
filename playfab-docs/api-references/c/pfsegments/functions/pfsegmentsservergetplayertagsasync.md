---
author: jasonsandlin
title: "PFSegmentsServerGetPlayerTagsAsync"
description: "Get all tags with a given Namespace (optional) from a player profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsServerGetPlayerTagsAsync  

Get all tags with a given Namespace (optional) from a player profile.  

## Syntax  
  
```cpp
HRESULT PFSegmentsServerGetPlayerTagsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFSegmentsGetPlayerTagsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFSegmentsGetPlayerTagsRequest*](../../pfsegmentstypes/structs/pfsegmentsgetplayertagsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API will return a list of canonical tags which includes both namespace and tag's name. If namespace is not provided, the result is a list of all canonical tags. TagName can be used for segmentation and Namespace is limited to 128 characters. See also ServerAddPlayerTagAsync, ServerRemovePlayerTagAsync. When the asynchronous task is complete, call [PFSegmentsServerGetPlayerTagsGetResultSize](pfsegmentsservergetplayertagsgetresultsize.md) and [PFSegmentsServerGetPlayerTagsGetResult](pfsegmentsservergetplayertagsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
