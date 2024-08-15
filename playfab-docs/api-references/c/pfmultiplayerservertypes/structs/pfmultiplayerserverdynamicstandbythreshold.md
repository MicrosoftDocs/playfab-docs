---
author: jasonsandlin
title: "PFMultiplayerServerDynamicStandbyThreshold"
description: "PFMultiplayerServerDynamicStandbyThreshold data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerDynamicStandbyThreshold  

PFMultiplayerServerDynamicStandbyThreshold data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerDynamicStandbyThreshold {  
    double multiplier;  
    double triggerThresholdPercentage;  
} PFMultiplayerServerDynamicStandbyThreshold;  
```
  
### Members  
  
**`multiplier`** &nbsp; double  
  
When the trigger threshold is reached, multiply by this value.
  
**`triggerThresholdPercentage`** &nbsp; double  
  
The multiplier will be applied when the actual standby divided by target standby floor is less than this value.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
