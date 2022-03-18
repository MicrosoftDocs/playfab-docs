---
author: ScottMunroMS
title: "PFMatchmakingTicketCompletedStateChange"
description: "Information specific to the *TicketCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFMatchmakingTicketCompletedStateChange  

Information specific to the *TicketCompleted* type of state change.  

## Syntax  
  
```cpp
<<<<<<< HEAD
struct PFMatchmakingTicketCompletedStateChange {  
=======
struct PFMatchmakingTicketCompletedStateChange : PFMatchmakingStateChange {  
>>>>>>> main
    HRESULT result;  
    PFMatchmakingTicketHandle ticket;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
An error code indicating whether the ticket succeeded or, if it failed, why it failed.
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
<<<<<<< HEAD
*_Notnull_*  
=======
*must not be null*  
>>>>>>> main
  
The matchmaking ticket that completed.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
