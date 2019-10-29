---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetAudioInput"
description: Configures the preferred microphone or recording device that the chat control will use for audio input.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyLocalChatControl::SetAudioInput  

Configures the preferred microphone or recording device that the chat control will use for audio input.  

## Syntax  
  
```cpp
PartyError SetAudioInput(  
    PartyAudioDeviceSelectionType audioDeviceSelectionType,  
    PartyString audioDeviceSelectionContext,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`audioDeviceSelectionType`** &nbsp; [PartyAudioDeviceSelectionType](../../../enums/partyaudiodeviceselectiontype.md)  
  
If [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) is specified, the audio input will be cleared. If [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the system's default communication device. If [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the default communication device associated with `audioDeviceSelectionContext`. If [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the communication device whose device identifier matches. Note that this is not supported on iOS or Android. `audioDeviceSelectionContext`.  
  
**`audioDeviceSelectionContext`** &nbsp; [PartyString](../../../typedefs.md)  
*optional*  
  
When using [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) or [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be ignored. When using [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` must be the non-null, non-empty platform-specific user context that the chat control should use when selecting the audio device. When using [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` must be the non-null, non-empty identifier of the audio device that the chat control should use.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to set the audio input began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If the specified device isn't present, the chat control will subscribe to audio device changes and use the device when it does appear.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetAudioInput](partylocalchatcontrol_getaudioinput.md)  
[PartyLocalChatControl::SetAudioOutput](partylocalchatcontrol_setaudiooutput.md)
  
  
