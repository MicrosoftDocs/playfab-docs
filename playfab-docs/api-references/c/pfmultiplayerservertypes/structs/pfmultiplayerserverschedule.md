---
author: jasonsandlin
title: "PFMultiplayerServerSchedule"
description: "PFMultiplayerServerSchedule data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerSchedule  

PFMultiplayerServerSchedule data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerSchedule {  
    const char* description;  
    time_t endTime;  
    bool isDisabled;  
    bool isRecurringWeekly;  
    time_t startTime;  
    int32_t targetStandby;  
} PFMultiplayerServerSchedule;  
```
  
### Members  
  
**`description`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) A short description about this schedule. For example, "Game launch on July 15th".
  
**`endTime`** &nbsp; time_t  
  
The date and time in UTC at which the schedule ends. If IsRecurringWeekly is true, this schedule will keep renewing for future weeks until disabled or removed.
  
**`isDisabled`** &nbsp; bool  
  
Disables the schedule.
  
**`isRecurringWeekly`** &nbsp; bool  
  
If true, the StartTime and EndTime will get renewed every week.
  
**`startTime`** &nbsp; time_t  
  
The date and time in UTC at which the schedule starts.
  
**`targetStandby`** &nbsp; int32_t  
  
The standby target to maintain for the duration of the schedule.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
