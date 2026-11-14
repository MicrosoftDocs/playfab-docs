---
author: ScottMunroMS
title: "PartyXblLoginToPlayFabCompletedStateChange"
description: "Information specific to the *LoginToPlayFabCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblLoginToPlayFabCompletedStateChange  

Information specific to the *LoginToPlayFabCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyXblLoginToPlayFabCompletedStateChange : PartyXblStateChange {  
    PartyXblStateChangeResult result;  
    PartyError errorDetail;  
    PartyXblLocalChatUser* localChatUser;  
    void* asyncIdentifier;  
    PartyString entityId;  
    PartyString titlePlayerEntityToken;  
    time_t expirationTime;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyXblStateChangeResult](../enums/partyxblstatechangeresult.md)  
  
Indicates that the login operation succeeded or the reason that it failed.
  
**`errorDetail`** &nbsp; [PartyError](../../reference/typedefs.md)  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
  
The local chat user who was logged in to PlayFab.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`entityId`** &nbsp; [PartyString](../../reference/typedefs.md)  
  
The PlayFab Entity Id associated with the local chat user's XBOX Live identity.
  
**`titlePlayerEntityToken`** &nbsp; [PartyString](../../reference/typedefs.md)  
  
The PlayFab Entity Token associated with the local chat user's XBOX Live identity.
  
**`expirationTime`** &nbsp; time_t  
  
The timestamp describing when this token expires.
  
When the token is nearing the expiration time or if the token has expired due to the application being in a dormant state for an extended time, a new token should be obtained by calling [PartyXblManager::LoginToPlayFab()](../classes/PartyXblManager/methods/partyxblmanager_logintoplayfab.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
