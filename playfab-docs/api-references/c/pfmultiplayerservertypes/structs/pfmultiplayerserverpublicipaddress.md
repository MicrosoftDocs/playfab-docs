---
author: jasonsandlin
title: "PFMultiplayerServerPublicIpAddress"
description: "PFMultiplayerServerPublicIpAddress data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/20/2023
---

# PFMultiplayerServerPublicIpAddress  

PFMultiplayerServerPublicIpAddress data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerPublicIpAddress {  
    const char* fQDN;  
    const char* ipAddress;  
    const char* routingType;  
} PFMultiplayerServerPublicIpAddress;  
```
  
### Members  
  
**`fQDN`** &nbsp; const char*  
*is null-terminated*  
  
FQDN of the public IP.
  
**`ipAddress`** &nbsp; const char*  
*is null-terminated*  
  
Server IP Address.
  
**`routingType`** &nbsp; const char*  
*is null-terminated*  
  
Routing Type of the public IP.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
