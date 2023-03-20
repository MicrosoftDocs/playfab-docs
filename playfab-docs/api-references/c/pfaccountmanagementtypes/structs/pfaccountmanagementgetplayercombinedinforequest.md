---
author: jasonsandlin
title: "PFAccountManagementGetPlayerCombinedInfoRequest"
description: "PFAccountManagementGetPlayerCombinedInfoRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementGetPlayerCombinedInfoRequest  

PFAccountManagementGetPlayerCombinedInfoRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayerCombinedInfoRequest {  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playFabId;  
} PFAccountManagementGetPlayerCombinedInfoRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`infoRequestParameters`** &nbsp; [PFGetPlayerCombinedInfoRequestParams](../../pftypes/structs/pfgetplayercombinedinforequestparams.md) const*  
  
Flags for which pieces of info to return for the user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
PlayFabId of the user whose data will be returned. If not filled included, we return the data for the calling player. .
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
