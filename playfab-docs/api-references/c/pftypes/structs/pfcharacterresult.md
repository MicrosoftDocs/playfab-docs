---
author: jasonsandlin
title: "PFCharacterResult"
description: "PFCharacterResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCharacterResult  

PFCharacterResult data model.  

## Syntax  
  
```cpp
typedef struct PFCharacterResult {  
    const char* characterId;  
    const char* characterName;  
    const char* characterType;  
} PFCharacterResult;  
```
  
### Members  
  
**`characterId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id for this character on this player.
  
**`characterName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of this character.
  
**`characterType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The type-string that was given to this character on creation.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
