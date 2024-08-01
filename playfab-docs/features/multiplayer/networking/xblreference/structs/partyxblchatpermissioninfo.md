---
author: ScottMunroMS
title: "PartyXblChatPermissionInfo"
description: "Information regarding a required chat permission."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyXblChatPermissionInfo  

Information regarding a required chat permission.  

## Syntax  
  
```cpp
struct PartyXblChatPermissionInfo {  
    PartyChatPermissionOptions chatPermissionMask;  
    PartyXblChatPermissionMaskReason reason;  
}  
```
  
### Members  
  
**`chatPermissionMask`** &nbsp; [PartyChatPermissionOptions](../../../networking/reference/enums/partychatpermissionoptions.md)  
  
The chat permission options mask that should be applied to the target chat user.
  
Use a bitwise 'AND' operation against the desired chat permissions to ensure the resulting permissions will respect Xbox Live policies.
  
**`reason`** &nbsp; [PartyXblChatPermissionMaskReason](../enums/partyxblchatpermissionmaskreason.md)  
  
Extra information regarding the result of a required chat permission query.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
