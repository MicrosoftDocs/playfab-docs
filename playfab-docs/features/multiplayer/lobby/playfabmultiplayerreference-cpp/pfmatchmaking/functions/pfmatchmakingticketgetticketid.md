---
author: tomcoMSFT
title: "PFMatchmakingTicketGetTicketId"
description: "Provides the ticket ID."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
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
  
The ticket ID will be an empty string if the ticket is in the ```PFMatchmakingTicketStatus::Creating``` state or if the ticket is in the ```PFMatchmakingTicketStatus::Failed``` state due to failure to submit a ticket to the matchmaking service. The ticket state can be retrieved via [PFMatchmakingTicketGetStatus](pfmatchmakingticketgetstatus.md).
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
