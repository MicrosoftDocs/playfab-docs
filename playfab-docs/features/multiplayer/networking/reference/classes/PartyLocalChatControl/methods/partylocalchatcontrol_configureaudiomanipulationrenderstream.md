---
author: jdeweyMSFT
title: "PartyLocalChatControl::ConfigureAudioManipulationRenderStream"
description: Queues an asynchronous operation to configure the audio manipulation render stream.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 08/21/2020
---

# PartyLocalChatControl::ConfigureAudioManipulationRenderStream  

Queues an asynchronous operation to configure the audio manipulation render stream.  

## Syntax  
  
```cpp
PartyError ConfigureAudioManipulationRenderStream(  
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
  
If the configuration is non-null, an audio manipulation render stream will be created for this chat control. This render stream acts as the render pipeline for audio that will be rendered to this chat control. If the configuration is null, and a stream has previously been configured, the render stream will be destroyed. <br /><br /> Upon completion of the asynchronous operation, when a non-null configuration was specified, a render stream for this chat control can be queried via [PartyLocalChatControl::GetAudioManipulationRenderStream()](partylocalchatcontrol_getaudiomanipulationrenderstream.md). Completion is indicated by a [PartyConfigureAudioManipulationRenderStreamCompletedStateChange](../../../structs/partyconfigureaudiomanipulationrenderstreamcompletedstatechange.md).   

### Platform support and supported formats

 This function is only supported on Windows and Xbox. Calls on other platforms will fail.   <br /><br /> The following format options are supported.   <br /><br />

| Format option | Supported value(s) |
| --- | --- |
| Samples per second | Any value between 8 kHz and 48 kHz, inclusive. |
| Channel mask | Any value |
| Channel count | Any value between 1 and 64, inclusive. |
| Bits per sample | If sample type is ```PartyAudioSampleType::Float```, 32. If sample type is ```PartyAudioSampleType::Integer```, 16 or 32. |
| Sample type | ```PartyAudioSampleType::Float``` or ```PartyAudioSampleType::Integer``` |
| Interleaved | true or false |
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
