---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::GetConfiguration"
description: Retrieves the source stream configuration.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyAudioManipulationSourceStream::GetConfiguration  

Retrieves the source stream configuration.  

## Syntax  
  
```cpp
PartyError GetConfiguration(  
    PartyAudioManipulationSourceStreamConfiguration* configuration  
)  
```  
  
### Parameters  
  
**`configuration`** &nbsp; [PartyAudioManipulationSourceStreamConfiguration*](../../../structs/partyaudiomanipulationsourcestreamconfiguration.md)  
*output*  
  
The stream configuration.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The stream configuration matches the configuration provided to the call to [PartyChatControl::ConfigureAudioManipulationVoiceStream()](../../PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md) used to create this stream.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  
[PartyChatControl::ConfigureAudioManipulationVoiceStream](../../PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md)
  
  
