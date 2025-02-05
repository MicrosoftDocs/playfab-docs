---
author: jasonsandlin
title: "PFVersionConfiguration"
description: "PFVersionConfiguration data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFVersionConfiguration  

PFVersionConfiguration data model.  

## Syntax  
  
```cpp
typedef struct PFVersionConfiguration {  
    int32_t maxQueryableVersions;  
    PFResetInterval resetInterval;  
} PFVersionConfiguration;  
```
  
### Members  
  
**`maxQueryableVersions`** &nbsp; int32_t  
  
The maximum number of versions of this leaderboard/statistic that can be queried. .
  
**`resetInterval`** &nbsp; [PFResetInterval](../enums/pfresetinterval.md)  
  
Reset interval that statistics or leaderboards will reset on. When using Manual intervalthe reset can only be increased by calling the Increase version API. When using Hour interval the resetwill occur at the start of the next hour UTC time. When using Day interval the reset will occur at thestart of the next day in UTC time. When using the Week interval the reset will occur at the start ofthe next Monday in UTC time. When using Month interval the reset will occur at the start of the nextmonth in UTC time.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
