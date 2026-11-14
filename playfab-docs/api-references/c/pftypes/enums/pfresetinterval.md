---
author: jasonsandlin
title: "PFResetInterval"
description: "ResetInterval enum."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFResetInterval  

ResetInterval enum.    

## Syntax  
  
```cpp
enum class PFResetInterval  : uint32_t  
{  
    Manual,  
    Hour,  
    Day,  
    Week,  
    Month  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Manual | The statistic or leaderboard resets only when you call the API that increments its version. |
| Hour | The reset occurs at the start of the next hour, UTC. |
| Day | The reset occurs at the start of the next day, UTC. |
| Week | The reset occurs at the start of the next Monday, UTC. |
| Month | The reset occurs at the start of the next month, UTC. |
  
  
## Requirements  
  
**Header:** playfab/services/PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
