---
author: jasonsandlin
title: "PFPlayerDataManagementUpdateProperty"
description: "PFPlayerDataManagementUpdateProperty data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementUpdateProperty  

PFPlayerDataManagementUpdateProperty data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementUpdateProperty {  
    const char* name;  
    PFJsonObject value;  
} PFPlayerDataManagementUpdateProperty;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the custom property. Can contain Unicode letters and digits. They are limited in size.
  
**`value`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
Value of the custom property. Limited to booleans, numbers, and strings.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
