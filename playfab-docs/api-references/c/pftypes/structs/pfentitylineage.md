---
author: jasonsandlin
title: "PFEntityLineage"
description: "PFEntityLineage data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityLineage  

PFEntityLineage data model.  

## Syntax  
  
```cpp
typedef struct PFEntityLineage {  
    const char* characterId;  
    const char* groupId;  
    const char* masterPlayerAccountId;  
    const char* namespaceId;  
    const char* titleId;  
    const char* titlePlayerAccountId;  
} PFEntityLineage;  
```
  
### Members  
  
**`characterId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Character Id of the associated entity.
  
**`groupId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Group Id of the associated entity.
  
**`masterPlayerAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Master Player Account Id of the associated entity.
  
**`namespaceId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Namespace Id of the associated entity.
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Title Id of the associated entity.
  
**`titlePlayerAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Title Player Account Id of the associated entity.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
