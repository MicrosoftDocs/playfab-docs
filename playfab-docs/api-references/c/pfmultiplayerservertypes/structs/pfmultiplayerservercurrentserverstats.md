---
author: jasonsandlin
title: "PFMultiplayerServerCurrentServerStats"
description: "PFMultiplayerServerCurrentServerStats data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerCurrentServerStats  

PFMultiplayerServerCurrentServerStats data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerCurrentServerStats {  
    int32_t active;  
    int32_t propping;  
    int32_t standingBy;  
    int32_t total;  
} PFMultiplayerServerCurrentServerStats;  
```
  
### Members  
  
**`active`** &nbsp; int32_t  
  
The number of active multiplayer servers.
  
**`propping`** &nbsp; int32_t  
  
The number of multiplayer servers still downloading game resources (such as assets).
  
**`standingBy`** &nbsp; int32_t  
  
The number of standingby multiplayer servers.
  
**`total`** &nbsp; int32_t  
  
The total number of multiplayer servers.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
