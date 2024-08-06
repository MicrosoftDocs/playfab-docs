---
author: jdeweyMSFT
title: "PartyLocalChatControl::ConfigureAudioManipulationCaptureStream"
description: Queues an asynchronous operation to configure the audio manipulation capture stream.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/20/2023
---

# PartyLocalChatControl::ConfigureAudioManipulationCaptureStream  

Queues an asynchronous operation to configure the audio manipulation capture stream.  

## Syntax  
  
```cpp
PartyError ConfigureAudioManipulationCaptureStream(  
    PartyAudioManipulationSinkStreamConfiguration* configuration,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`configuration`** &nbsp; [PartyAudioManipulationSinkStreamConfiguration*](../../../structs/partyaudiomanipulationsinkstreamconfiguration.md)  
*optional*  
  
The stream configuration.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If the configuration is non-null, a capture stream will be created for this chat control. Such a stream acts as the voice input for this chat control that is sent to all other chat controls to which this chat control is configured to communicate. If the configuration is null, and a capture stream has previously been configured, the capture will be destroyed. <br /><br /> Upon completion of the asynchronous operation, when a non-null configuration was specified, a capture stream for this chat control can be queried via [PartyLocalChatControl::GetAudioManipulationCaptureStream()](partylocalchatcontrol_getaudiomanipulationcapturestream.md). Completion is indicated by a [PartyConfigureAudioManipulationCaptureStreamCompletedStateChange](../../../structs/partyconfigureaudiomanipulationcapturestreamcompletedstatechange.md).   

### Platform support and supported formats

 This function is only supported on Windows, Xbox, and PlayStation® 5. Calls on other platforms will fail.   <br /><br /> The following format options are supported for Windows and Xbox.   <br /><br />

| Format option | Supported value |
| --- | --- |
| Samples per second | 24 kHz |
| Channel mask | 0 |
| Channel count | 1 |
| Bits per sample | 32 |
| Sample type | ```PartyAudioSampleType::Float``` |
| Interleaved | false |

<br /><br /> For a list of supported format options for PlayStation® 5, please refer to the README-RealTimeAudioManipulation.md document distributed with the Party library package.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
