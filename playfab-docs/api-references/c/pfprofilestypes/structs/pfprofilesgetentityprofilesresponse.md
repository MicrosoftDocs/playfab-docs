---
author: jasonsandlin
title: "PFProfilesGetEntityProfilesResponse"
description: "PFProfilesGetEntityProfilesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesGetEntityProfilesResponse  

PFProfilesGetEntityProfilesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetEntityProfilesResponse {  
    PFProfilesEntityProfileBody const* profiles;  
    uint32_t profilesCount;  
} PFProfilesGetEntityProfilesResponse;  
```
  
### Members  
  
**`profiles`** &nbsp; [PFProfilesEntityProfileBody](pfprofilesentityprofilebody.md) const*  
*array of size `profilesCount`*  
  
(Optional) Entity profiles.
  
**`profilesCount`** &nbsp; uint32_t  
  
Count of profiles
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
