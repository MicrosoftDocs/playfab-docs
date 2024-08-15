---
author: jasonsandlin
title: "PFExperimentationGetTreatmentAssignmentAsync"
description: "Gets the treatment assignments for a player for every running experiment in the title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFExperimentationGetTreatmentAssignmentAsync  

Gets the treatment assignments for a player for every running experiment in the title.  

## Syntax  
  
```cpp
HRESULT PFExperimentationGetTreatmentAssignmentAsync(  
    PFEntityHandle entityHandle,  
    const PFExperimentationGetTreatmentAssignmentRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFExperimentationGetTreatmentAssignmentRequest*](../../pfexperimentationtypes/structs/pfexperimentationgettreatmentassignmentrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFExperimentationGetTreatmentAssignmentGetResultSize](pfexperimentationgettreatmentassignmentgetresultsize.md) and [PFExperimentationGetTreatmentAssignmentGetResult](pfexperimentationgettreatmentassignmentgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFExperimentation.h
  
## See also  
[PFExperimentation members](../pfexperimentation_members.md)  

  
  
