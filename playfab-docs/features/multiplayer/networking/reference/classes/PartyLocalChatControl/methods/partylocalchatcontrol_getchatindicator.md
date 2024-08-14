---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetChatIndicator"
description: Provides a chat indicator specifying the audio state of a target chat control in relation to the local chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetChatIndicator  

Provides a chat indicator specifying the audio state of a target chat control in relation to the local chat control.  

## Syntax  
  
```cpp
PartyError GetChatIndicator(  
    const PartyChatControl* targetChatControl,  
    PartyChatControlChatIndicator* chatIndicator  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`chatIndicator`** &nbsp; [PartyChatControlChatIndicator*](../../../enums/partychatcontrolchatindicator.md)  
*output*  
  
The chat indicator.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This indicator is intended to assist UI iconic representation so that users can determine why they're hearing/ seeing what they are ("who's that talking?"), or why not. <br /><br /> This value changes frequently and is typically polled every graphics frame.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
