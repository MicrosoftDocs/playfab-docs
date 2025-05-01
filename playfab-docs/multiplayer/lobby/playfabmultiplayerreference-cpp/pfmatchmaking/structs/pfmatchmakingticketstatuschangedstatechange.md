---
author: ScottMunroMS
title: "PFMatchmakingTicketStatusChangedStateChange"
description: "Information specific to the *TicketStatusChanged* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMatchmakingTicketStatusChangedStateChange  

Information specific to the *TicketStatusChanged* type of state change.  

## Syntax  
  
```cpp
struct PFMatchmakingTicketStatusChangedStateChange : PFMatchmakingStateChange {  
    PFMatchmakingTicketHandle ticket;  
}  
```
  
### Members  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
*must not be null*  
  
The matchmaking ticket whose status changed.
  
The new ticket status can be retrieved via [PFMatchmakingTicketGetStatus](../functions/pfmatchmakingticketgetstatus.md).
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
