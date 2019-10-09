---
author: jdeweyMSFT
title: "PartyNetwork::GetChatControls"
description: Gets the chat controls connected to this network.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyNetwork::GetChatControls  

Gets the chat controls connected to this network.  

## Syntax  
  
```cpp
PartyError GetChatControls(  
    uint32_t* chatControlCount,  
    PartyChatControlArray* chatControls  
)  
```  
  
### Parameters  
  
**`chatControlCount`** &nbsp; uint32_t*  
*library-allocated output*  
  
The output number of chat controls in this network.  
  
**`chatControls`** &nbsp; [PartyChatControlArray*](../../../typedefs.md)  
*library-allocated output array of size `*chatControlCount`*  
  
A library-allocated output array containing the chat controls in this network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The returned array is valid until the next call to either [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or [ConnectChatControl()](partynetwork_connectchatcontrol.md) on this network.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  

  
  
