---
author: jasonsandlin
title: "PFProfilesEntityPermissionStatement"
description: "PFProfilesEntityPermissionStatement data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesEntityPermissionStatement  

PFProfilesEntityPermissionStatement data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityPermissionStatement {  
    const char* action;  
    const char* comment;  
    PFJsonObject condition;  
    PFProfilesEffectType effect;  
    PFJsonObject principal;  
    const char* resource;  
} PFProfilesEntityPermissionStatement;  
```
  
### Members  
  
**`action`** &nbsp; const char*  
*is null-terminated*  
  
The action this statement effects. May be 'Read', 'Write' or '*' for both read and write.
  
**`comment`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) A comment about the statement. Intended solely for bookkeeping and debugging.
  
**`condition`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Additional conditions to be applied for entity resources.
  
**`effect`** &nbsp; [PFProfilesEffectType](../enums/pfprofileseffecttype.md)  
  
The effect this statement will have. It may be either Allow or Deny.
  
**`principal`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
The principal this statement will effect.
  
**`resource`** &nbsp; const char*  
*is null-terminated*  
  
The resource this statements effects. Similar to 'pfrn:data--title![Title ID]/Profile/*'.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
