---
author: jasonsandlin
title: "PFInventoryInventoryItemReference"
description: "PFInventoryInventoryItemReference data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryInventoryItemReference  

PFInventoryInventoryItemReference data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryInventoryItemReference {  
    PFInventoryAlternateId const* alternateId;  
    const char* id;  
    const char* stackId;  
} PFInventoryInventoryItemReference;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFInventoryAlternateId](pfinventoryalternateid.md) const*  
*may be nullptr*  
  
(Optional) The inventory item alternate id the request applies to.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory item id the request applies to.
  
**`stackId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory stack id the request should redeem to. (Default="default").
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
