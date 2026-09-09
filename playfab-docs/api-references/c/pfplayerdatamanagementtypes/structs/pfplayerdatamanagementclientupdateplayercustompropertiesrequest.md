---
author: jasonsandlin
title: "PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest"
description: "PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest data model. Performs an additive update of the custom properties for the specified player. In updating the player's custom properties, properties which already exist will have their values overwritten. No other properties will be changed apart from those specified in the call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest  

PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest data model. Performs an additive update of the custom properties for the specified player. In updating the player's custom properties, properties which already exist will have their values overwritten. No other properties will be changed apart from those specified in the call.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* expectedPropertiesVersion;  
    PFPlayerDataManagementUpdateProperty const* properties;  
    uint32_t propertiesCount;  
} PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`expectedPropertiesVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Optional field used for concurrency control. One can ensure that the update operation will only be performed if the player's properties have not been updated by any other clients since last the version.
  
**`properties`** &nbsp; [PFPlayerDataManagementUpdateProperty](pfplayerdatamanagementupdateproperty.md) const*  
  
Collection of properties to be set for a player.
  
**`propertiesCount`** &nbsp; uint32_t  
  
Count of properties
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
