---
author: jasonsandlin
title: "PFEventPipelineCreatePlayStreamPipelineHandle"
description: "Creates an event pipeline to upload PlayStream events using an Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineCreatePlayStreamPipelineHandle  

Creates an event pipeline to upload PlayStream events using an Entity.  

## Syntax  
  
```cpp
HRESULT PFEventPipelineCreatePlayStreamPipelineHandle(  
    PFEntityHandle entityHandle,  
    XTaskQueueHandle queue,  
    PFEventPipelineBatchUploadSucceededEventHandler* eventPipelineBatchUploadedEventHandler,  
    PFEventPipelineBatchUploadFailedEventHandler* eventPipelineBatchFailedEventHandler,  
    void* handlerContext,  
    PFEventPipelineHandle* eventPipelineHandle  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
The Entity whose token will be used to make the PlayFab service requests in the background.  
  
**`queue`** &nbsp; XTaskQueueHandle  
*optional*  
  
The async queue where background work will be scheduled and where event callbacks will be invoked.  
  
**`eventPipelineBatchUploadedEventHandler`** &nbsp; PFEventPipelineBatchUploadSucceededEventHandler*  
*optional*  
  
Optional handler that will be invoked when a batch of events is uploaded.  
  
**`eventPipelineBatchFailedEventHandler`** &nbsp; PFEventPipelineBatchUploadFailedEventHandler*  
*optional*  
  
Optional handler that will be invoked when uploading a batch of events fails.  
  
**`handlerContext`** &nbsp; void*  
*optional*  
  
Optional pointer to data used by the event handlers.  
  
**`eventPipelineHandle`** &nbsp; PFEventPipelineHandle*  
*output*  
  
Handle to the created pipeline. Needs to be closed with PFEventPipelineCloseHandle when it isn't needed.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_PF_NOT_INITIALIZED or E_FAIL.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
