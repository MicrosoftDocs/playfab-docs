---
author: jasonsandlin
title: "PFEventsWriteTelemetryEventsAsync"
description: "Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start with 'custom.'"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventsWriteTelemetryEventsAsync  

Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start with 'custom.'  

## Syntax  
  
```cpp
HRESULT PFEventsWriteTelemetryEventsAsync(  
    PFEntityHandle entityHandle,  
    const PFEventsWriteEventsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFEventsWriteEventsRequest*](../../pfeventstypes/structs/pfeventswriteeventsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This API must be called with either X-EntityToken or X-TelemetryKey headers. If sending X-EntityToken the value must be a valid EntityToken for your title. If using X-TelemetryKey the value must be a Telemetry Key configured for your title set to 'Active'. If both are provided, X-TelemetryKey will be ignored. When the asynchronous task is complete, call [PFEventsWriteTelemetryEventsGetResultSize](pfeventswritetelemetryeventsgetresultsize.md) and [PFEventsWriteTelemetryEventsGetResult](pfeventswritetelemetryeventsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
