---
author: jasonsandlin
title: "PFMultiplayerServerPingQosServersOptions"
description: "Options controlling a QoS region ping operation. Pass NULL to PFMultiplayerServerPingQosServersAsync to use the defaults documented below."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2026
---

# PFMultiplayerServerPingQosServersOptions  

Options controlling a QoS region ping operation. Pass NULL to PFMultiplayerServerPingQosServersAsync to use the defaults documented below.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerPingQosServersOptions {  
    uint32_t timeoutMs;  
    uint32_t pingsPerRegion;  
    uint32_t maxConcurrentRegions;  
    bool includeAllRegions;  
    const char* routingPreference;  
} PFMultiplayerServerPingQosServersOptions;  
```
  
### Members  
  
**`timeoutMs`** &nbsp; uint32_t  
  
Per-ping receive timeout in milliseconds. A ping that does not receive a valid echo within this window is counted as a failure. Default 250.
  
**`pingsPerRegion`** &nbsp; uint32_t  
  
Number of ping iterations per region. Reported latencyMs is the arithmetic mean of the successful iterations. Default 3.
  
**`maxConcurrentRegions`** &nbsp; uint32_t  
  
Maximum number of regions probed concurrently. One UDP socket is opened per region while it is in flight. Default 0, interpreted as "all regions concurrently".
  
**`includeAllRegions`** &nbsp; bool  
  
If true, ListQosServersForTitle is asked to return beacons for every Azure region rather than only the regions where the title has deployed builds. Default false.
  
**`routingPreference`** &nbsp; const char*  
*is null-terminated*  
  
Routing preference forwarded to ListQosServersForTitle, which selects which beacon VIPs the service returns. Accepts the strings defined by the MultiplayerServer RoutingType enumeration: "Microsoft" (default — beacons whose Azure Public IPs are tagged with Microsoft network tier routing, traversing the Azure backbone for as much of the path as possible) or "Internet" (beacons routed over the public internet end-to-end). NULL or empty leaves the field unset and the service applies its default ("Microsoft"). A title that ships data-plane VIPs with both routing types should call this API twice (once per preference) and rank regions per the data plane the player will actually use.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerQoS.h
  
## See also  
[PFMultiplayerServerQoS members](../pfmultiplayerserverqos_members.md)  

  
  
