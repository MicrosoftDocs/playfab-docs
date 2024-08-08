---
author: jdeweyMSFT
title: "PartyConfigureAudioManipulationCaptureStreamCompletedStateChange"
description: "Information specific to the *ConfigureAudioManipulationCaptureStreamCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyConfigureAudioManipulationCaptureStreamCompletedStateChange  

Information specific to the *ConfigureAudioManipulationCaptureStreamCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyConfigureAudioManipulationCaptureStreamCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartyAudioManipulationSinkStreamConfiguration* configuration;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
On success, the sink stream provided by [PartyLocalChatControl::GetAudioManipulationCaptureStream()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getaudiomanipulationcapturestream.md) will be updated.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control used in to the call associated with this state change.
  
**`configuration`** &nbsp; [PartyAudioManipulationSinkStreamConfiguration](partyaudiomanipulationsinkstreamconfiguration.md)*  
  
The configuration provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::ConfigureAudioManipulationCaptureStream](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md)
  
  
