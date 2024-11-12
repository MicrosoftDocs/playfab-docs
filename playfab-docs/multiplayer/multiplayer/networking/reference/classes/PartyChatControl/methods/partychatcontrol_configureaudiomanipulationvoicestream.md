---
author: jdeweyMSFT
title: "PartyChatControl::ConfigureAudioManipulationVoiceStream"
description: Queues an asynchronous operation to configure the audio manipulation voice stream associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/20/2023
---

# PartyChatControl::ConfigureAudioManipulationVoiceStream  

Queues an asynchronous operation to configure the audio manipulation voice stream associated with this chat control.  

## Syntax  
  
```cpp
PartyError ConfigureAudioManipulationVoiceStream(  
    PartyAudioManipulationSourceStreamConfiguration* configuration,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`configuration`** &nbsp; [PartyAudioManipulationSourceStreamConfiguration*](../../../structs/partyaudiomanipulationsourcestreamconfiguration.md)  
*optional*  
  
The stream configuration.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If the configuration is non-null, an audio manipulation voice stream will be created for this chat control. Such a stream redirects output for the voice audio associated with this chat control; instead of the library automatically handling the voice audio and routing it, the app can use the source stream to retrieve the voice audio and route it via game logic. If the configuration is null, and a voice stream has previously been configured, the voice stream will be destroyed. <br /><br /> Upon completion of the asynchronous operation, when a non-null configuration was specified, a voice stream for this chat control can be queried via [PartyChatControl::GetAudioManipulationVoiceStream()](partychatcontrol_getaudiomanipulationvoicestream.md). Completion is indicated by a [PartyConfigureAudioManipulationVoiceStreamCompletedStateChange](../../../structs/partyconfigureaudiomanipulationvoicestreamcompletedstatechange.md).   

### Platform support and supported formats

 This function is only supported on Windows, Xbox, and PlayStation® 5. Calls on other platforms will fail.   <br /><br /> The following format options are supported for Windows and Xbox.   <br /><br />

| Format option | Supported value for local chat controls | Supported value for remote chat controls |
| --- | --- | --- |
| Samples per second | 24 kHz | 24 kHz |
| Channel mask | 0 | 0 |
| Channel count | 1 | 1 |
| Bits per sample | 32 | 16 |
| Sample type | ```PartyAudioSampleType::Float``` | ```PartyAudioSampleType::Integer``` |
| Interleaved | false | false |

<br /><br /> For a list of supported format options for PlayStation® 5, please refer to the README-RealTimeAudioManipulation.md document distributed with the Party library package.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  

  
  
