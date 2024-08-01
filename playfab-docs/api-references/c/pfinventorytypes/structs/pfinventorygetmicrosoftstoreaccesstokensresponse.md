---
author: jasonsandlin
title: "PFInventoryGetMicrosoftStoreAccessTokensResponse"
description: "PFInventoryGetMicrosoftStoreAccessTokensResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetMicrosoftStoreAccessTokensResponse  

PFInventoryGetMicrosoftStoreAccessTokensResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetMicrosoftStoreAccessTokensResponse {  
    const char* collectionsAccessToken;  
    time_t collectionsAccessTokenExpirationDate;  
} PFInventoryGetMicrosoftStoreAccessTokensResponse;  
```
  
### Members  
  
**`collectionsAccessToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The collections access token for calling https://onestore.microsoft.com/b2b/keys/create/collections to obtain a CollectionsIdKey for the user.
  
**`collectionsAccessTokenExpirationDate`** &nbsp; time_t  
  
The date the collections access token expires.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
