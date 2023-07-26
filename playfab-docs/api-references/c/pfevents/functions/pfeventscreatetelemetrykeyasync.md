---
author: jasonsandlin
title: "PFEventsCreateTelemetryKeyAsync"
description: "Creates a new telemetry key for the title."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsCreateTelemetryKeyAsync  

Creates a new telemetry key for the title.  

## Syntax  
  
```cpp
HRESULT PFEventsCreateTelemetryKeyAsync(  
    PFEntityHandle entityHandle,  
    const PFEventsCreateTelemetryKeyRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFEventsCreateTelemetryKeyRequest*](../../pfeventstypes/structs/pfeventscreatetelemetrykeyrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Nintendo Switch, and Sony PlayStation®. When the asynchronous task is complete, call [PFEventsCreateTelemetryKeyGetResultSize](pfeventscreatetelemetrykeygetresultsize.md) and [PFEventsCreateTelemetryKeyGetResult](pfeventscreatetelemetrykeygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
