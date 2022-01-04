---
author: ScottMunroMS
title: "PFMatchmakingTicketCompletedStateChange"
description: "Information specific to the *TicketCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFMatchmakingTicketCompletedStateChange  

Information specific to the *TicketCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFMatchmakingTicketCompletedStateChange {  
    result ;  
    _Notnull_ ticket;  
    void* asyncContext;  
} PFMatchmakingTicketCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
An error code indicating whether the ticket succeeded or, if it failed, why it failed.
  
**`ticket`** &nbsp; _Notnull_  
  
The matchmaking ticket that completed.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
