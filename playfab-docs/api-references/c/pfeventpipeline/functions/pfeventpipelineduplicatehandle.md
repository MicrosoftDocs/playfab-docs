---
author: jasonsandlin
title: "PFEventPipelineDuplicateHandle"
description: "Duplicates a PFEventPipelineHandle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineDuplicateHandle  

Duplicates a PFEventPipelineHandle.  

## Syntax  
  
```cpp
HRESULT PFEventPipelineDuplicateHandle(  
    PFEventPipelineHandle eventPipelineHandle,  
    PFEventPipelineHandle* duplicatedEventPipelineHandle  
)  
```  
  
### Parameters  
  
**`eventPipelineHandle`** &nbsp; PFEventPipelineHandle  
  
EventPipeline handle to duplicate.  
  
**`duplicatedEventPipelineHandle`** &nbsp; PFEventPipelineHandle*  
  
TBD    
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Both the duplicated handle and the original handle need to be closed with PFEventPipelineCloseHandle when they are no longer needed.
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
