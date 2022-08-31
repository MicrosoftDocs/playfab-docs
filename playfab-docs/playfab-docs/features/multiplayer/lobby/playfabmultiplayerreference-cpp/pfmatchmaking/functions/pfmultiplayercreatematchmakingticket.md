---
author: ScottMunroMS
title: "PFMultiplayerCreateMatchmakingTicket"
description: "Creates a matchmaking ticket for one or more local users."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/16/2022
---

# PFMultiplayerCreateMatchmakingTicket  

Creates a matchmaking ticket for one or more local users.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerCreateMatchmakingTicket(  
    PFMultiplayerHandle handle,  
    uint32_t localUserCount,  
    const PFEntityKey* localUsers,  
    const char* const* localUserAttributes,  
    const PFMatchmakingTicketConfiguration* configuration,  
    void* asyncContext,  
    PFMatchmakingTicketHandle* ticket  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`localUserCount`** &nbsp; uint32_t  
  
The count of local users to include in the ticket.  
  
**`localUsers`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*input array of size `localUserCount`*  
  
The array of local users to include in the ticket.  
  
**`localUserAttributes`** &nbsp; char* const*  
*input array of size `localUserCount`*  
  
The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, ```{"player_color":"blue","player_role":"tank"}```.  
  
**`configuration`** &nbsp; [PFMatchmakingTicketConfiguration*](../structs/pfmatchmakingticketconfiguration.md)  
  
The ticket configuration.  
  
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
  
The library automatically, and asynchronously, will submit all local users on a ticket to the matchmaking service. Each time the ticket status changes, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) will be provided. The ticket status can be quered at any time via [PFMatchmakingTicketGetStatus()](pfmatchmakingticketgetstatus.md). The ticket immediately starts in the ```PFMatchmakingTicketStatus::Creating``` state. <br /><br /> When the ticket has completed, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [PFMatchmakingTicketGetMatch()](pfmatchmakingticketgetmatch.md).   <br /><br /> All existing tickets in which a local user is a member will be canceled as part of this operation.   <br /><br /> A match can't be found until all remote users specified in the ```membersToMatchWith``` field of the ```configuration``` parameter have joined the ticket via [PFMultiplayerJoinMatchmakingTicketFromId()](pfmultiplayerjoinmatchmakingticketfromid.md).
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
