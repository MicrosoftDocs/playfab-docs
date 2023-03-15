---
author: jasonsandlin
title: "PFMultiplayerServerDynamicStandbyThreshold"
description: "PFMultiplayerServerDynamicStandbyThreshold data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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

  
  
