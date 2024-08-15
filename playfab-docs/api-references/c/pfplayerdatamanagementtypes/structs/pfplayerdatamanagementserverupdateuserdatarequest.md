---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdateUserDataRequest"
description: "PFPlayerDataManagementServerUpdateUserDataRequest data model. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementServerUpdateUserDataRequest  

PFPlayerDataManagementServerUpdateUserDataRequest data model. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementServerUpdateUserDataRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFStringDictionaryEntry const* data;  
    uint32_t dataCount;  
    const char* const* keysToRemove;  
    uint32_t keysToRemoveCount;  
    PFUserDataPermission const* permission;  
    const char* playFabId;  
} PFPlayerDataManagementServerUpdateUserDataRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`data`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
**`keysToRemove`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
  
**`keysToRemoveCount`** &nbsp; uint32_t  
  
Count of keysToRemove
  
**`permission`** &nbsp; [PFUserDataPermission](../../pftypes/enums/pfuserdatapermission.md) const*  
*may be nullptr*  
  
(Optional) Permission to be applied to all user data keys written in this request. Defaults to "private" if not set.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
