---
author: jasonsandlin
title: "PFMultiplayerServerBuildSelectionCriterion"
description: "PFMultiplayerServerBuildSelectionCriterion data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerBuildSelectionCriterion  

PFMultiplayerServerBuildSelectionCriterion data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerBuildSelectionCriterion {  
    PFUint32DictionaryEntry const* buildWeightDistribution;  
    uint32_t buildWeightDistributionCount;  
} PFMultiplayerServerBuildSelectionCriterion;  
```
  
### Members  
  
**`buildWeightDistribution`** &nbsp; [PFUint32DictionaryEntry](../../pftypes/structs/pfuint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of build ids and their respective weights for distribution of allocation requests.
  
**`buildWeightDistributionCount`** &nbsp; uint32_t  
  
Count of buildWeightDistribution
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
