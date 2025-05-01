---
author: jdeweyMSFT
title: "PartyTextChatFilterLevel"
description: "The level of filtering that applies to incoming text chat when text moderation is enabled with [PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
---

# PartyTextChatFilterLevel  

The level of filtering that applies to incoming text chat when text moderation is enabled with [PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md).    

## Syntax  
  
```cpp
enum class PartyTextChatFilterLevel  : uint32_t  
{  
    FamilyFriendly = 0,  
    Medium = 1,  
    Mature = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| FamilyFriendly | Text chat is filtered at a family-friendly level.<br/><br/> This value is the default when [PartyOption::TextChatFilterLevel](partyoption.md) hasn't been configured. |  
| Medium | Text chat is filtered at a medium level. |  
| Mature | Text chat is filtered at a mature level. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)
  
  
