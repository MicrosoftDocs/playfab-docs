---
author: jasonsandlin
title: "PFTreatmentAssignment"
description: "PFTreatmentAssignment data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFTreatmentAssignment  

PFTreatmentAssignment data model.  

## Syntax  
  
```cpp
typedef struct PFTreatmentAssignment {  
    PFVariable const* const* variables;  
    uint32_t variablesCount;  
    const char* const* variants;  
    uint32_t variantsCount;  
} PFTreatmentAssignment;  
```
  
### Members  
  
**`variables`** &nbsp; [PFVariable](pfvariable.md) const* const*  
*may be nullptr*  
  
(Optional) List of the experiment variables. An array of `variablesCount` pointers.
  
**`variablesCount`** &nbsp; uint32_t  
  
Count of variables
  
**`variants`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) List of the experiment variants.
  
**`variantsCount`** &nbsp; uint32_t  
  
Count of variants
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
