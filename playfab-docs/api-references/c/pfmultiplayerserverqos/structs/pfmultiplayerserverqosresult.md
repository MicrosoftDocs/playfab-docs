---
author: jasonsandlin
title: "PFMultiplayerServerQosResult"
description: "Per-region result row. Pointers point inside the caller-supplied result buffer and are valid only as long as that buffer remains valid and unmoved."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2026
---

# PFMultiplayerServerQosResult  

Per-region result row. Pointers point inside the caller-supplied result buffer and are valid only as long as that buffer remains valid and unmoved.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerQosResult {  
    const char* region;  
    uint32_t latencyMs;  
    uint32_t pingsAttempted;  
    uint32_t pingsSucceeded;  
    HRESULT errorCode;  
} PFMultiplayerServerQosResult;  
```
  
### Members  
  
**`region`** &nbsp; const char*  
*is null-terminated*  
  
Azure region name as returned by ListQosServersForTitle (e.g. "EastUs", "FranceCentral").
  
**`latencyMs`** &nbsp; uint32_t  
  
Mean round-trip latency across the successful pings, in milliseconds. UINT32_MAX when the region was unreachable (every ping timed out or failed validation).
  
**`pingsAttempted`** &nbsp; uint32_t  
  
Total number of pings attempted against this region.
  
**`pingsSucceeded`** &nbsp; uint32_t  
  
Number of pings that received a validated echo within timeoutMs.
  
**`errorCode`** &nbsp; HRESULT  
  
S_OK if the region produced at least one validated reply. Otherwise an HRESULT describing the reason (timeout, DNS failure, socket error). Region rows are returned even when this is a failure code; the operation-level HRESULT is independent.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerQoS.h
  
## See also  
[PFMultiplayerServerQoS members](../pfmultiplayerserverqos_members.md)  

  
  
