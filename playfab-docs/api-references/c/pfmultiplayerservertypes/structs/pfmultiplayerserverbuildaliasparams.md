---
author: jasonsandlin
title: "PFMultiplayerServerBuildAliasParams"
description: "PFMultiplayerServerBuildAliasParams data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerBuildAliasParams  

PFMultiplayerServerBuildAliasParams data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerBuildAliasParams {  
    const char* aliasId;  
} PFMultiplayerServerBuildAliasParams;  
```
  
### Members  
  
**`aliasId`** &nbsp; const char*  
*is null-terminated*  
  
The guid string alias ID to use for the request.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
