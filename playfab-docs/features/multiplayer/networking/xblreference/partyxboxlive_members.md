---
author: alexatxbox
title: "PartyXboxLive"
description: TBD
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 01/17/2020
---

# PartyXboxLive members  

  
## Classes  

| Class | Description |  
| --- | --- |  
| [PartyXblChatUser](classes/PartyXblChatUser/partyxblchatuser.md) | The management class for Xbox Live operations related to a chat user. |  
| [PartyXblLocalChatUser](classes/PartyXblLocalChatUser/partyxbllocalchatuser.md) | The management class for Xbox Live operations related to a local chat user. Inherits from [PartyXblChatUser](classes/PartyXblChatUser/partyxblchatuser.md). |  
| [PartyXblManager](classes/PartyXblManager/partyxblmanager.md) | The primary management class for interacting with the Party Xbox Live Helper library. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PartyXblAccessibilitySettings](structs/partyxblaccessibilitysettings.md) | Accessibility settings associated with an Xbox Live account. |  
| [PartyXblChatPermissionInfo](structs/partyxblchatpermissioninfo.md) | Information regarding a required chat permission. |  
| [PartyXblHttpHeader](structs/partyxblhttpheader.md) | Information about an HTTP header. |  
| [PartyXblXboxUserIdToPlayFabEntityIdMapping](structs/partyxblxboxuseridtoplayfabentityidmapping.md) | Mapping between an Xbox Live User Id and a PlayFab Entity Id. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
| [PartyXblCreateLocalChatUserCompletedStateChange](structs/partyxblcreatelocalchatusercompletedstatechange.md) | Information specific to the *CreateLocalChatUserCompleted* type of state change. |  
| [PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange](structs/partyxblgetentityidsfromxboxliveuseridscompletedstatechange.md) | Information specific to the *GetEntityIdsFromXboxLiveUserIdsCompleted* type of state change. |  
| [PartyXblLocalChatUserDestroyedStateChange](structs/partyxbllocalchatuserdestroyedstatechange.md) | Information specific to the *LocalChatUserDestroyed* type of state change. |  
| [PartyXblLoginToPlayFabCompletedStateChange](structs/partyxbllogintoplayfabcompletedstatechange.md) | Information specific to the *LoginToPlayFabCompleted* type of state change. |  
| [PartyXblRequiredChatPermissionInfoChangedStateChange](structs/partyxblrequiredchatpermissioninfochangedstatechange.md) | Information specific to the *RequiredChatPermissionInfoChanged* type of state change. |  
| [PartyXblStateChange](structs/partyxblstatechange.md) | A generic, base structure representation of an event or change in state. |  
| [PartyXblTokenAndSignatureRequestedStateChange](structs/partyxbltokenandsignaturerequestedstatechange.md) | Information specific to the *TokenAndSignatureRequested* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PartyXblChatPermissionMaskReason](enums/partyxblchatpermissionmaskreason.md) | Reasons communication may be restricted.|  
| [PartyXblCrossNetworkCommunicationPrivacySetting](enums/partyxblcrossnetworkcommunicationprivacysetting.md) | Possible cross-network communication privacy settings for a local Xbox Live user.|  
| [PartyXblLocalChatUserDestroyedReason](enums/partyxbllocalchatuserdestroyedreason.md) | Reasons a local chat user object might be destroyed.|  
| [PartyXblStateChangeResult](enums/partyxblstatechangeresult.md) | Results for operations that generate state changes.|  
| [PartyXblStateChangeType](enums/partyxblstatechangetype.md) | The types of state changes that can occur.|  
| [PartyXblThreadId](enums/partyxblthreadid.md) | Threads that Party Xbox Live Helper library uses for internal purposes.|  

