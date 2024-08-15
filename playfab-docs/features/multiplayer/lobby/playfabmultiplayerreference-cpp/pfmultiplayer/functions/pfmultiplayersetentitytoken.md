---
author: ScottMunroMS
title: "PFMultiplayerSetEntityToken"
description: "Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
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
  
**`entity`** &nbsp; [PFEntityKey*](../pfentitykey_clientsdk.md)  
  
The PlayFab Entity Key to associate with a token.  
  
**`entityToken`** &nbsp; char*  
*is null-terminated*  
  
TBD    
  
  
### Return value
Type: HRESULT
  
```S_OK``` if creating the local user succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method takes a PlayFab Entity Key as `entity` and a PlayFab Entity Token as `token`. When the library performs operations on behalf of an entity that require authentication or authorization, such as creating or updating a lobby, the library will look up a token associated with the entity to use for the operation. If no token has previously been set for the entity, the operation will synchronously fail. During the asynchronous operation, the PlayFab service will validate that the token is valid, is not expired, is associated with the Entity ID provided, and is authorized to perform the operation. If these conditions aren't met, the operation will fail. <br /><br /> A PlayFab Entity Key and Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method.   <br /><br /> The provided `entity` and `token` must have been acquired using the same PlayFab Title ID that was passed to [PFMultiplayerInitialize()](pfmultiplayerinitialize.md).   <br /><br /> The Multiplayer library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as ```PFMultiplayerCreateAndJoinLobby```. If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Multiplayer library by calling this method again using the same entity key.   <br /><br /> The caller is responsible for monitoring the expiration of the entity token provided to this method. When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Multiplayer library by calling this method again. It is recommended to acquire a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.   <br /><br /> No synchronous validation is performed on these values.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerInitialize](pfmultiplayerinitialize.md)
  
  
