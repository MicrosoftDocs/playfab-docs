---
author: ScottMunroMS
title: "PFMatchmakingTicketStatusChangedStateChange"
description: "Information specific to the *TicketStatusChanged* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFMatchmakingTicketStatusChangedStateChange  

Information specific to the *TicketStatusChanged* type of state change.  

## Syntax  
  
```cpp
<<<<<<< HEAD
struct PFMatchmakingTicketStatusChangedStateChange {  
=======
struct PFMatchmakingTicketStatusChangedStateChange : PFMatchmakingStateChange {  
>>>>>>> main
    PFMatchmakingTicketHandle ticket;  
}  
```
  
### Members  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
<<<<<<< HEAD
*_Notnull_*  
=======
*must not be null*  
>>>>>>> main
  
The matchmaking ticket whose status changed.
  
The new ticket status can be retrieved via [PFMatchmakingTicketGetStatus](../functions/pfmatchmakingticketgetstatus.md).
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
