---
author: jasonsandlin
title: "PFExperimentationGetTreatmentAssignmentGetResult"
description: "Gets the result of a successful PFExperimentationGetTreatmentAssignmentAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFExperimentationGetTreatmentAssignmentGetResult  

Gets the result of a successful PFExperimentationGetTreatmentAssignmentAsync call.  

## Syntax  
  
```cpp
HRESULT PFExperimentationGetTreatmentAssignmentGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFExperimentationGetTreatmentAssignmentResult** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the result value and its fields.  
  
**`result`** &nbsp; [PFExperimentationGetTreatmentAssignmentResult**](../../pfexperimentationtypes/structs/pfexperimentationgettreatmentassignmentresult.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFExperimentation.h
  
## See also  
[PFExperimentation members](../pfexperimentation_members.md)  

  
  
