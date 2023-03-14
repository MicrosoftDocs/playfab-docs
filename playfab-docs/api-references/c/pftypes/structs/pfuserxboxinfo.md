---
author: jasonsandlin
title: "PFUserXboxInfo"
description: "PFUserXboxInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFUserXboxInfo  

PFUserXboxInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserXboxInfo {  
    const char* xboxUserId;  
    const char* xboxUserSandbox;  
} PFUserXboxInfo;  
```
  
### Members  
  
**`xboxUserId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) XBox user ID.
  
**`xboxUserSandbox`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) XBox user sandbox.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
