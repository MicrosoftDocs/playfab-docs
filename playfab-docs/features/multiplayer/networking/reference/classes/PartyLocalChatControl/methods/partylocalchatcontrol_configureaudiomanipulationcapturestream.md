---
author: jdeweyMSFT
title: "PartyLocalChatControl::ConfigureAudioManipulationCaptureStream"
description: Queues an asynchronous operation to configure the audio manipulation capture stream.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 08/21/2020
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
  
If the configuration is non-null, a capture stream will be created for this chat control. This capture stream acts as the voice input for this chat control and is sent to all chat controls that this chat control is configured to communicate with. If the configuration is null, and a capture stream has previously been configured, the capture stream will be destroyed. <br /><br /> Upon completion of the asynchronous operation, when a non-null configuration was specified, a capture stream for this chat control can be queried via [PartyLocalChatControl::GetAudioManipulationCaptureStream()](partylocalchatcontrol_getaudiomanipulationcapturestream.md). Completion is indicated by a [PartyConfigureAudioManipulationCaptureStreamCompletedStateChange](../../../structs/partyconfigureaudiomanipulationcapturestreamcompletedstatechange.md).   

### Platform support and supported formats

 This function is only supported on Windows and Xbox. Calls on other platforms will fail.   <br /><br /> The following format options are supported.   <br /><br />

| Format option | Supported value |
| --- | --- |
| Samples per second | 24 kHz |
| Channel mask | 0 |
| Channel count | 1 |
| Bits per sample | 32 |
| Sample type | ```PartyAudioSampleType::Float``` |
| Interleaved | false |
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
