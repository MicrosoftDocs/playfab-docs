---
author: ScottMunroMS
title: "PFMatchmakingTicketSetCustomContext"
description: "Configures an optional, custom pointer-sized context value with this ticket object."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/15/2023
---

# PFMatchmakingTicketSetCustomContext  

Configures an optional, custom pointer-sized context value with this ticket object.  

## Syntax  
  
```cpp
HRESULT PFMatchmakingTicketSetCustomContext(  
    PFMatchmakingTicketHandle ticket,  
    void* customContext  
)  
```  
  
### Parameters  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
The handle of the matchmaking ticket.  
  
**`customContext`** &nbsp; void*  
*optional*  
  
An arbitrary, pointer-sized value to store with the player object.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if configuring the custom context succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
The custom context is typically used as a "shortcut" that simplifies accessing local, title-specific memory associated with the matchmaking ticket without requiring a mapping lookup. The value is retrieved using the [PFMatchmakingTicketGetCustomContext()](pfmatchmakingticketgetcustomcontext.md) method. <br /><br /> Any configured value is treated as opaque by the library, and is only valid on the local device; it is not transmitted over the network.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  
[PFMatchmakingTicketGetCustomContext](pfmatchmakingticketgetcustomcontext.md)
  
  
