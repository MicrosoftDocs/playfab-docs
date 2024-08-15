---
author: jasonsandlin
title: "PFEventPipelineAddUploadingEntity"
description: "Adds an entity to an existing pipeline. All events emitted will be linked to this entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineAddUploadingEntity  

Adds an entity to an existing pipeline. All events emitted will be linked to this entity.  

## Syntax  
  
```cpp
HRESULT PFEventPipelineAddUploadingEntity(  
    PFEventPipelineHandle eventPipelineHandle,  
    PFEntityHandle entityHandle  
)  
```  
  
### Parameters  
  
**`eventPipelineHandle`** &nbsp; PFEventPipelineHandle  
  
The existing EventPipeline handle to add the uploading entity.  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
The Entity whose token will be used to make the PlayFab service requests in the background.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_PF_NOT_INITIALIZED or E_FAIL.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
