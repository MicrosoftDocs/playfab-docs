---
author: jasonsandlin
title: "PFSegmentsServerAddPlayerTagAsync"
description: "Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsServerAddPlayerTagAsync  

Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.  

## Syntax  
  
```cpp
HRESULT PFSegmentsServerAddPlayerTagAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFSegmentsAddPlayerTagRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFSegmentsAddPlayerTagRequest*](../../pfsegmentstypes/structs/pfsegmentsaddplayertagrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API will trigger a player_tag_added event and add a tag with the given TagName and PlayFabID to the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. Also there is a limit on the number of tags a title can have. See also ServerGetPlayerTagsAsync, ServerRemovePlayerTagAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_PLAYER_TAG_COUNT_LIMIT_EXCEEDED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFSegments.h
  
## See also  
[PFSegments members](../pfsegments_members.md)  

  
  
