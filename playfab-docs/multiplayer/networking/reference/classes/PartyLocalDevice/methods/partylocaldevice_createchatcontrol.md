---
author: jdeweyMSFT
title: "PartyLocalDevice::CreateChatControl"
description: Queues an asynchronous operation to create a local chat control for the specified user.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/22/2024
---

# PartyLocalDevice::CreateChatControl  

Queues an asynchronous operation to create a local chat control for the specified user.  

## Syntax  
  
```cpp
PartyError CreateChatControl(  
    const PartyLocalUser* localUser,  
    PartyString languageCode,  
    void* asyncIdentifier,  
    PartyLocalChatControl** localChatControl  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user for the new local chat control.  
  
**`languageCode`** &nbsp; [PartyString](../../../typedefs.md)  
*optional*  
  
The optional language to use.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`localChatControl`** &nbsp; [PartyLocalChatControl**](../../PartyLocalChatControl/partylocalchatcontrol.md)  
*optional, library-allocated output*  
  
The optional, output local chat control.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to create a chat control began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If this method returns success, a [PartyCreateChatControlCompletedStateChange](../../../structs/partycreatechatcontrolcompletedstatechange.md) will be generated to provide the result of the asynchronous operation. If the asynchronous operation succeeds, a [PartyChatControlCreatedStateChange](../../../structs/partychatcontrolcreatedstatechange.md) will be generated. If the operation fails, a [PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md) will be generated. This method itself does not make the chat control visible to any remote devices. To announce this chat control to remote devices, the title should call [PartyNetwork::ConnectChatControl()](../../PartyNetwork/methods/partynetwork_connectchatcontrol.md). <br /><br /> On successful return, this method invalidates the memory for any array previously returned by [PartyManager::GetChatControls()](../../PartyManager/methods/partymanager_getchatcontrols.md) or [PartyDevice::GetChatControls()](../../PartyDevice/methods/partydevice_getchatcontrols.md) for the local device, as it synchronously adds the new chat control to the arrays. [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) also invalidates the memory for these arrays. The returned `localChatControl` object will be valid until a PartyChatControlDestroyedStateChange has been generated and all state changes referencing the object have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).   <br /><br /> The language associated with this chat control can optionally be specified via the `languageCode` parameter. If no language is specified, the user's default, as determined by the platform, will be used. The language is used as the spoken language associated with this chat control for transcription and the target language for incoming translations. If the language code specified is en-US, for instance, the input audio to this chat control will be treated as the English (United States) language and transcribed as such. If translation is enabled via either [PartyLocalChatControl::SetTranscriptionOptions()](../../PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) or [PartyLocalChatControl::SetTextChatOptions()](../../PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md), the incoming voice chat transcriptions and/or text chat will be translated to English (United States).   <br /><br /> The language code should be in BCP 47 format; supported language codes are enumerated in [Language support](/azure/ai-services/speech-service/language-support). Specifying an unsupported or invalid language code will not cause this method to fail, but will result in failure to generate transcriptions associated with this chat control. The language code used with this method can be queried via [PartyLocalChatControl::GetLanguage()](../../PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalDevice](../partylocaldevice.md)  
[PartyCreateChatControlCompletedStateChange](../../../structs/partycreatechatcontrolcompletedstatechange.md)  
[PartyChatControlCreatedStateChange](../../../structs/partychatcontrolcreatedstatechange.md)  
[PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)  
[PartyManager::GetChatControls](../../PartyManager/methods/partymanager_getchatcontrols.md)  
[PartyDevice::GetChatControls](../../PartyDevice/methods/partydevice_getchatcontrols.md)  
[PartyNetwork::ConnectChatControl](../../PartyNetwork/methods/partynetwork_connectchatcontrol.md)  
[PartyLocalChatControl::GetLanguage](../../PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md)  
[PartyLocalChatControl::SetTranscriptionOptions](../../PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md)  
[PartyLocalChatControl::SetTranscriptionOptions](../../PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md)
  
  
