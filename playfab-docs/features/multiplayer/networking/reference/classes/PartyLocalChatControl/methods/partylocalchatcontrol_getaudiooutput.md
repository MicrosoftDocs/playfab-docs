---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioOutput"
description: Provides the preferred speakers or headset device that the chat control has been configured to use for audio output.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/05/2020
---

# PartyLocalChatControl::GetAudioOutput  

Provides the preferred speakers or headset device that the chat control has been configured to use for audio output.  

## Syntax  
  
```cpp
PartyError GetAudioOutput(  
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
  
When using [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) or [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty. When using [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md) or [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be the value provided in a previous call to [SetAudioOutput()](partylocalchatcontrol_setaudiooutput.md). The memory for the string remains valid until the next [PartyLocalChatAudioOutputChangedStateChange](../../../structs/partylocalchataudiooutputchangedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or the chat control is destroyed.  
  
**`deviceId`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
An output value indicating the selected audio output device's identifier. The memory for the string remains valid until the next [PartyLocalChatAudioOutputChangedStateChange](../../../structs/partylocalchataudiooutputchangedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or the chat control is destroyed.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
An empty device identifier string indicates that no output has been selected.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::SetAudioOutput](partylocalchatcontrol_setaudiooutput.md)  
[PartyLocalChatControl::GetAudioInput](partylocalchatcontrol_getaudioinput.md)
  
  
