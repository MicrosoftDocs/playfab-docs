---
author: jasonsandlin
title: "PFInventoryAlternateId"
description: "PFInventoryAlternateId data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryAlternateId  

PFInventoryAlternateId data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryAlternateId {  
    const char* type;  
    const char* value;  
} PFInventoryAlternateId;  
```
  
### Members  
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Type of the alternate ID.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Value of the alternate ID.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
