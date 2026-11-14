---
author: ScottMunroMS
title: "PartyXblChatPermissionInfo"
description: "Information regarding a required chat permission."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
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
  
**`chatPermissionMask`** &nbsp; [PartyChatPermissionOptions](../../reference/enums/partychatpermissionoptions.md)  
  
The chat permission options mask that should be applied to the target chat user.
  
Use a bitwise 'AND' operation against the desired chat permissions to ensure the resulting permissions will respect XBOX Live policies.
  
**`reason`** &nbsp; [PartyXblChatPermissionMaskReason](../enums/partyxblchatpermissionmaskreason.md)  
  
Extra information regarding the result of a required chat permission query.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
