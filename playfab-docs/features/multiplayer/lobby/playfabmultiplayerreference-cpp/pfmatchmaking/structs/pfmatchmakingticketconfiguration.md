---
author: ScottMunroMS
title: "PFMatchmakingTicketConfiguration"
description: "Defines the configuration for a matchmaking ticket."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFMatchmakingTicketConfiguration  

Defines the configuration for a matchmaking ticket.  

## Syntax  
  
```cpp
struct PFMatchmakingTicketConfiguration {  
    uint32_t timeoutInSeconds;  
    const char* queueName;  
    uint32_t membersToMatchWithCount;  
    const PFEntityKey* membersToMatchWith;  
}  
```
  
### Members  
  
**`timeoutInSeconds`** &nbsp; uint32_t  
  
How long to attempt matchmaking the ticket, in seconds.
  
**`queueName`** &nbsp; const char*  
*is null-terminated*  
  
The name of a match queue.
  
**`membersToMatchWithCount`** &nbsp; uint32_t  
  
The number of other specific users expected to join the ticket.
  
**`membersToMatchWith`** &nbsp; const [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)*  
*array of size `membersToMatchWithCount`*  
  
The PlayFab Entity Keys of other specific users expected to join the ticket.
  
This field specifies the number of other specific users expected to join the ticket. Typically this list represents a group of friends or fireteam that are looking for a match together. A match can't be found until all specified users join the ticket via [PFMultiplayerJoinMatchmakingTicketFromId](../functions/pfmultiplayerjoinmatchmakingticketfromid.md).
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
