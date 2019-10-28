---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioOutput"
description: Provides the preferred speakers or headset device that the chat control has been configured to use for audio output.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*library-allocated output*  
  
An output value indicating the selection type that was used to select the provided `deviceId`.  
  
**`audioDeviceSelectionContext`** &nbsp; [PartyString*](../../../typedefs.md)  
*output*  
  
When using [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty. When using [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty. When using [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be the value provided in a previous call to [SetAudioOutput()](partylocalchatcontrol_setaudiooutput.md). When using [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be empty.  
  
**`deviceId`** &nbsp; [PartyString*](../../../typedefs.md)  
*output*  
  
An output value indicating the selected audio output device's identifier.  
  
  
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
  
  
