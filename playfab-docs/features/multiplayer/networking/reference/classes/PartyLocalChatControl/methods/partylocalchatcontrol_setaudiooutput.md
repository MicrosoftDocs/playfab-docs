---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetAudioOutput"
description: Configures the preferred speakers or headset device that the chat control will use for audio output.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyLocalChatControl::SetAudioOutput  

Configures the preferred speakers or headset device that the chat control will use for audio output.  

## Syntax  
  
```cpp
PartyError SetAudioOutput(  
    PartyAudioDeviceSelectionType audioDeviceSelectionType,  
    PartyString audioDeviceSelectionContext,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`audioDeviceSelectionType`** &nbsp; [PartyAudioDeviceSelectionType](../../../enums/partyaudiodeviceselectiontype.md)  
  
If [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) is specified, the audio output will be cleared. If [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the system's default communication device. If [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the default communication device associated with `audioDeviceSelectionContext`. If [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md) is specified, the Party library will attempt to use the communication device whose device identifier matches `audioDeviceSelectionContext`.  
  
**`audioDeviceSelectionContext`** &nbsp; [PartyString](../../../typedefs.md)  
*optional*  
  
When using [PartyAudioDeviceSelectionType::None](../../../enums/partyaudiodeviceselectiontype.md) or [PartyAudioDeviceSelectionType::SystemDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` will be ignored. When using [PartyAudioDeviceSelectionType::PlatformUserDefault](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` must be the non-null, non-empty platform-specific user context that the chat control should use when selecting the audio device. When using [PartyAudioDeviceSelectionType::Manual](../../../enums/partyaudiodeviceselectiontype.md), `audioDeviceSelectionContext` must be the non-null, non-empty identifier of the audio device that the chat control should use.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to set the audio output began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous operation to configure the preferred speakers or headset device associated with this local chat control. If the method succeeds, a [PartyLocalChatAudioOutputChangedStateChange](../../../structs/partylocalchataudiooutputchangedstatechange.md) will be provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) with details about the output device status and a [PartySetChatAudioOutputCompletedStateChange](../../../structs/partysetchataudiooutputcompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. After completion, an additional [PartyLocalChatAudioOutputChangedStateChange](../../../structs/partylocalchataudiooutputchangedstatechange.md) will be provided each time the audio device status changes, such as due to device removal. <br /><br /> If the specified device isn't present, the chat control will subscribe to audio device changes and use the device when it does appear.   <br /><br /> When using the ```PlatformUserDefault``` option on the Xbox platform, the Xbox User Identifier (XUID) must be passed as the ```audioDeviceSelectionContext``` value.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetAudioOutput](partylocalchatcontrol_getaudiooutput.md)  
[PartyLocalChatControl::SetAudioInput](partylocalchatcontrol_setaudioinput.md)
  
  
