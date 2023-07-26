---
author: jasonsandlin
title: "PFEventsGetTelemetryKeyGetResultSize"
description: "Get the size in bytes needed to store the result of a GetTelemetryKey call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsGetTelemetryKeyGetResultSize  

Get the size in bytes needed to store the result of a GetTelemetryKey call.  

## Syntax  
  
```cpp
HRESULT PFEventsGetTelemetryKeyGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_TELEMETRY_KEY_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
