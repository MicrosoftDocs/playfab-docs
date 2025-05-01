---
author: ScottMunroMS
title: "PartyXblManager::LoginToPlayFab"
description: Signs the user in to PlayFab using an Xbox Live token, asynchronously returning an Entity ID and Entity Token that can subsequently be used for PlayFab API calls which require an authenticated PlayFab user or to create a PartyLocalUser. There is no difference between calling this method or using the LoginWithXbox method provided by the PlayFab SDK.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/01/2019
---

# PartyXblManager::LoginToPlayFab  

Signs the user in to PlayFab using an Xbox Live token, asynchronously returning an Entity ID and Entity Token that can subsequently be used for PlayFab API calls which require an authenticated PlayFab user or to create a PartyLocalUser. There is no difference between calling this method or using the LoginWithXbox method provided by the PlayFab SDK.  

## Syntax  
  
```cpp
PartyError LoginToPlayFab(  
    const PartyXblLocalChatUser* localChatUser,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser*](../../PartyXblLocalChatUser/partyxbllocalchatuser.md)  
  
The local chat user object that will be used for the login operation.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the operation to login the local chat user with PlayFab started or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
If this is the first time the Xbox Live identity has logged in to PlayFab, a new PlayFab account will be created and linked to the Xbox Live identity. <br /><br /> When a token is nearing the expiration time or if a token has expired due to the application being in a dormant state for an extended time, a new token should be obtained by calling this method. It is recommended to acquire a new token when the previously supplied token is halfway through its validity period.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblLoginToPlayFabCompletedStateChange](../../../structs/partyxbllogintoplayfabcompletedstatechange.md)
  
  
