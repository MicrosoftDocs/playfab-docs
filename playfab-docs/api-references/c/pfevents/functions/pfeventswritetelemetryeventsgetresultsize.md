---
author: jasonsandlin
title: "PFEventsWriteTelemetryEventsGetResultSize"
description: "Get the size in bytes needed to store the result of a WriteTelemetryEvents call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventsWriteTelemetryEventsGetResultSize  

Get the size in bytes needed to store the result of a WriteTelemetryEvents call.  

## Syntax  
  
```cpp
HRESULT PFEventsWriteTelemetryEventsGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENCRYPTION_KEY_BROKEN, E_PF_EVENT_ENTITY_NOT_ALLOWED, E_PF_EVENT_NAMESPACE_NOT_ALLOWED, E_PF_INVALID_JSON_CONTENT, E_PF_PER_ENTITY_EVENT_RATE_LIMIT_EXCEEDED, E_PF_TELEMETRY_KEY_DEACTIVATED, E_PF_TELEMETRY_KEY_INVALID or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
