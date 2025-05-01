---
author: ScottMunroMS
title: "PFMatchmakingStateChangeType"
description: "The types of state changes that can occur in the Matchmaking library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PFMatchmakingStateChangeType  

The types of state changes that can occur in the Matchmaking library.    

## Syntax  
  
```cpp
enum class PFMatchmakingStateChangeType  : uint32_t  
{  
    TicketStatusChanged = 0,  
    TicketCompleted = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| TicketStatusChanged | A matchmaking ticket status has changed.<br/><br/> The PFMatchmakingStateChange object should be cast to a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) object for more information. |  
| TicketCompleted | A matchmaking ticket has completed.<br/><br/> The PFMatchmakingStateChange object should be cast to a [PFMatchmakingTicketCompletedStateChange](../structs/pfmatchmakingticketcompletedstatechange.md) object for more information. |  
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
