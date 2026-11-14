---
author: ScottMunroMS
title: "PartyXblChatUser"
description: The management class for XBOX Live operations related to a chat user.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblChatUser  

The management class for XBOX Live operations related to a chat user.  

## Syntax  
  
```cpp  
class PartyXblChatUser  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetLocal](methods/partyxblchatuser_getlocal.md) | Gets the PartyXblLocalChatUser version of this chat user. |  
| [GetXboxUserId](methods/partyxblchatuser_getxboxuserid.md) | Gets the XBOX user ID associated with this user. |  
| [GetCustomContext](methods/partyxblchatuser_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this local chat user object. |  
| [SetCustomContext](methods/partyxblchatuser_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this local chat user object. |  

  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../../partyxboxlive_members.md)  
[PartyXblLocalChatUser](../PartyXblLocalChatUser/partyxbllocalchatuser.md)
  
  
  
