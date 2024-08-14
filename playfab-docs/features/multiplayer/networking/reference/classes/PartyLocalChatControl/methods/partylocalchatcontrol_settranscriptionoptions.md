---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetTranscriptionOptions"
description: Configures the transcription options associated with voice chat audio for this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
---

# PartyLocalChatControl::SetTranscriptionOptions  

Configures the transcription options associated with voice chat audio for this chat control.  

## Syntax  
  
```cpp
PartyError SetTranscriptionOptions(  
    PartyVoiceChatTranscriptionOptions options,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`options`** &nbsp; [PartyVoiceChatTranscriptionOptions](../../../enums/partyvoicechattranscriptionoptions.md)  
  
Options associated with voice chat transcription, such as which chat controls should generate transcriptions for the local chat control, and whether those transcriptions should be translated to the local chat control's language.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to set the transcription options began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Transcription is the process of generating strings representing spoken phrases in voice chat. The options specified via `options` specify the chat controls that should generate these transcription strings, which are subsequently provided to the local chat control via [PartyVoiceChatTranscriptionReceivedStateChange](../../../structs/partyvoicechattranscriptionreceivedstatechange.md)s. <br /><br /> Only chat controls configured to use a language that supports transcription, via [PartyLocalDevice::CreateChatControl()](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md), will provide transcriptions.   <br /><br /> Speech-to-text transcription functionality internally uses available region and latency measurement estimates to optimize service usage. If the [PartyOption::RegionUpdateConfiguration](../../../enums/partyoption.md) option was used to configure an update mode of [PartyRegionUpdateMode::Deferred](../../../enums/partyregionupdatemode.md), then retrieving the set of available regions and measuring connection quality to them may not have started yet, or the last update may have exceeded the configured refresh interval age. If the local device isn't currently connecting or connected to any networks, and the application specifies option flags that include [PartyVoiceChatTranscriptionOptions::TranscribeSelfRegardlessOfNetworkState](../../../enums/partyvoicechattranscriptionoptions.md), then SetTranscriptionOptions() ensures any deferred region update has started and the associated [PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md) is provided prior to this call's [PartySetTranscriptionOptionsCompletedStateChange](../../../structs/partysettranscriptionoptionscompletedstatechange.md) completion.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
