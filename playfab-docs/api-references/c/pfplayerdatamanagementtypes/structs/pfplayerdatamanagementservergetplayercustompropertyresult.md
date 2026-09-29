---
author: jasonsandlin
title: "PFPlayerDataManagementServerGetPlayerCustomPropertyResult"
description: "PFPlayerDataManagementServerGetPlayerCustomPropertyResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerGetPlayerCustomPropertyResult  

PFPlayerDataManagementServerGetPlayerCustomPropertyResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementServerGetPlayerCustomPropertyResult {  
    const char* playFabId;  
    int32_t propertiesVersion;  
    PFPlayerDataManagementCustomPropertyDetails const* property;  
} PFPlayerDataManagementServerGetPlayerCustomPropertyResult;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab unique identifier of the user whose properties are being returned.
  
**`propertiesVersion`** &nbsp; int32_t  
  
Indicates the current version of a player's properties that have been set. This is incremented after updates and deletes. This version can be provided in update and delete calls for concurrency control.
  
**`property`** &nbsp; [PFPlayerDataManagementCustomPropertyDetails](pfplayerdatamanagementcustompropertydetails.md) const*  
*may be nullptr*  
  
(Optional) Player specific property and its corresponding value.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
