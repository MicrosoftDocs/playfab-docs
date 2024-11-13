---
author: jdeweyMSFT
title: "PartyAudioManipulationSinkStream::GetFormat"
description: Retrieves the format of the buffers that will be submitted to [PartyAudioManipulationSinkStream::SubmitBuffer()](partyaudiomanipulationsinkstream_submitbuffer.md).
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/13/2020
---

# PartyAudioManipulationSinkStream::GetFormat  

Retrieves the format of the buffers that will be submitted to [PartyAudioManipulationSinkStream::SubmitBuffer()](partyaudiomanipulationsinkstream_submitbuffer.md).  

## Syntax  
  
```cpp
PartyError GetFormat(  
    PartyAudioFormat* format  
)  
```  
  
### Parameters  
  
**`format`** &nbsp; [PartyAudioFormat*](../../../structs/partyaudioformat.md)  
*output*  
  
The format of the buffers that will be submitted to [PartyAudioManipulationSinkStream::SubmitBuffer()](partyaudiomanipulationsinkstream_submitbuffer.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If a format is specified in the configuration provided by [PartyAudioManipulationSinkStream::GetConfiguration()](partyaudiomanipulationsinkstream_getconfiguration.md), this format will match. Otherwise, this format will be the most efficient format automatically selected by the library.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSinkStream](../partyaudiomanipulationsinkstream.md)  
[PartyLocalChatControl::ConfigureAudioManipulationCaptureStream](../../PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md)  
[PartyLocalChatControl::ConfigureAudioManipulationRenderStream](../../PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationrenderstream.md)  
[PartyAudioManipulationSinkStream::SubmitBuffer](partyaudiomanipulationsinkstream_submitbuffer.md)  
[PartyAudioManipulationSinkStream::GetConfiguration](partyaudiomanipulationsinkstream_getconfiguration.md)
  
  
