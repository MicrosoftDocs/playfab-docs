---
author: ScottMunroMS
title: "PFMatchmakingTicketGetMatch"
description: "Provides the match, if one has been found."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFMatchmakingTicketGetMatch  

Provides the match, if one has been found.  

## Syntax  
  
```cpp
HRESULT PFMatchmakingTicketGetMatch(  
    PFMatchmakingTicketHandle ticket,  
    const PFMatchmakingMatchDetails** match  
)  
```  
  
### Parameters  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
The handle of the matchmaking ticket.  
  
**`match`** &nbsp; [PFMatchmakingMatchDetails**](../structs/pfmatchmakingmatchdetails.md)  
*library-allocated output*  
  
The match that was found.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method will fail if the ticket isn't in the ```PFMatchmakingTicketStatus::Matched``` state. The ticket state can be retrieved via [PFMatchmakingTicketGetStatus](pfmatchmakingticketgetstatus.md).
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
