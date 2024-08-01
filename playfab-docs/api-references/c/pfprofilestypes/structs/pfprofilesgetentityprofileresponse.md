---
author: jasonsandlin
title: "PFProfilesGetEntityProfileResponse"
description: "PFProfilesGetEntityProfileResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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

  
  
