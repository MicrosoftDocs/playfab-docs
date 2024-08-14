---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioInput"
description: Provides the preferred microphone or recording device that the chat control has been configured to use for audio input.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/05/2020
---

# PartyLocalChatControl::GetAudioInput  

Provides the preferred microphone or recording device that the chat control has been configured to use for audio input.  

## Syntax  
  
```cpp
PartyError GetAudioInput(  
    PartyAudioDeviceSelectionType* audioDeviceSelectionType,  
    PartyString* audioDeviceSelectionContext,  
    PartyString* deviceId  
)  
```  
  
### Parameters  
  
**`audioDeviceSelectionType`** &nbsp; [PartyAudioDeviceSelectionType*](../../../enums/partyaudiodeviceselectiontype.md)  
*output*  
  
An output value indicating the selection type that was used to select the provided `deviceId`.  
  
**`audioDeviceSelectionContext`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
When using [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) or [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty. When using [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md) or [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be the value provided in a previous call to [SetAudioInput()](partylocalchatcontrol_setaudioinput.md). The memory for the string remains valid until the next [PartyLocalChatAudioInputChangedStateChange](../../../structs/partylocalchataudioinputchangedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or the chat control is destroyed.  
  
**`deviceId`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
An output value indicating the selected audio input device's identifier. The memory for the string remains valid until the next [PartyLocalChatAudioInputChangedStateChange](../../../structs/partylocalchataudioinputchangedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or the chat control is destroyed.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
An empty device identifier string indicates that no input has been selected.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::SetAudioInput](partylocalchatcontrol_setaudioinput.md)  
[PartyLocalChatControl::GetAudioOutput](partylocalchatcontrol_getaudiooutput.md)
  
  
