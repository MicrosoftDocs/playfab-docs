---
author: jasonsandlin
title: "PFAccountManagementGetPlayerCombinedInfoResult"
description: "PFAccountManagementGetPlayerCombinedInfoResult data model. Returns whatever info is requested in the response for the user. If no user is explicitly requested this defaults to the authenticated user. If the user is the same as the requester, PII (like email address, facebook id) is returned if available. Otherwise, only public information is returned. All parameters default to false."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayerCombinedInfoResult  

PFAccountManagementGetPlayerCombinedInfoResult data model. Returns whatever info is requested in the response for the user. If no user is explicitly requested this defaults to the authenticated user. If the user is the same as the requester, PII (like email address, facebook id) is returned if available. Otherwise, only public information is returned. All parameters default to false.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayerCombinedInfoResult {  
    PFGetPlayerCombinedInfoResultPayload const* infoResultPayload;  
    const char* playFabId;  
} PFAccountManagementGetPlayerCombinedInfoResult;  
```
  
### Members  
  
**`infoResultPayload`** &nbsp; [PFGetPlayerCombinedInfoResultPayload](../../pftypes/structs/pfgetplayercombinedinforesultpayload.md) const*  
*may be nullptr*  
  
(Optional) Results for requested info.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
