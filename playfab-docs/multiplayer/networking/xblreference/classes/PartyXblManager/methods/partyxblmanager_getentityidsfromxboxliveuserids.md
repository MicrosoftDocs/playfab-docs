---
author: ScottMunroMS
title: "PartyXblManager::GetEntityIdsFromXboxLiveUserIds"
description: Queues an asynchronous operation to retrieve a list of mappings between PlayFab Entity Ids and known Xbox Live User Ids.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/17/2020
---

# PartyXblManager::GetEntityIdsFromXboxLiveUserIds  

Queues an asynchronous operation to retrieve a list of mappings between PlayFab Entity Ids and known Xbox Live User Ids.  

## Syntax  
  
```cpp
PartyError GetEntityIdsFromXboxLiveUserIds(  
    uint32_t xboxLiveUserIdCount,  
    const uint64_t* xboxLiveUserIds,  
    const PartyXblLocalChatUser* localChatUser,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`xboxLiveUserIdCount`** &nbsp; uint32_t  
  
The number of Xbox Live User Ids in the `xboxLiveUserIds` array.  
  
**`xboxLiveUserIds`** &nbsp; uint64_t*  
*input array of size `xboxLiveUserIdCount`*  
  
An array of size `xboxLiveUserIdCount` containing the Xbox Live User Ids for which the library will query the PlayFab Entity Id.  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser*](../../PartyXblLocalChatUser/partyxbllocalchatuser.md)  
  
Local chat user that will be used to communicate with PlayFab. The local chat user will be logged in to PlayFab if needed.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the operation started or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
Each Xbox Live User Id will only map to a PlayFab Entity Id if this Xbox Live User has already been linked to a PlayFab account. A PlayFab account is automatically created and linked when calling [PartyXblManager::LoginToPlayFab](partyxblmanager_logintoplayfab.md) for the first time. The <b>LoginWithXbox</b> API provided by the PlayFab SDK can also be used to link an account. <br /><br /> If the [PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange](../../../structs/partyxblgetentityidsfromxboxliveuseridscompletedstatechange.md) associated with the completion of this call indicates a failure with a result of [PartyXblStateChangeResult::PlayFabUserNotAuthorized](../../../enums/partyxblstatechangeresult.md), the operation can be retried no more than one time after successfully calling LoginToPlayFab().   <br /><br /> If the [PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange](../../../structs/partyxblgetentityidsfromxboxliveuseridscompletedstatechange.md) associated with the completion of this call indicates a failure with a result of [PartyXblStateChangeResult::PlayFabRateLimitExceeded](../../../enums/partyxblstatechangeresult.md), the operation can be retried after a brief delay.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange](../../../structs/partyxblgetentityidsfromxboxliveuseridscompletedstatechange.md)
  
  
