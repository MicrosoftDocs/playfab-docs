---
author: jasonsandlin
title: "PFProfilesGetEntityProfilesResponse"
description: "PFProfilesGetEntityProfilesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
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
*may be nullptr*  
  
(Optional) Entity profiles.
  
**`profilesCount`** &nbsp; uint32_t  
  
Count of profiles
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
