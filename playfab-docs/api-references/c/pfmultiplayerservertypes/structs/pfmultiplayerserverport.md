---
author: jasonsandlin
title: "PFMultiplayerServerPort"
description: "PFMultiplayerServerPort data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerPort  

PFMultiplayerServerPort data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerPort {  
    const char* name;  
    int32_t num;  
    PFMultiplayerServerProtocolType protocol;  
} PFMultiplayerServerPort;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name for the port.
  
**`num`** &nbsp; int32_t  
  
The number for the port.
  
**`protocol`** &nbsp; [PFMultiplayerServerProtocolType](../enums/pfmultiplayerserverprotocoltype.md)  
  
The protocol for the port.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
