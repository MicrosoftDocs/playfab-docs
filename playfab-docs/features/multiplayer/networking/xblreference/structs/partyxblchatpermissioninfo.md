---
author: ScottMunroMS
title: "PartyXblChatPermissionInfo"
description: "Information regarding a required chat permission."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblChatPermissionInfo  

Information regarding a required chat permission.  

## Syntax  
  
```cpp
typedef struct PartyXblChatPermissionInfo {  
    PartyChatPermissionOptions chatPermissionMask;  
    PartyXblChatPermissionMaskReason reason;  
} PartyXblChatPermissionInfo  
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

  
  
