---
author: jdeweyMSFT
title: "PartyTextChatFilterLevel"
description: "The level of filtering that will apply to incoming text chat when text moderation is enabled with [PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)."
ms.author: jdewey
ms.topic: reference
ms.service: playfab
ms.date: 04/07/2021
---

# PartyTextChatFilterLevel  

The level of filtering that will apply to incoming text chat when text moderation is enabled with [PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md).    

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
| FamilyFriendly | Text chat will be filtered at a family-friendly level. |  
| Medium | Text chat will be filtered at a medium level. |  
| Mature | Text chat will be filtered at a mature level. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)
  
  
