---
author: jasonsandlin
title: "PFUserDataRecord"
description: "PFUserDataRecord data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserDataRecord  

PFUserDataRecord data model.  

## Syntax  
  
```cpp
typedef struct PFUserDataRecord {  
    time_t lastUpdated;  
    PFUserDataPermission const* permission;  
    const char* value;  
} PFUserDataRecord;  
```
  
### Members  
  
**`lastUpdated`** &nbsp; time_t  
  
Timestamp for when this data was last updated.
  
**`permission`** &nbsp; [PFUserDataPermission](../enums/pfuserdatapermission.md) const*  
*may be nullptr*  
  
(Optional) Indicates whether this data can be read by all users (public) or only the user (private). This is used for GetUserData requests being made by one player about another player.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Data stored for the specified user data key.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
