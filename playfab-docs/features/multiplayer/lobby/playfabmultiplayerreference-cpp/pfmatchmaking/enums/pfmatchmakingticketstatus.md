---
author: ScottMunroMS
title: "PFMatchmakingTicketStatus"
description: "The possible states for a matchmaking ticket."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFMatchmakingTicketStatus  

The possible states for a matchmaking ticket.    

## Syntax  
  
```cpp
enum class PFMatchmakingTicketStatus  : uint32_t  
{  
    Creating = 0,  
    Joining = 1,  
    WaitingForPlayers = 2,  
    WaitingForMatch = 3,  
    Matched = 4,  
    Canceled = 5,  
    Failed = 6,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Creating | The matchmaking ticket is being created. |  
| Joining | The matchmaking ticket is being joined. |  
| WaitingForPlayers | The matchmaking ticket is waiting for all remote users specified in the ```membersToMatchWith``` field of its configuration to join the ticket via [PFMultiplayerJoinMatchmakingTicketFromId](../functions/pfmultiplayerjoinmatchmakingticketfromid.md). |  
| WaitingForMatch | The matchmaking ticket is waiting for a match to be found. |  
| Matched | The matchmaking ticket has found a match. |  
| Canceled | The matchmaking ticket has been canceled. |  
| Failed | The matchmaking ticket failed to find a match. |  
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
