---
author: jasonsandlin
title: "PFEventsWriteEventsAsync"
description: "Write batches of entity based events to PlayStream. The namespace of the Event must be 'custom' or start with 'custom.'."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventsWriteEventsAsync  

Write batches of entity based events to PlayStream. The namespace of the Event must be 'custom' or start with 'custom.'.  

## Syntax  
  
```cpp
HRESULT PFEventsWriteEventsAsync(  
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
  
This API is available on all platforms. When the asynchronous task is complete, call [PFEventsWriteEventsGetResultSize](pfeventswriteeventsgetresultsize.md) and [PFEventsWriteEventsGetResult](pfeventswriteeventsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFEvents.h
  
## See also  
[PFEvents members](../pfevents_members.md)  

  
  
