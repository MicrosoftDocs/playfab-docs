---
author: jasonsandlin
title: "PFAccountManagementGetPlayerProfileRequest"
description: "PFAccountManagementGetPlayerProfileRequest data model. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayerProfileRequest  

PFAccountManagementGetPlayerProfileRequest data model. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayerProfileRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
    PFPlayerProfileViewConstraints const* profileConstraints;  
} PFAccountManagementGetPlayerProfileRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`profileConstraints`** &nbsp; [PFPlayerProfileViewConstraints](../../pftypes/structs/pfplayerprofileviewconstraints.md) const*  
*may be nullptr*  
  
(Optional) If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
