---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetTranscriptionOptions"
description: Provides the transcription options associated with voice chat audio for this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyLocalChatControl::GetTranscriptionOptions  

Provides the transcription options associated with voice chat audio for this chat control.  

## Syntax  
  
```cpp
PartyError GetTranscriptionOptions(  
    PartyVoiceChatTranscriptionOptions* options  
)  
```  
  
### Parameters  
  
**`options`** &nbsp; [PartyVoiceChatTranscriptionOptions*](../../../enums/partyvoicechattranscriptionoptions.md)  
*output*  
  
Options associated with voice chat transcription, such as whether it should be enabled only for the local chat control, remote chat controls, or none.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Transcription is the process of generating strings representing spoken phrases in voice chat. The options specified via `options` specify the chat controls that should generate these transcription strings, which are subsequently provided to the local chat control via [PartyVoiceChatTranscriptionReceivedStateChange](../../../structs/partyvoicechattranscriptionreceivedstatechange.md)s. <br /><br /> Only chat controls configured to use a language that supports transcription, via [PartyLocalDevice::CreateChatControl()](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md), will provide transcriptions.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
