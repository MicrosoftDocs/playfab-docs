---
author: ScottMunroMS
title: "PartyXblLocalChatUser"
description: The management class for XBOX Live operations related to a local chat user. Inherits from [PartyXblChatUser](../PartyXblChatUser/partyxblchatuser.md).
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblLocalChatUser  

The management class for XBOX Live operations related to a local chat user. Inherits from [PartyXblChatUser](../PartyXblChatUser/partyxblchatuser.md).  

## Syntax  
  
```cpp  
class PartyXblLocalChatUser : public PartyXblChatUser  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetAccessibilitySettings](methods/partyxbllocalchatuser_getaccessibilitysettings.md) | Returns the accessibility settings associated with this chat user. |  
| [GetRequiredChatPermissionInfo](methods/partyxbllocalchatuser_getrequiredchatpermissioninfo.md) | Gets the cached required chat permission information related to a target chat user. |  
| [GetCrossNetworkCommunicationPrivacySetting](methods/partyxbllocalchatuser_getcrossnetworkcommunicationprivacysetting.md) | Gets the cross-network communication privacy setting for this chat user. |  

  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../../partyxboxlive_members.md)  
[PartyXblChatUser](../PartyXblChatUser/partyxblchatuser.md)  
[PartyXblChatUser::GetLocal](../PartyXblChatUser/methods/partyxblchatuser_getlocal.md)
  
  
  
