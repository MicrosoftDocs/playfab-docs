---
author: jasonsandlin
title: "PFCharacterInventory"
description: "PFCharacterInventory data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCharacterInventory  

PFCharacterInventory data model.  

## Syntax  
  
```cpp
typedef struct PFCharacterInventory {  
    const char* characterId;  
    PFItemInstance const* inventory;  
    uint32_t inventoryCount;  
} PFCharacterInventory;  
```
  
### Members  
  
**`characterId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of this character.
  
**`inventory`** &nbsp; [PFItemInstance](pfiteminstance.md) const*  
*may be nullptr*  
  
(Optional) The inventory of this character.
  
**`inventoryCount`** &nbsp; uint32_t  
  
Count of inventory
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
