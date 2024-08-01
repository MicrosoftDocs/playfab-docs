---
author: jasonsandlin
title: "PFEventPipelineBatchUploadSucceededEventHandler"
description: "A handler invoked when the SDK successfully uploads a batch of events."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineBatchUploadSucceededEventHandler  

A handler invoked when the SDK successfully uploads a batch of events.  

## Syntax  
  
```cpp
void PFEventPipelineBatchUploadSucceededEventHandler(  
    void* context,  
    PFUploadedEvent eventPipelineUploadedEvents,  
    size_t eventPipelineUploadedEventsCount  
)  
```  
  
### Parameters  
  
**`context`** &nbsp; void*  
*optional*  
  
Optional context pointer to data used by the event handler.  
  
**`eventPipelineUploadedEvents`** &nbsp; [PFUploadedEvent](../structs/pfuploadedevent.md)  
  
The array of PFEventPipelineUploadedEvents that was uploaded.  
  
**`eventPipelineUploadedEventsCount`** &nbsp; size_t  
  
The number of entries in the eventPipelineUploadedEvents array.  
  
  
### Return value
Type: void
  
TBD  
  
## Remarks  
  
Arguments besides context are owned by the SDK and only guaranteed to be valid within the callback.
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
