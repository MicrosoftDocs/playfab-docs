---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetLocalChatIndicator"
description: Provides a chat indicator specifying the audio state of the local chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetLocalChatIndicator  

Provides a chat indicator specifying the audio state of the local chat control.  

## Syntax  
  
```cpp
PartyError GetLocalChatIndicator(  
    PartyLocalChatControlChatIndicator* chatIndicator  
)  
```  
  
### Parameters  
  
**`chatIndicator`** &nbsp; [PartyLocalChatControlChatIndicator*](../../../enums/partylocalchatcontrolchatindicator.md)  
*output*  
  
The chat indicator.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This indicator is intended to assist UI iconic representation so that users can determine whether their voice audio is being captured and, if not, then why not. <br /><br /> This value changes frequently and is typically polled every graphics frame.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
