---
author: jasonsandlin
title: "PFInventoryAlternateId"
description: "PFInventoryAlternateId data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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

  
  
