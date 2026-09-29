---
author: jasonsandlin
title: "PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult"
description: "PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult  

PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult {  
    PFPlayerDataManagementDeletedPropertyDetails const* deletedProperties;  
    uint32_t deletedPropertiesCount;  
    int32_t propertiesVersion;  
} PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult;  
```
  
### Members  
  
**`deletedProperties`** &nbsp; [PFPlayerDataManagementDeletedPropertyDetails](pfplayerdatamanagementdeletedpropertydetails.md) const*  
*may be nullptr*  
  
(Optional) The list of properties requested to be deleted.
  
**`deletedPropertiesCount`** &nbsp; uint32_t  
  
Count of deletedProperties
  
**`propertiesVersion`** &nbsp; int32_t  
  
Indicates the current version of a player's properties that have been set. This is incremented after updates and deletes. This version can be provided in update and delete calls for concurrency control.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
