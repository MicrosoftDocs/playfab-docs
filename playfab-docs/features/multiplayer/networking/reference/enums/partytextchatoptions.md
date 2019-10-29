---
author: jdeweyMSFT
title: "PartyTextChatOptions"
description: "Text chat options."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyTextChatOptions  

Text chat options.    

## Syntax  
  
```cpp
enum class PartyTextChatOptions    
{  
    None = 0x0,  
    TranslateToLocalLanguage = 0x1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No options are selected. |  
| TranslateToLocalLanguage | Incoming text chat will be translated to the local chat control's language.<br/><br/> The language specified via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md) is the language to which the incoming text chat will be translated. The translations will be provided in addition to the original text chat via a [PartyChatTextReceivedStateChange](../structs/partychattextreceivedstatechange.md). <br /><br /> If translation is enabled, a translation corresponding to the local chat control's language will always be provided in each resulting PartyChatTextReceivedStateChange. If the source chat control's language is the same as the local chat control's language, the chat text and translation strings will be identical. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)  
[PartyLocalChatControl::GetLanguage](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md)  
[PartyChatTextReceivedStateChange](../structs/partychattextreceivedstatechange.md)
  
  
