---
author: jasonsandlin
title: "PFEventPipelineRemoveUploadingEntity"
description: "Remove an entity from an existing pipeline. If a valid Telemetry Key Configuration was added at pipeline creation it will switch to it."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineRemoveUploadingEntity  

Remove an entity from an existing pipeline. If a valid Telemetry Key Configuration was added at pipeline creation it will switch to it.  

## Syntax  
  
```cpp
HRESULT PFEventPipelineRemoveUploadingEntity(  
    PFEventPipelineHandle eventPipelineHandle  
)  
```  
  
### Parameters  
  
**`eventPipelineHandle`** &nbsp; PFEventPipelineHandle  
  
The existing EventPipeline handle to remove the uploading entity.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_PF_NOT_INITIALIZED, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
