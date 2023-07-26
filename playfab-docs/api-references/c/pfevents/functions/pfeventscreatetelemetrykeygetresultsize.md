---
author: jasonsandlin
title: "PFEventsCreateTelemetryKeyGetResultSize"
description: "Get the size in bytes needed to store the result of a CreateTelemetryKey call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsCreateTelemetryKeyGetResultSize  

Get the size in bytes needed to store the result of a CreateTelemetryKey call.  

## Syntax  
  
```cpp
HRESULT PFEventsCreateTelemetryKeyGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_TELEMETRY_KEY_ALREADY_EXISTS, E_PF_TELEMETRY_KEY_INVALID_NAME, E_PF_TELEMETRY_KEY_LONG_INSIGHTS_RETENTION_NOT_ALLOWED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
