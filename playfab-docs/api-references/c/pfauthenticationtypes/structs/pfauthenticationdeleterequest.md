---
author: jasonsandlin
title: "PFAuthenticationDeleteRequest"
description: "PFAuthenticationDeleteRequest data model. Delete a game_server entity. The caller can be the game_server entity attempting to delete itself. Or a title entity attempting to delete game_server entities for this title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationDeleteRequest  

PFAuthenticationDeleteRequest data model. Delete a game_server entity. The caller can be the game_server entity attempting to delete itself. Or a title entity attempting to delete game_server entities for this title.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationDeleteRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFAuthenticationDeleteRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; PFEntityKey const*  
  
The game_server entity to be removed.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
