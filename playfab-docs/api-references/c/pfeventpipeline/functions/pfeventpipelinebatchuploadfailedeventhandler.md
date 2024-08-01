---
author: jasonsandlin
title: "PFEventPipelineBatchUploadFailedEventHandler"
description: "A handler invoked when the SDK has attempted but failed to upload a batch of event pipeline events. It is up to the client to resubmit failed events as necessary using PFEventPipelineEmitEvent, though depending on the nature of the failure, resubmitting directly may not resolve the issue."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineBatchUploadFailedEventHandler  

A handler invoked when the SDK has attempted but failed to upload a batch of event pipeline events. It is up to the client to resubmit failed events as necessary using PFEventPipelineEmitEvent, though depending on the nature of the failure, resubmitting directly may not resolve the issue.  

## Syntax  
  
```cpp
void PFEventPipelineBatchUploadFailedEventHandler(  
    void* context,  
    HRESULT translatedUploadError,  
    const char* errorMessage,  
    PFEvent failedEvents,  
    size_t failedEventsCount  
)  
```  
  
### Parameters  
  
**`context`** &nbsp; void*  
*optional*  
  
Optional context pointer to data used by the event handler.  
  
**`translatedUploadError`** &nbsp; HRESULT  
  
Translated upload error.  
  
**`errorMessage`** &nbsp; char*  
  
Message describing the upload error.  
  
**`failedEvents`** &nbsp; [PFEvent](../structs/pfevent.md)  
  
Events that were in the failed batch.  
  
**`failedEventsCount`** &nbsp; size_t  
  
The number of entries in the failedEvents array.  
  
  
### Return value
Type: void
  
TBD  
  
## Remarks  
  
Arguments besides context are owned by the SDK and only guaranteed to be valid within the callback.
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
