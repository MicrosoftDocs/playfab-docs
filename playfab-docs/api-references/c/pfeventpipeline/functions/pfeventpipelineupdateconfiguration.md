---
author: jasonsandlin
title: "PFEventPipelineUpdateConfiguration"
description: "Update an existing pipeline configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineUpdateConfiguration  

Update an existing pipeline configuration.  

## Syntax  
  
```cpp
HRESULT PFEventPipelineUpdateConfiguration(  
    PFEventPipelineHandle eventPipelineHandle,  
    PFEventPipelineConfig eventPipelineConfig  
)  
```  
  
### Parameters  
  
**`eventPipelineHandle`** &nbsp; PFEventPipelineHandle  
  
The existing EventPipeline handle to add the uploading entity.  
  
**`eventPipelineConfig`** &nbsp; [PFEventPipelineConfig](../structs/pfeventpipelineconfig.md)  
  
Struct that contains the new configuration of the event pipeline.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_PF_NOT_INITIALIZED, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
