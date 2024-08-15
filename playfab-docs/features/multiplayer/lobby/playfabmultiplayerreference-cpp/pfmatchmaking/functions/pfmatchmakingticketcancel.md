---
author: ScottMunroMS
title: "PFMatchmakingTicketCancel"
description: "Cancels the ticket."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFMatchmakingTicketCancel  

Cancels the ticket.  

## Syntax  
  
```cpp
HRESULT PFMatchmakingTicketCancel(  
    PFMatchmakingTicketHandle ticket  
)  
```  
  
### Parameters  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
The handle of the matchmaking ticket.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous operation to cancel this matchmaking ticket. On success, a [PFMatchmakingTicketCompletedStateChange](../structs/pfmatchmakingticketcompletedstatechange.md) will be provided indicating that the ticket has been canceled. <br /><br /> This method does not guarantee the ticket will be canceled. The ticket may complete before the cancelation can be processed, or the cancelation request may fail due to networking or service errors. If the cancelation attempt fails but is retriable, the library will continue to retry the cancelation. Otherwise, a [PFMatchmakingTicketCompletedStateChange](../structs/pfmatchmakingticketcompletedstatechange.md) will be provided that indicates the ticket failed.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
