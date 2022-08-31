---
author: ScottMunroMS
title: "PFMultiplayerJoinMatchmakingTicketFromId"
description: "Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFMultiplayerJoinMatchmakingTicketFromId  

Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerJoinMatchmakingTicketFromId(  
    PFMultiplayerHandle handle,  
    uint32_t localUserCount,  
    const PFEntityKey* localUsers,  
    const char* localUserAttributes,  
    const char* ticketId,  
    const char* queueName,  
    void* asyncContext,  
    PFMatchmakingTicketHandle* ticket  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`localUserCount`** &nbsp; uint32_t  
  
The count of local users to join the ticket.  
  
**`localUsers`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*input array of size `localUserCount`*  
  
The array of local users to join to the ticket.  
  
**`localUserAttributes`** &nbsp; char*  
*input array of size `localUserCount`*  
  
The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, ```{"player_color":"blue","player_role":"tank"}```.  
  
**`ticketId`** &nbsp; char*  
*is null-terminated*  
  
The ID of the ticket to join.  
  
**`queueName`** &nbsp; char*  
*is null-terminated*  
  
The queue to which the ticket belongs.  
  
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
  
The library automatically, and asynchronously, will submit all local users to join the ticket on the matchmaking service. Each time the ticket status changes, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) will be provided. The ticket status can be quered at any time via [PFMatchmakingTicketGetStatus()](pfmatchmakingticketgetstatus.md). The ticket immediately starts in the ```PFMatchmakingTicketStatus::Joining``` state. <br /><br /> When the ticket has completed, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [PFMatchmakingTicketGetMatch()](pfmatchmakingticketgetmatch.md).   <br /><br /> All existing tickets in which a local user is a member will be canceled as part of this operation.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
