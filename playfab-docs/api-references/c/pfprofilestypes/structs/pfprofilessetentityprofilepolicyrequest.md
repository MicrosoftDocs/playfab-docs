---
author: jasonsandlin
title: "PFProfilesSetEntityProfilePolicyRequest"
description: "PFProfilesSetEntityProfilePolicyRequest data model. This will set the access policy statements on the given entity profile. This is not additive, any existing statements will be replaced with the statements in this request."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesSetEntityProfilePolicyRequest  

PFProfilesSetEntityProfilePolicyRequest data model. This will set the access policy statements on the given entity profile. This is not additive, any existing statements will be replaced with the statements in this request.  

## Syntax  
  
```cpp
typedef struct PFProfilesSetEntityProfilePolicyRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFProfilesEntityPermissionStatement const* statements;  
    uint32_t statementsCount;  
} PFProfilesSetEntityProfilePolicyRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`statements`** &nbsp; [PFProfilesEntityPermissionStatement](pfprofilesentitypermissionstatement.md) const*  
*array of size `statementsCount`*  
  
The statements to include in the access policy.
  
**`statementsCount`** &nbsp; uint32_t  
  
Count of statements
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
