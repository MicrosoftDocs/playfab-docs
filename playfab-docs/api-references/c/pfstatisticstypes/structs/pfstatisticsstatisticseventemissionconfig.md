---
author: jasonsandlin
title: "PFStatisticsStatisticsEventEmissionConfig"
description: "PFStatisticsStatisticsEventEmissionConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsStatisticsEventEmissionConfig  

PFStatisticsStatisticsEventEmissionConfig data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsStatisticsEventEmissionConfig {  
    PFStatisticsStatisticsUpdateEventConfig const* updateEventConfig;  
} PFStatisticsStatisticsEventEmissionConfig;  
```
  
### Members  
  
**`updateEventConfig`** &nbsp; [PFStatisticsStatisticsUpdateEventConfig](pfstatisticsstatisticsupdateeventconfig.md) const*  
*may be nullptr*  
  
(Optional) Emitted when statistics are updated.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
