---
author: alexatxbox
title: "PartyXblStateChangeType"
description: "The types of state changes that can occur."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 01/17/2020
---

# PartyXblStateChangeType  

The types of state changes that can occur.    

## Syntax  
  
```cpp
enum class PartyXblStateChangeType  : uint32_t  
{  
    CreateLocalChatUserCompleted,  
    LocalChatUserDestroyed,  
    RequiredChatPermissionInfoChanged,  
    TokenAndSignatureRequested,  
    LoginToPlayFabCompleted,  
    GetEntityIdsFromXboxLiveUserIdsCompleted,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| CreateLocalChatUserCompleted | The operation started by a previous call to [PartyXblManager::CreateLocalChatUser()](../classes/PartyXblManager/methods/partyxblmanager_createlocalchatuser.md) completed.<br/><br/> The PartyXblStateChange object should be cast to a [PartyXblCreateLocalChatUserCompletedStateChange](../structs/partyxblcreatelocalchatusercompletedstatechange.md). |  
| LocalChatUserDestroyed | A local chat user was destroyed.<br/><br/> The PartyXblStateChange object should be cast to a [PartyXblLocalChatUserDestroyedStateChange](../structs/partyxbllocalchatuserdestroyedstatechange.md) object for more information. |  
| RequiredChatPermissionInfoChanged | Chat permissions between a local chat user and a target chat user has changed.<br/><br/> The PartyXblStateChange object should be cast to a [PartyXblRequiredChatPermissionInfoChangedStateChange](../structs/partyxblrequiredchatpermissioninfochangedstatechange.md) object for more information. |  
| TokenAndSignatureRequested | The Xbox Live Helper library requires an Xbox Live token and signature to complete an HTTP request.<br/><br/> The title can use the Xbox Authentication Library (XAL) to fulfill these request by calling the ```XalUserGetTokenAndSignatureSilentlyAsync``` function. <br /><br /> The title needs to call [PartyXblManager::CompleteGetTokenAndSignatureRequest()](../classes/PartyXblManager/methods/partyxblmanager_completegettokenandsignaturerequest.md) with the request token and signature.   <br /><br /> The PartyXblStateChange object should be cast to a [PartyXblTokenAndSignatureRequestedStateChange](../structs/partyxbltokenandsignaturerequestedstatechange.md) object for more information.   <br /><br /> This state change is only returned on the Windows 10 platform. |  
| LoginToPlayFabCompleted | The operation started by a previous call to [PartyXblManager::LoginToPlayFab()](../classes/PartyXblManager/methods/partyxblmanager_logintoplayfab.md) completed.<br/><br/> The PartyXblStateChange object should be cast to a [PartyXblLoginToPlayFabCompletedStateChange](../structs/partyxbllogintoplayfabcompletedstatechange.md) object for more information. |  
| GetEntityIdsFromXboxLiveUserIdsCompleted | The operation started by a previous call to [PartyXblManager::GetEntityIdsFromXboxLiveUserIds()](../classes/PartyXblManager/methods/partyxblmanager_getentityidsfromxboxliveuserids.md) completed.<br/><br/> The PartyXblStateChange object should be cast to a [PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange](../structs/partyxblgetentityidsfromxboxliveuseridscompletedstatechange.md) object for more information. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
