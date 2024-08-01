---
author: ScottMunroMS
title: "PFMatchmakingTicketCompletedStateChange"
description: "Information specific to the *TicketCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMatchmakingTicketCompletedStateChange  

Information specific to the *TicketCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFMatchmakingTicketCompletedStateChange : PFMatchmakingStateChange {  
    HRESULT result;  
    PFMatchmakingTicketHandle ticket;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
An error code indicating whether the ticket succeeded or, if it failed, why it failed.
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
*must not be null*  
  
The matchmaking ticket that completed.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
