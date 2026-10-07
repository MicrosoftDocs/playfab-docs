---
author: jasonsandlin
title: "PFMultiplayerServerPingQosServersAsync"
description: "Discovers QoS beacons via PFMultiplayerServerListQosServersForTitleAsync and pings each one over UDP/3075. Aggregates the latencies and returns the sorted list. Wall-clock duration is bounded by roughly ceil(regionCount / maxConcurrentRegions) * timeoutMs * pingsPerRegion plus the cost of the ListQosServersForTitle call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/06/2026
---

# PFMultiplayerServerPingQosServersAsync  

Discovers QoS beacons via PFMultiplayerServerListQosServersForTitleAsync and pings each one over UDP/3075. Aggregates the latencies and returns the sorted list. Wall-clock duration is bounded by roughly ceil(regionCount / maxConcurrentRegions) * timeoutMs * pingsPerRegion plus the cost of the ListQosServersForTitle call.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerServerPingQosServersAsync(  
    PFEntityHandle entityHandle,  
    const PFMultiplayerServerPingQosServersOptions* options,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
Authenticated PlayFab entity. The same handle accepted by PFMultiplayerServerListQosServersForTitleAsync.  
  
**`options`** &nbsp; [PFMultiplayerServerPingQosServersOptions*](../structs/pfmultiplayerserverpingqosserversoptions.md)  
*optional*  
  
Optional. NULL means apply defaults documented on PFMultiplayerServerPingQosServersOptions.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation. Honors XAsyncCancel.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. A network where every region times out (for example, a corporate firewall blocking UDP/3075) is not a failure mode: the operation completes with S_OK and every PFMultiplayerServerQosResult is marked unreachable so callers can detect and surface that condition. When the asynchronous operation is complete, call [PFMultiplayerServerPingQosServersGetResultSize](pfmultiplayerserverpingqosserversgetresultsize.md) and [PFMultiplayerServerPingQosServersGetResult](pfmultiplayerserverpingqosserversgetresult.md) to retrieve the result.
  
## Requirements  
  
**Header:** PFMultiplayerServerQoS.h
  
## See also  
[PFMultiplayerServerQoS members](../pfmultiplayerserverqos_members.md)  

  
  
