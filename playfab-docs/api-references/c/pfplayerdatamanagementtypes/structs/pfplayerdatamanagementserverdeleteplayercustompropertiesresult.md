---
author: jasonsandlin
title: "PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult"
description: "PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult  

PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult {  
    PFPlayerDataManagementDeletedPropertyDetails const* deletedProperties;  
    uint32_t deletedPropertiesCount;  
    const char* playFabId;  
    int32_t propertiesVersion;  
} PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult;  
```
  
### Members  
  
**`deletedProperties`** &nbsp; [PFPlayerDataManagementDeletedPropertyDetails](pfplayerdatamanagementdeletedpropertydetails.md) const*  
*may be nullptr*  
  
(Optional) The list of properties requested to be deleted.
  
**`deletedPropertiesCount`** &nbsp; uint32_t  
  
Count of deletedProperties
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab unique identifier of the user whose properties were deleted.
  
**`propertiesVersion`** &nbsp; int32_t  
  
Indicates the current version of a player's properties that have been set. This is incremented after updates and deletes. This version can be provided in update and delete calls for concurrency control.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
