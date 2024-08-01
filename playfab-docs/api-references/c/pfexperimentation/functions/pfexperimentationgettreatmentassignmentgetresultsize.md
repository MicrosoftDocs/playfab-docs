---
author: jasonsandlin
title: "PFExperimentationGetTreatmentAssignmentGetResultSize"
description: "Get the size in bytes needed to store the result of a GetTreatmentAssignment call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFExperimentationGetTreatmentAssignmentGetResultSize  

Get the size in bytes needed to store the result of a GetTreatmentAssignment call.  

## Syntax  
  
```cpp
HRESULT PFExperimentationGetTreatmentAssignmentGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_EXPERIMENTATION_CLIENT_TIMEOUT, E_PF_EXPERIMENTATION_TREATMENT_ASSIGNMENT_DISABLED, E_PF_EXPERIMENTATION_TREATMENT_ASSIGNMENT_FAILED, E_PF_FEATURE_NOT_CONFIGURED_FOR_TITLE, E_PF_INVALID_ENTITY_TYPE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFExperimentation.h
  
## See also  
[PFExperimentation members](../pfexperimentation_members.md)  

  
  
