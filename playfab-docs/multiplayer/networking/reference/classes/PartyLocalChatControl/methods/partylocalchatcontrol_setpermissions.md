---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetPermissions"
description: Sets the chat permissions between the local chat control and a target chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyLocalChatControl::SetPermissions  

Sets the chat permissions between the local chat control and a target chat control.  

## Syntax  
  
```cpp
PartyError SetPermissions(  
    const PartyChatControl* targetChatControl,  
    PartyChatPermissionOptions chatPermissionOptions  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`chatPermissionOptions`** &nbsp; [PartyChatPermissionOptions](../../../enums/partychatpermissionoptions.md)  
  
The chat permission options.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Chat permissions allow you to control incoming and outgoing voice communication, as well as incoming text communication, between any pair of chat controls. The chat permissions should be configured to reflect your target scenario. For example, if the target chat control is a member of the same team, you'd likely allow audio in both directions. If the target chat control is a member of an opposing team, you likely wouldn't allow audio in either direction. Regardless of team, you might allow receiving text. <br /><br /> The target chat control must be remote. The default permission is [PartyChatPermissionOptions::None](../../../enums/partychatpermissionoptions.md).   <br /><br /> This setting is local only. If a local chat control is configured to send audio to a remote chat control, no audio will be sent to the remote chat control unless the remote chat control has also been configured to receive audio from the local chat control in their instance of the library. Similarly, if a local chat control is configured to receive audio from a remote chat control, no audio will be received from the remote chat control unless the remote chat control has also been configured to send audio to the local chat control in their instance of the library. Therefore, both chat controls must agree that the communication is allowed; one chat control can't force another to accept or transmit undesired chat.   <br /><br /> There is no permission associated with sending chat text because each call to [SendText()](partylocalchatcontrol_sendtext.md) requires an explicit list of target chat controls. Including or omitting a target is equivalent to granting or denying send permission for that text message. The target still must have set [PartyChatPermissionOptions::ReceiveText](../../../enums/partychatpermissionoptions.md) in their instance of the library for it to actually be delivered.   <br /><br /> The Party library does not enforce platform restrictions tied to the user's identity, such as a platform setting that restricts chat to "friends only". Platform restrictions should be considered when configuring the chat permissions between two chat controls.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
