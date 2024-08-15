---
author: jasonsandlin
title: "PFExperimentationGetTreatmentAssignmentResult"
description: "PFExperimentationGetTreatmentAssignmentResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFExperimentationGetTreatmentAssignmentResult  

PFExperimentationGetTreatmentAssignmentResult data model.  

## Syntax  
  
```cpp
typedef struct PFExperimentationGetTreatmentAssignmentResult {  
    PFTreatmentAssignment const* treatmentAssignment;  
} PFExperimentationGetTreatmentAssignmentResult;  
```
  
### Members  
  
**`treatmentAssignment`** &nbsp; [PFTreatmentAssignment](../../pftypes/structs/pftreatmentassignment.md) const*  
*may be nullptr*  
  
(Optional) Treatment assignment for the entity.
  
  
## Requirements  
  
**Header:** PFExperimentationTypes.h
  
## See also  
[PFExperimentationTypes members](../pfexperimentationtypes_members.md)  

  
  
