---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetAudioInput"
description: Configures the preferred microphone or recording device that the chat control will use for audio input.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/14/2023
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
  
If [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) is specified, the audio input will be cleared. If [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the system's default communication device. If [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the default communication device associated with `audioDeviceSelectionContext`. If [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the communication device whose device identifier matches. Note that ```PartyAudioDeviceSelectionType::Manual``` is not supported on Android, iOS, or macOS.  
  
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
  
This method queues an asynchronous operation to configure the preferred recording device associated with this local chat control. If the method succeeds, a [PartyLocalChatAudioInputChangedStateChange](../../../structs/partylocalchataudioinputchangedstatechange.md) will be provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) with details about the input device status and a [PartySetChatAudioInputCompletedStateChange](../../../structs/partysetchataudioinputcompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. After completion, an additional [PartyLocalChatAudioInputChangedStateChange](../../../structs/partylocalchataudioinputchangedstatechange.md) will be provided each time the audio device status changes, such as due to device removal. <br /><br /> If the specified device isn't present, the chat control will subscribe to audio device changes and use the device when it does appear.   <br /><br /> When using the ```PlatformUserDefault``` option on the Xbox platform, the Xbox User Identifier (XUID) must be passed as the ```audioDeviceSelectionContext``` value.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetAudioInput](partylocalchatcontrol_getaudioinput.md)  
[PartyLocalChatControl::SetAudioOutput](partylocalchatcontrol_setaudiooutput.md)
  
  
