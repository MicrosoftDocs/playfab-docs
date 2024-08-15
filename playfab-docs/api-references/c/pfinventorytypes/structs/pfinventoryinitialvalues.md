---
author: jasonsandlin
title: "PFInventoryInitialValues"
description: "PFInventoryInitialValues data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryInitialValues  

PFInventoryInitialValues data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryInitialValues {  
    PFJsonObject displayProperties;  
} PFInventoryInitialValues;  
```
  
### Members  
  
**`displayProperties`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Game specific properties for display purposes. The Display Properties field has a 1000 byte limit.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
