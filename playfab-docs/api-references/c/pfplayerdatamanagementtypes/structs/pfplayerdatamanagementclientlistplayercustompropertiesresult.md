---
author: jasonsandlin
title: "PFPlayerDataManagementClientListPlayerCustomPropertiesResult"
description: "PFPlayerDataManagementClientListPlayerCustomPropertiesResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientListPlayerCustomPropertiesResult  

PFPlayerDataManagementClientListPlayerCustomPropertiesResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientListPlayerCustomPropertiesResult {  
    PFPlayerDataManagementCustomPropertyDetails const* properties;  
    uint32_t propertiesCount;  
    int32_t propertiesVersion;  
} PFPlayerDataManagementClientListPlayerCustomPropertiesResult;  
```
  
### Members  
  
**`properties`** &nbsp; [PFPlayerDataManagementCustomPropertyDetails](pfplayerdatamanagementcustompropertydetails.md) const*  
*may be nullptr*  
  
(Optional) Player specific properties and their corresponding values for this title.
  
**`propertiesCount`** &nbsp; uint32_t  
  
Count of properties
  
**`propertiesVersion`** &nbsp; int32_t  
  
Indicates the current version of a player's properties that have been set. This is incremented after updates and deletes. This version can be provided in update and delete calls for concurrency control.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
