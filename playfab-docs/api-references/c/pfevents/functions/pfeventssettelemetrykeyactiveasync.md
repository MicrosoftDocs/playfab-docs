---
author: jasonsandlin
title: "PFEventsSetTelemetryKeyActiveAsync"
description: "Sets a telemetry key to the active or deactivated state."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsSetTelemetryKeyActiveAsync  

Sets a telemetry key to the active or deactivated state.  

## Syntax  
  
```cpp
HRESULT PFEventsSetTelemetryKeyActiveAsync(  
    PFEntityHandle entityHandle,  
    const PFEventsSetTelemetryKeyActiveRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFEventsSetTelemetryKeyActiveRequest*](../../pfeventstypes/structs/pfeventssettelemetrykeyactiverequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Nintendo Switch, and Sony PlayStation®. When the asynchronous task is complete, call [PFEventsSetTelemetryKeyActiveGetResultSize](pfeventssettelemetrykeyactivegetresultsize.md) and [PFEventsSetTelemetryKeyActiveGetResult](pfeventssettelemetrykeyactivegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
