---
author: jasonsandlin
title: "PFPlayerDataManagementCustomPropertyDetails"
description: "PFPlayerDataManagementCustomPropertyDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementCustomPropertyDetails  

PFPlayerDataManagementCustomPropertyDetails data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementCustomPropertyDetails {  
    const char* name;  
    PFJsonObject value;  
} PFPlayerDataManagementCustomPropertyDetails;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The custom property's name.
  
**`value`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) The custom property's value.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
