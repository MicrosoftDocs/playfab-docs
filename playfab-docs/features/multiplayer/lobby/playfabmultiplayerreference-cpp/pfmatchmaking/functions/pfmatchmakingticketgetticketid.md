---
author: ScottMunroMS
title: "PFMatchmakingTicketGetTicketId"
description: "Provides the ticket ID."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 07/14/2023
---

# PFMatchmakingTicketGetTicketId  

Provides the ticket ID.  

## Syntax  
  
```cpp
HRESULT PFMatchmakingTicketGetTicketId(  
    PFMatchmakingTicketHandle ticket,  
    const char** id  
)  
```  
  
### Parameters  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
The handle of the matchmaking ticket.  
  
**`id`** &nbsp; char**  
*library-allocated output*  
  
The ticket ID.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
The ticket ID will be an empty string if it has not yet been set. This can occur under one of the following conditions:
* The ticket is in the ```PFMatchmakingTicketStatus::Creating``` state
* The ticket is in the ```PFMatchmakingTicketStatus::Failed``` state due to failure to submit a ticket to the matchmaking service
* The ticket was canceled before it could be submitted to the matchmaking service
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
