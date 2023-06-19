---
author: jasonsandlin
title: "PFProfilesGetEntityProfileResponse"
description: "PFProfilesGetEntityProfileResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFProfilesGetEntityProfileResponse  

PFProfilesGetEntityProfileResponse data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetEntityProfileResponse {  
    PFProfilesEntityProfileBody const* profile;  
} PFProfilesGetEntityProfileResponse;  
```
  
### Members  
  
**`profile`** &nbsp; [PFProfilesEntityProfileBody](pfprofilesentityprofilebody.md) const*  
*may be nullptr*  
  
(Optional) Entity profile.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
