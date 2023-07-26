---
author: jasonsandlin
title: "PFEventsListTelemetryKeysAsync"
description: "Lists all telemetry keys configured for the title."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsListTelemetryKeysAsync  

Lists all telemetry keys configured for the title.  

## Syntax  
  
```cpp
HRESULT PFEventsListTelemetryKeysAsync(  
    PFEntityHandle entityHandle,  
    const PFEventsListTelemetryKeysRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFEventsListTelemetryKeysRequest*](../../pfeventstypes/structs/pfeventslisttelemetrykeysrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Nintendo Switch, and Sony PlayStation®. When the asynchronous task is complete, call [PFEventsListTelemetryKeysGetResultSize](pfeventslisttelemetrykeysgetresultsize.md) and [PFEventsListTelemetryKeysGetResult](pfeventslisttelemetrykeysgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
