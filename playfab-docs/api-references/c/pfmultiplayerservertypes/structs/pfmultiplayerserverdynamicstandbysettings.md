---
author: jasonsandlin
title: "PFMultiplayerServerDynamicStandbySettings"
description: "PFMultiplayerServerDynamicStandbySettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerDynamicStandbySettings  

PFMultiplayerServerDynamicStandbySettings data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerDynamicStandbySettings {  
    PFMultiplayerServerDynamicStandbyThreshold const* dynamicFloorMultiplierThresholds;  
    uint32_t dynamicFloorMultiplierThresholdsCount;  
    bool isEnabled;  
    int32_t const* rampDownSeconds;  
} PFMultiplayerServerDynamicStandbySettings;  
```
  
### Members  
  
**`dynamicFloorMultiplierThresholds`** &nbsp; [PFMultiplayerServerDynamicStandbyThreshold](pfmultiplayerserverdynamicstandbythreshold.md) const*  
*may be nullptr*  
  
(Optional) List of auto standing by trigger values and corresponding standing by multiplier. Defaults to 1.5X at 50%, 3X at 25%, and 4X at 5%.
  
**`dynamicFloorMultiplierThresholdsCount`** &nbsp; uint32_t  
  
Count of dynamicFloorMultiplierThresholds
  
**`isEnabled`** &nbsp; bool  
  
When true, dynamic standby will be enabled.
  
**`rampDownSeconds`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The time it takes to reduce target standing by to configured floor value after an increase. Defaults to 30 minutes.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
