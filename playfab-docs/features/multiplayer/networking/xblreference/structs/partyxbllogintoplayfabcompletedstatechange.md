---
author: alexatxbox
title: "PartyXblLoginToPlayFabCompletedStateChange"
description: "Information specific to the *LoginToPlayFabCompleted* type of state change."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblLoginToPlayFabCompletedStateChange  

Information specific to the *LoginToPlayFabCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyXblLoginToPlayFabCompletedStateChange {  
    PartyXblStateChangeResult result;  
    PartyError errorDetail;  
    PartyXblLocalChatUser* localChatUser;  
    void* asyncIdentifier;  
    PartyString entityId;  
    PartyString titlePlayerEntityToken;  
    time_t expirationTime;  
} PartyXblLoginToPlayFabCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyXblStateChangeResult](../enums/partyxblstatechangeresult.md)  
  
Indicates that the login operation succeeded or the reason that it failed.
  
**`errorDetail`** &nbsp; [PartyError](../../../networking/reference/typedefs.md)  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
  
The local chat user who was logged in to PlayFab.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`entityId`** &nbsp; [PartyString](../../../networking/reference/typedefs.md)  
  
The PlayFab Entity ID associated with the local chat user's Xbox Live identity.
  
**`titlePlayerEntityToken`** &nbsp; [PartyString](../../../networking/reference/typedefs.md)  
  
The PlayFab Entity Token associated with the local chat user's Xbox Live identity.
  
**`expirationTime`** &nbsp; time_t  
  
The timestamp describing when this token expires.
  
When the token is nearing the expiration time or if the token has expired due to the application being in a dormant state for an extended time, a new token should be obtained by calling [PartyXblManager::LoginToPlayFab()](../classes/PartyXblManager/methods/partyxblmanager_logintoplayfab.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
