---
author: jasonsandlin
title: "PFMultiplayerServerQosServer"
description: "PFMultiplayerServerQosServer data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerQosServer  

PFMultiplayerServerQosServer data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerQosServer {  
    const char* region;  
    const char* serverUrl;  
} PFMultiplayerServerQosServer;  
```
  
### Members  
  
**`region`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The region the QoS server is located in.
  
**`serverUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The QoS server URL.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
