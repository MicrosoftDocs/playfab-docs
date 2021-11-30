---
author: tomcoMSFT
title: "PFMatchmakingTicketGetStatus"
description: "Provides the matchmaking ticket status."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/09/2021
---

# PFMatchmakingTicketGetStatus  

Provides the matchmaking ticket status.  

## Syntax  
  
```cpp
HRESULT PFMatchmakingTicketGetStatus(  
    PFMatchmakingTicketHandle ticket,  
    PFMatchmakingTicketStatus* status  
)  
```  
  
### Parameters  
  
**`ticket`** &nbsp; PFMatchmakingTicketHandle  
  
TBD    
  
**`status`** &nbsp; [PFMatchmakingTicketStatus*](../enums/pfmatchmakingticketstatus.md)  
*output*  
  
The matchmaking ticket status.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
