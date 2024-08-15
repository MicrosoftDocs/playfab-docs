---
author: jasonsandlin
title: "PFInventoryGetMicrosoftStoreAccessTokensRequest"
description: "PFInventoryGetMicrosoftStoreAccessTokensRequest data model. Gets the access tokens for Microsoft Store authentication."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetMicrosoftStoreAccessTokensRequest  

PFInventoryGetMicrosoftStoreAccessTokensRequest data model. Gets the access tokens for Microsoft Store authentication.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetMicrosoftStoreAccessTokensRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFInventoryGetMicrosoftStoreAccessTokensRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
