---
author: jasonsandlin
title: "PFEventPipelineEmitEvent"
description: "Adds a event to a pipelines buffer to be uploaded. The API will return synchronously and the event will be uploaded in the background based on the pipeline configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineEmitEvent  

Adds a event to a pipelines buffer to be uploaded. The API will return synchronously and the event will be uploaded in the background based on the pipeline configuration.  

## Syntax  
  
```cpp
HRESULT PFEventPipelineEmitEvent(  
    PFEventPipelineHandle eventPipelineHandle,  
    PFEvent event  
)  
```  
  
### Parameters  
  
**`eventPipelineHandle`** &nbsp; PFEventPipelineHandle  
  
The EventPipeline to submit the event to.  
  
**`event`** &nbsp; [PFEvent](../structs/pfevent.md)  
  
Event to upload.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_PF_NOT_INITIALIZED, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
