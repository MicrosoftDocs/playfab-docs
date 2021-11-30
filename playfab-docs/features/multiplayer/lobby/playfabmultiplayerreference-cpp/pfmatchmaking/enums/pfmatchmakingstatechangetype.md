---
author: tomcoMSFT
title: "PFMatchmakingStateChangeType"
description: "The types of state changes that can occur."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 10/27/2021
---

# PFMatchmakingStateChangeType  

The types of state changes that can occur.    

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

  
  
