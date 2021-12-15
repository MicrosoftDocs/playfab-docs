---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioInput"
description: Provides the preferred microphone or recording device that the chat control has been configured to use for audio input.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
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
  
When using [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty. When using [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty. When using [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be the value provided in a previous call to [SetAudioInput()](partylocalchatcontrol_setaudioinput.md). When using [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty.  
  
**`deviceId`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
An output value indicating the selected audio input device's identifier.  
  
  
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
  
  
