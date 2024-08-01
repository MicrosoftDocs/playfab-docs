---
author: ScottMunroMS
title: "PFMultiplayerDestroyMatchmakingTicket"
description: "Destroys the matchmaking ticket."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFMultiplayerDestroyMatchmakingTicket  

Destroys the matchmaking ticket.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerDestroyMatchmakingTicket(  
    PFMultiplayerHandle handle,  
    PFMatchmakingTicketHandle ticket  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
The ticket to destroy.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method destroys the matchmaking ticket and reclaims local resources associated with it. If the ticket has not yet completed, a background operation will perform a single best-effort attempt to cancel the ticket with the matchmaking service.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
