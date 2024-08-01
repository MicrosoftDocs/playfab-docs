---
author: jasonsandlin
title: "PFExperimentationGetTreatmentAssignmentRequest"
description: "PFExperimentationGetTreatmentAssignmentRequest data model. Given a title player or a title entity token, returns the treatment variants and variables assigned to the entity across all running experiments."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFExperimentationGetTreatmentAssignmentRequest  

PFExperimentationGetTreatmentAssignmentRequest data model. Given a title player or a title entity token, returns the treatment variants and variables assigned to the entity across all running experiments.  

## Syntax  
  
```cpp
typedef struct PFExperimentationGetTreatmentAssignmentRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFExperimentationGetTreatmentAssignmentRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
  
## Requirements  
  
**Header:** PFExperimentationTypes.h
  
## See also  
[PFExperimentationTypes members](../pfexperimentationtypes_members.md)  

  
  
