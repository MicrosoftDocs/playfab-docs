---
author: jasonsandlin
title: "PFPlayerDataManagementDeletedPropertyDetails"
description: "PFPlayerDataManagementDeletedPropertyDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementDeletedPropertyDetails  

PFPlayerDataManagementDeletedPropertyDetails data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementDeletedPropertyDetails {  
    const char* name;  
    bool wasDeleted;  
} PFPlayerDataManagementDeletedPropertyDetails;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the property which was requested to be deleted.
  
**`wasDeleted`** &nbsp; bool  
  
Indicates whether or not the property was deleted. If false, no property with that name existed.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
