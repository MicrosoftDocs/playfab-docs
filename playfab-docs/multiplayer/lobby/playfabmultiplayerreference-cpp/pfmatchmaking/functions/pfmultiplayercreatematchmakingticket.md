---
author: ScottMunroMS
title: "PFMultiplayerCreateMatchmakingTicket"
description: "Creates a matchmaking ticket for one or more local users."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
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
  
**`localUsers`** &nbsp; [const PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*input array of size `localUserCount`*  
  
The array of local users to include in the ticket.  
  
**`localUserAttributes`** &nbsp; const char* const*  
*input array of size `localUserCount`*  
  
The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, ```{"player_color":"blue","player_role":"tank"}```.  
  
**`configuration`** &nbsp; [const PFMatchmakingTicketConfiguration*](../structs/pfmatchmakingticketconfiguration.md)  
  
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
  
The function can return these errors before it starts the asynchronous operation:

| Error | Cause |
| --- | --- |
| `E_POINTER` | `configuration` or `ticket` is `nullptr`, or `localUserCount` is greater than 0 and `localUsers` or `localUserAttributes` is `nullptr`. |
| `0x89236309` | `localUserCount` is 0. Specify at least one local user. |
| `0x89236308` | A user appears more than once in `localUsers`, more than once in the `membersToMatchWith` field of `configuration`, or in both lists. |

For the list of error codes, see [PlayFab Multiplayer C++ SDK error codes](../../pfmultiplayererrors.md).
  
## Remarks  
  
The library automatically, and asynchronously, submits all specified local users on a ticket to the matchmaking service. Each time the ticket status changes, a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) is provided. The ticket status can be queried at any time via [PFMatchmakingTicketGetStatus()](pfmatchmakingticketgetstatus.md). The ticket immediately starts in the ```PFMatchmakingTicketStatus::Creating``` state. <br /><br /> When the ticket completes, the library provides a [PFMatchmakingTicketStatusChangedStateChange](../structs/pfmatchmakingticketstatuschangedstatechange.md) with the final status, followed by a [PFMatchmakingTicketCompletedStateChange](../structs/pfmatchmakingticketcompletedstatechange.md) whose `result` field reports success or the failure reason and whose `asyncContext` field contains the value you passed to this call. At that point, a match was found or the ticket stopped due to failure. If you destroy the ticket with [PFMultiplayerDestroyMatchmakingTicket](pfmultiplayerdestroymatchmakingticket.md) before it completes, the library doesn't provide the completion state change. On success, the match that was found can be queried via [PFMatchmakingTicketGetMatch()](pfmatchmakingticketgetmatch.md).   <br /><br /> If ticket creation fails because there are already too many tickets for the specified users, the library transparently cancels those outstanding tickets and then retries ticket creation.   <br /><br /> A match can't be found until all remote users specified in the ```membersToMatchWith``` field of the ```configuration``` parameter join the ticket via [PFMultiplayerJoinMatchmakingTicketFromId()](pfmultiplayerjoinmatchmakingticketfromid.md).  
## Requirements  
  
**Header:** PFMatchmaking.h  
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
