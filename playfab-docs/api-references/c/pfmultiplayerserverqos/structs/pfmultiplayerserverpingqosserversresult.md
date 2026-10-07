---
author: jasonsandlin
title: "PFMultiplayerServerPingQosServersResult"
description: "Aggregate result of PFMultiplayerServerPingQosServersAsync. Regions are sorted ascending by latencyMs; unreachable regions (latencyMs == UINT32_MAX) appear at the end."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2026
---

# PFMultiplayerServerPingQosServersResult  

Aggregate result of PFMultiplayerServerPingQosServersAsync. Regions are sorted ascending by latencyMs; unreachable regions (latencyMs == UINT32_MAX) appear at the end.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerPingQosServersResult {  
    uint32_t regionCount;  
    PFMultiplayerServerQosResult const* regions;  
} PFMultiplayerServerPingQosServersResult;  
```
  
### Members  
  
**`regionCount`** &nbsp; uint32_t  
  
Number of entries in the regions array.
  
**`regions`** &nbsp; [PFMultiplayerServerQosResult](pfmultiplayerserverqosresult.md) const*  
*may be nullptr*  
  
Sorted region results. NULL when regionCount is 0. Array of pointers (array-of-pointers convention used by all generated PlayFab C structures).
  
  
## Requirements  
  
**Header:** PFMultiplayerServerQoS.h
  
## See also  
[PFMultiplayerServerQoS members](../pfmultiplayerserverqos_members.md)  

  
  
