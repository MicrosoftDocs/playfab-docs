---
author: jdeweyMSFT
title: "PartyConfigureAudioManipulationVoiceStreamCompletedStateChange"
description: "Information specific to the *ConfigureAudioManipulationVoiceStreamCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyConfigureAudioManipulationVoiceStreamCompletedStateChange  

Information specific to the *ConfigureAudioManipulationVoiceStreamCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyConfigureAudioManipulationVoiceStreamCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyChatControl* chatControl;  
    PartyAudioManipulationSourceStreamConfiguration* configuration;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
On success, the source stream provided by [PartyChatControl::GetAudioManipulationVoiceStream()](../classes/PartyChatControl/methods/partychatcontrol_getaudiomanipulationvoicestream.md) will be updated.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`chatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control used in the call associated with this state change.
  
**`configuration`** &nbsp; [PartyAudioManipulationSourceStreamConfiguration](partyaudiomanipulationsourcestreamconfiguration.md)*  
  
The configuration provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyChatControl::ConfigureAudioManipulationVoiceStream](../classes/PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md)
  
  
