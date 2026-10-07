---
author: jasonsandlin
title: "Services C API overview - PFMultiplayerServerQoS.h"
description: "Services C API overview - PFMultiplayerServerQoS.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/06/2026
---

# Services C API overview - PFMultiplayerServerQoS.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMultiplayerServerPingQosServersAsync](functions/pfmultiplayerserverpingqosserversasync.md) | Discovers QoS beacons via PFMultiplayerServerListQosServersForTitleAsync and pings each one over UDP/3075. Aggregates the latencies and returns the sorted list. Wall-clock duration is bounded by roughly ceil(regionCount / maxConcurrentRegions) * timeoutMs * pingsPerRegion plus the cost of the ListQosServersForTitle call. |  
| [PFMultiplayerServerPingQosServersGetResult](functions/pfmultiplayerserverpingqosserversgetresult.md) | Gets the result of a successful PFMultiplayerServerPingQosServersAsync call. |  
| [PFMultiplayerServerPingQosServersGetResultSize](functions/pfmultiplayerserverpingqosserversgetresultsize.md) | Get the size in bytes needed to store the result of a PFMultiplayerServerPingQosServersAsync call. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFMultiplayerServerPingQosServersOptions](structs/pfmultiplayerserverpingqosserversoptions.md) | Options controlling a QoS region ping operation. Pass NULL to PFMultiplayerServerPingQosServersAsync to use the defaults documented below. |  
| [PFMultiplayerServerPingQosServersResult](structs/pfmultiplayerserverpingqosserversresult.md) | Aggregate result of PFMultiplayerServerPingQosServersAsync. Regions are sorted ascending by latencyMs; unreachable regions (latencyMs == UINT32_MAX) appear at the end. |  
| [PFMultiplayerServerQosResult](structs/pfmultiplayerserverqosresult.md) | Per-region result row. Pointers point inside the caller-supplied result buffer and are valid only as long as that buffer remains valid and unmoved. |  
