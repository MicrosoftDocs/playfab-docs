---
author: jasonsandlin
title: "PFMultiplayerServerBuildSelectionCriterion"
description: "PFMultiplayerServerBuildSelectionCriterion data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerBuildSelectionCriterion  

PFMultiplayerServerBuildSelectionCriterion data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerBuildSelectionCriterion {  
    uint32_t buildWeightDistributionCount;  
} PFMultiplayerServerBuildSelectionCriterion;  
```
  
### Members  
  
**`buildWeightDistributionCount`** &nbsp; uint32_t  
*array of size `buildWeightDistributionCount`*  
  
(Optional) Dictionary of build ids and their respective weights for distribution of allocation requests.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
