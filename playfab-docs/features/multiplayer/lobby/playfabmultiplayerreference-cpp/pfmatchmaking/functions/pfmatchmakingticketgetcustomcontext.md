---
author: ScottMunroMS
title: "PFMatchmakingTicketGetCustomContext"
description: "Retrieves the app's private, custom pointer-sized context value previously associated with this ticket object."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/15/2023
---

# PFMatchmakingTicketGetCustomContext  

Retrieves the app's private, custom pointer-sized context value previously associated with this ticket object.  

## Syntax  
  
```cpp
HRESULT PFMatchmakingTicketGetCustomContext(  
    PFMatchmakingTicketHandle ticket,  
    void** customContext  
)  
```  
  
### Parameters  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
The handle of the matchmaking ticket.  
  
**`customContext`** &nbsp; void**  
*output, may return nullptr*  
  
The output custom context.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if retrieving the custom context succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If no custom context has been set yet, the value pointed to by `customContext` is set to nullptr.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  
[PFMatchmakingTicketSetCustomContext](pfmatchmakingticketsetcustomcontext.md)
  
  
