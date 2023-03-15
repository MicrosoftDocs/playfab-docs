---
author: jasonsandlin
title: "PFEventsWriteTelemetryEventsAsync"
description: "Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start with 'custom.'"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
If successful, call [PFEventsWriteTelemetryEventsGetResult](pfeventswritetelemetryeventsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
