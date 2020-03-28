---
author: alexatxbox
title: "PartyXblManager"
description: TBD
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 01/17/2020
---

# PartyXblManager  

The primary management class for interacting with the Party Xbox Live Helper library.  

## Syntax  
  
```cpp  
class PartyXblManager  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetSingleton](methods/partyxblmanager_getsingleton.md) | Retrieves a reference to the PartyXblManager singleton instance. |  
| [GetErrorMessage](methods/partyxblmanager_geterrormessage.md) | Get the human-readable form of an error. |  
| [SetMemoryCallbacks](methods/partyxblmanager_setmemorycallbacks.md) | Optionally configures the memory allocation and freeing callbacks the Party Xbox Live Helper library should use. |  
| [GetMemoryCallbacks](methods/partyxblmanager_getmemorycallbacks.md) | Retrieves the current memory allocation and freeing callbacks the Party Xbox Live library is using. |  
| [SetThreadAffinityMask](methods/partyxblmanager_setthreadaffinitymask.md) | Optionally configures the processor on which internal Party Xbox Live Helper library threads will run. |  
| [GetThreadAffinityMask](methods/partyxblmanager_getthreadaffinitymask.md) | Retrieves the current set of processors on which internal Party Xbox Live Helper library threads will run or are running as an affinity mask. |  
| [Initialize](methods/partyxblmanager_initialize.md) | Initializes the object instance. |  
| [Cleanup](methods/partyxblmanager_cleanup.md) | Immediately reclaims all resources associated with the object. |  
| [StartProcessingStateChanges](methods/partyxblmanager_startprocessingstatechanges.md) | Retrieves an array of all Party Xbox Live state changes to process since the last such call. |  
| [FinishProcessingStateChanges](methods/partyxblmanager_finishprocessingstatechanges.md) | Returns an array of Party Xbox Live state changes that were being processed. |  
| [CompleteGetTokenAndSignatureRequest](methods/partyxblmanager_completegettokenandsignaturerequest.md) | Completes a GetTokenAndSignature operation. |  
| [CreateLocalChatUser](methods/partyxblmanager_createlocalchatuser.md) | Queues an asynchronous attempt to create a local chat user. Privacy and privilege information related to this user will be tracked by the helper library. |  
| [CreateRemoteChatUser](methods/partyxblmanager_createremotechatuser.md) | Creates a remote chat user. A remote chat user is an Xbox Live user currently communicating with at least one local user. Creating a remote chat user will cause the library to start tracking privacy information related to this user in relation to every local chat user. |  
| [DestroyChatUser](methods/partyxblmanager_destroychatuser.md) | Destroys a chat user. |  
| [GetChatUsers](methods/partyxblmanager_getchatusers.md) | Gets an array containing all chat users created by [CreateLocalChatUser()](methods/partyxblmanager_createlocalchatuser.md) and [CreateRemoteChatUser()](methods/partyxblmanager_createremotechatuser.md). |  
| [LoginToPlayFab](methods/partyxblmanager_logintoplayfab.md) | Signs the user in to PlayFab using an Xbox Live token, asynchronously returning an Entity Id and Entity Token that can subsequently be used for PlayFab API calls which require an authenticated PlayFab user or to create a PartyLocalUser. There is no difference between calling this method or using the LoginWithXbox method provided by the PlayFab SDK. |  
| [GetEntityIdsFromXboxLiveUserIds](methods/partyxblmanager_getentityidsfromxboxliveuserids.md) | Queues an asynchronous operation to retrieve a list of mappings between PlayFab Entity Ids and known Xbox Live User Ids. |  

  
## Remarks  
  
Only a single instance of the class is permitted.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../../partyxboxlive_members.md)  

  
  
  
