---
author: jasonsandlin
title: "PFMultiplayerServerListQosServersForTitleResponse"
description: "PFMultiplayerServerListQosServersForTitleResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListQosServersForTitleResponse  

PFMultiplayerServerListQosServersForTitleResponse data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListQosServersForTitleResponse {  
    int32_t pageSize;  
    PFMultiplayerServerQosServer const* qosServers;  
    uint32_t qosServersCount;  
    const char* skipToken;  
} PFMultiplayerServerListQosServersForTitleResponse;  
```
  
### Members  
  
**`pageSize`** &nbsp; int32_t  
  
The page size on the response.
  
**`qosServers`** &nbsp; [PFMultiplayerServerQosServer](pfmultiplayerserverqosserver.md) const*  
*may be nullptr*  
  
(Optional) The list of QoS servers.
  
**`qosServersCount`** &nbsp; uint32_t  
  
Count of qosServers
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged response.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
