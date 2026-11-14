---
author: ScottMunroMS
title: "PFMultiplayerSetEntityToken"
description: "Sets or replaces the authentication token used when performing library actions on behalf of an entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFMultiplayerSetEntityToken  

Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerSetEntityToken(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* entity,  
    const char* entityToken  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`entity`** &nbsp; [const PFEntityKey*](../pfentitykey_clientsdk.md)  
  
The PlayFab Entity Key to associate with a token.  
  
**`entityToken`** &nbsp; const char*  
*is null-terminated*  
  
The PlayFab entity token to associate with `entity`.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded, or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method takes a PlayFab Entity Key as `entity` and a PlayFab Entity Token as `entityToken`. When the library performs operations on behalf of an entity that require authentication or authorization, such as creating or updating a lobby, the library will look up a token associated with the entity to use for the operation. If no token has previously been set for the entity, the operation will synchronously fail. During the asynchronous operation, the PlayFab service will validate that the token is valid, is not expired, is associated with the Entity ID provided, and is authorized to perform the operation. If these conditions aren't met, the operation will fail. <br /><br /> A PlayFab Entity Key and Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method.   <br /><br /> The provided `entity` and `entityToken` must have been acquired using the same PlayFab Title ID that was passed to [PFMultiplayerInitialize()](pfmultiplayerinitialize.md).   <br /><br /> The Multiplayer library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as ```PFMultiplayerCreateAndJoinLobby```. If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Multiplayer library by calling this method again using the same entity key.   <br /><br /> The caller is responsible for monitoring the expiration of the entity token provided to this method. When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Multiplayer library by calling this method again. It is recommended to acquire a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.   <br /><br /> This method synchronously checks only that its arguments are well formed. In an otherwise valid call, it returns `E_POINTER` if `entity` or `entityToken` is null, `0x89236404` if the `id` or `type` of the entity key is null or empty, and `0x89236213` if `entityToken` is empty. If more than one argument is invalid, the first failed check determines the error code; the call can also fail for other reasons, such as an invalid `handle`. This method doesn't check whether the token is valid, unexpired or issued for `entity`; the PlayFab service checks that when a later operation uses the token. For the list of error codes, see [PlayFab Multiplayer C++ SDK error codes](../../pfmultiplayererrors.md).
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerInitialize](pfmultiplayerinitialize.md)  
[PFEntityKey](../pfentitykey_clientsdk.md)
  
  
