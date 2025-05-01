---
author: jdeweyMSFT
title: "PartyAudioManipulationSinkStream::GetConfiguration"
description: Retrieves the sink stream configuration.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyAudioManipulationSinkStream::GetConfiguration  

Retrieves the sink stream configuration.  

## Syntax  
  
```cpp
PartyError GetConfiguration(  
    PartyAudioManipulationSinkStreamConfiguration* configuration  
)  
```  
  
### Parameters  
  
**`configuration`** &nbsp; [PartyAudioManipulationSinkStreamConfiguration*](../../../structs/partyaudiomanipulationsinkstreamconfiguration.md)  
*output*  
  
The stream configuration.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The stream configuration matches the configuration provided to the configuration method used to create this stream.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSinkStream](../partyaudiomanipulationsinkstream.md)  
[PartyLocalChatControl::ConfigureAudioManipulationCaptureStream](../../PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md)  
[PartyLocalChatControl::ConfigureAudioManipulationRenderStream](../../PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationrenderstream.md)
  
  
