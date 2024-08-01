---
author: jasonsandlin
title: "PFProfilesSetEntityProfilePolicyResponse"
description: "PFProfilesSetEntityProfilePolicyResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesSetEntityProfilePolicyResponse  

PFProfilesSetEntityProfilePolicyResponse data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesSetEntityProfilePolicyResponse {  
    PFProfilesEntityPermissionStatement const* permissions;  
    uint32_t permissionsCount;  
} PFProfilesSetEntityProfilePolicyResponse;  
```
  
### Members  
  
**`permissions`** &nbsp; [PFProfilesEntityPermissionStatement](pfprofilesentitypermissionstatement.md) const*  
*may be nullptr*  
  
(Optional) The permissions that govern access to this entity profile and its properties. Only includes permissions set on this profile, not global statements from titles and namespaces.
  
**`permissionsCount`** &nbsp; uint32_t  
  
Count of permissions
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
