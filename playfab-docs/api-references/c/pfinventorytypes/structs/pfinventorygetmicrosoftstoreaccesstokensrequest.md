---
author: jasonsandlin
title: "PFInventoryGetMicrosoftStoreAccessTokensRequest"
description: "PFInventoryGetMicrosoftStoreAccessTokensRequest data model. Gets the access tokens for Microsoft Store authentication."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryGetMicrosoftStoreAccessTokensRequest  

PFInventoryGetMicrosoftStoreAccessTokensRequest data model. Gets the access tokens for Microsoft Store authentication.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetMicrosoftStoreAccessTokensRequest {  
    uint32_t customTagsCount;  
} PFInventoryGetMicrosoftStoreAccessTokensRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
