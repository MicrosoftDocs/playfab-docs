---
author: ScottMunroMS
title: "PFMatchmakingServerBackfillTicketConfiguration"
description: "Defines the configuration for a server backfill ticket."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/14/2023
---

# PFMatchmakingServerBackfillTicketConfiguration  

Defines the configuration for a server backfill ticket.  

## Syntax  
  
```cpp
struct PFMatchmakingServerBackfillTicketConfiguration {  
    uint32_t timeoutInSeconds;  
    const char* queueName;  
    uint32_t memberCount;  
    const PFMatchmakingMatchMember* members;  
    const PFMultiplayerServerDetails* serverDetails;  
}  
```
  
### Members  
  
**`timeoutInSeconds`** &nbsp; uint32_t  
  
How long to attempt filling the ticket, in seconds.
  
**`queueName`** &nbsp; const char*  
*is null-terminated*  
  
The name of a match queue.
  
**`memberCount`** &nbsp; uint32_t  
  
The number of members currently in the match.
  
**`members`** &nbsp; const [PFMatchmakingMatchMember](pfmatchmakingmatchmember.md)*  
*array of size `memberCount`*  
  
The members currently in the match.
  
**`serverDetails`** &nbsp; const [PFMultiplayerServerDetails](pfmultiplayerserverdetails.md)*  
*may be nullptr*  
  
The details about the PlayFab Multiplayer Server that the ticket is for.
  
The supplied server details will be provided in the [PFMatchmakingMatchDetails](pfmatchmakingmatchdetails.md) for any other clients that are matched with this ticket. Clients will be able to use this information to the connect to the game server. <br /><br /> The server details are optional. If no server details need to be provided to clients on match completion, this value can be nullptr. Similarly, any of the fields in the server details don't need to be provided to clients can be empty or nullptr.
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFMatchmaking.h.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
