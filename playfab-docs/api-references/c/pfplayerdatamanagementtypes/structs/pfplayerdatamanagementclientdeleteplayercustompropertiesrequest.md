---
author: jasonsandlin
title: "PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest"
description: "PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest data model. Deletes custom properties for the specified player. The list of provided property names must be non-empty."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest  

PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest data model. Deletes custom properties for the specified player. The list of provided property names must be non-empty.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* expectedPropertiesVersion;  
    const char* const* propertyNames;  
    uint32_t propertyNamesCount;  
} PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`expectedPropertiesVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Optional field used for concurrency control. One can ensure that the delete operation will only be performed if the player's properties have not been updated by any other clients since the last version.
  
**`propertyNames`** &nbsp; const char* const*  
  
A list of property names denoting which properties should be deleted.
  
**`propertyNamesCount`** &nbsp; uint32_t  
  
Count of propertyNames
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
