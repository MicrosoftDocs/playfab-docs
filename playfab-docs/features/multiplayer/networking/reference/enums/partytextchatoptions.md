---
author: jdeweyMSFT
title: "PartyTextChatOptions"
description: "Text chat options."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/08/2021
---

# PartyTextChatOptions  

Text chat options.    

## Syntax  
  
```cpp
enum class PartyTextChatOptions    
{  
    None = 0x0,  
    TranslateToLocalLanguage = 0x1,  
    FilterOffensiveText = 0x2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No options are selected. |  
| TranslateToLocalLanguage | Incoming text chat will be translated to the local chat control's language.<br/><br/> The language specified via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md) is the language to which the incoming text chat will be translated. The translations will be provided in addition to the original text chat via a [PartyChatTextReceivedStateChange](../structs/partychattextreceivedstatechange.md). <br /><br /> If translation is enabled, a translation corresponding to the local chat control's language will always be provided in each resulting PartyChatTextReceivedStateChange. If the source chat control's language is the same as the local chat control's language, the chat text and translation strings will be identical. |  
| FilterOffensiveText | Offensive terms will be filtered out of incoming text chat.<br/><br/> For incoming chat text detected as English, the filtering level may be adjusted using the [PartyOption::TextChatFilterLevel](partyoption.md) option in [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md). The default level is family-friendly. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)  
[PartyLocalChatControl::GetLanguage](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md)  
[PartyChatTextReceivedStateChange](../structs/partychattextreceivedstatechange.md)
  
  
