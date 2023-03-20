---
author: jasonsandlin
title: "PFExperimentationGetTreatmentAssignmentRequest"
description: "PFExperimentationGetTreatmentAssignmentRequest data model. Given a title player or a title entity token, returns the treatment variants and variables assigned to the entity across all running experiments."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFExperimentationGetTreatmentAssignmentRequest  

PFExperimentationGetTreatmentAssignmentRequest data model. Given a title player or a title entity token, returns the treatment variants and variables assigned to the entity across all running experiments.  

## Syntax  
  
```cpp
typedef struct PFExperimentationGetTreatmentAssignmentRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFExperimentationGetTreatmentAssignmentRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
  
## Requirements  
  
**Header:** PFExperimentationTypes.h
  
## See also  
[PFExperimentationTypes members](../pfexperimentationtypes_members.md)  

  
  
