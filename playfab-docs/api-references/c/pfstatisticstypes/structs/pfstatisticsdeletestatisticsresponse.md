---
author: jasonsandlin
title: "PFStatisticsDeleteStatisticsResponse"
description: "PFStatisticsDeleteStatisticsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsDeleteStatisticsResponse  

PFStatisticsDeleteStatisticsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsDeleteStatisticsResponse {  
    PFEntityKey const* entity;  
} PFStatisticsDeleteStatisticsResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
