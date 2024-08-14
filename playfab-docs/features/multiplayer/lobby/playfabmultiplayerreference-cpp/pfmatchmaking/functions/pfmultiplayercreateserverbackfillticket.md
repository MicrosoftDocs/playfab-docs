---
author: ScottMunroMS
title: "PFMultiplayerCreateServerBackfillTicket"
description: "Creates a server backfill ticket."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/12/2024
---

# PFMultiplayerCreateServerBackfillTicket  

Creates a server backfill ticket.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerCreateServerBackfillTicket(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* server,  
    const PFMatchmakingServerBackfillTicketConfiguration* configuration,  
    void* asyncContext,  
    PFMatchmakingTicketHandle* ticket  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`server`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The server entity.  
  
**`configuration`** &nbsp; [PFMatchmakingServerBackfillTicketConfiguration*](../structs/pfmatchmakingserverbackfillticketconfiguration.md)  
  
The backfill ticket configuration.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle*  
*library-allocated output*  
  
The resulting ticket object.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFMatchmaking.h. <br /><br /> The library automatically, and asynchronously, submits a server backfill ticket to the matchmaking service. Each time the ticket status changes, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) is provided. The ticket status can be queried at any time via [PFMatchmakingTicketGetStatus()](pfmatchmakingticketgetstatus.md). The ticket immediately starts in the ```PFMatchmakingTicketStatus::Creating``` state.   <br /><br /> When the ticket completed, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) is provided. At that point, a match for the backfill ticket is found or the ticket stopped due to failure. On success, the match that was found can be queried via [PFMatchmakingTicketGetMatch()](pfmatchmakingticketgetmatch.md). The ```regionPreferences``` in [PFMatchmakingMatchDetails](../structs/pfmatchmakingmatchdetails.md) only contains the region that the server is located in.   <br /><br /> If ticket creation fails because there are already too many tickets for the users specified in the configuration, the library transparently cancels those outstanding tickets and then retries ticket creation.   <br /><br /> This function requires that a previous call to [PFMultiplayerSetEntityToken()](../../pfmultiplayer/functions/pfmultiplayersetentitytoken.md) was made to set the game server entity token.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
