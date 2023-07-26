---
author: jasonsandlin
title: "PFEventsDeleteTelemetryKeyGetResult"
description: "Gets the result of a successful PFEventsDeleteTelemetryKeyAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsDeleteTelemetryKeyGetResult  

Gets the result of a successful PFEventsDeleteTelemetryKeyAsync call.  

## Syntax  
  
```cpp
HRESULT PFEventsDeleteTelemetryKeyGetResult(  
    XAsyncBlock* async,  
    PFEventsDeleteTelemetryKeyResponse* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFEventsDeleteTelemetryKeyResponse*](../../pfeventstypes/structs/pfeventsdeletetelemetrykeyresponse.md)  
*output*  
  
PFEventsDeleteTelemetryKeyResponse object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
