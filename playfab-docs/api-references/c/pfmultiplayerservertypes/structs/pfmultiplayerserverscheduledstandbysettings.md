---
author: jasonsandlin
title: "PFMultiplayerServerScheduledStandbySettings"
description: "PFMultiplayerServerScheduledStandbySettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFMultiplayerServerScheduledStandbySettings  

PFMultiplayerServerScheduledStandbySettings data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerScheduledStandbySettings {  
    bool isEnabled;  
    PFMultiplayerServerSchedule const* scheduleList;  
    uint32_t scheduleListCount;  
} PFMultiplayerServerScheduledStandbySettings;  
```
  
### Members  
  
**`isEnabled`** &nbsp; bool  
  
When true, scheduled standby will be enabled.
  
**`scheduleList`** &nbsp; [PFMultiplayerServerSchedule](pfmultiplayerserverschedule.md) const*  
*may be nullptr*  
  
(Optional) A list of non-overlapping schedules.
  
**`scheduleListCount`** &nbsp; uint32_t  
  
Count of scheduleList
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
