---
author: jdeweyMSFT
title: "PartyAudioDeviceSelectionType"
description: "Options for selecting audio devices"
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyAudioDeviceSelectionType  

Options for selecting audio devices    

## Syntax  
  
```cpp
enum class PartyAudioDeviceSelectionType    
{  
    None,  
    SystemDefault,  
    PlatformUserDefault,  
    Manual,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | Indicate that no audio device should be used. |  
| SystemDefault | Select audio device based on the platform settings.<br/><br/> If this selection type is used for [PartyLocalChatControl::SetAudioInput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md) or [PartyLocalChatControl::SetAudioOutput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiooutput.md) then the audioDeviceSelectionContext should be nullptr. |  
| PlatformUserDefault | Select audio device based on the platform and user settings.<br/><br/> If this selection type is used for [PartyLocalChatControl::SetAudioInput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md) or [PartyLocalChatControl::SetAudioOutput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiooutput.md) then the audioDeviceSelectionContext must be a platform specific user context. |  
| Manual | Audio device specified by the game.<br/><br/> If this selection type is used for [PartyLocalChatControl::SetAudioInput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md) or [PartyLocalChatControl::SetAudioOutput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiooutput.md) then the audioDeviceSelectionContext must be the identifier of the audio device to use. <br /><br /> Note that on iOS and Android, setting a manual input device is an illegal operation. Using this with [PartyLocalChatControl::SetAudioInput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md) on Android and iOS will result in an error indicating that the device selection type is not supported. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetAudioInput](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md)  
[PartyLocalChatControl::SetAudioOutput](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiooutput.md)
  
  
