---
author: vicodex
title: PlayFabMultiplayer.SetEntityToken
description: PlayFabMultiplayer.SetEntityToken
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.SetEntityToken

## Method (1 of 2)

Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token.

```csharp
public static void SetEntityToken(PlayFabAuthenticationContext localMember)
```

| parameter | description |
| --- | --- |
| localMember | The PlayFab PlayFabAuthenticationContext containing the entity and token. |

## Remarks (1 of 2)

This method takes a PlayFabAuthenticationContext `authContext` returned by a PlayFab login method. When the library performs operations on behalf of an entity that require authentication or authorization, such as creating or updating a lobby, the library will look up a token associated with the entity to use for the operation. If no token has previously been set for the entity, the operation will synchronously fail. During the asynchronous operation, the PlayFab service will validate that the token is valid, is not expired, is associated with the Entity ID provided, and is authorized to perform the operation. If these conditions aren't met, the operation will fail.

A PlayFab Entity Key and Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method.

The provided `authContext` must have been acquired using the same PlayFab Title ID that was passed to [`Initialize`](./Initialize.md).

The Multiplayer library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as [`CreateAndJoinLobby`](./CreateAndJoinLobby.md). If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Multiplayer library by calling this method again using the same entity key.

The caller is responsible for monitoring the expiration of the entity token provided to this method. When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Multiplayer library by calling this method again. It is recommended to acquire a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.

---

## Method (2 of 2)

Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token.

```csharp
public static void SetEntityToken(PFEntityKey localMember, string entityToken)
```

| parameter | description |
| --- | --- |
| localMember | The PlayFab Entity Key to associate with a token. |
| entityToken | The PlayFab Entity token to associate with an entity. |

## Remarks (2 of 2)

This method takes a PlayFab Entity Key as *localMember* and a PlayFab Entity Token as *entityToken*. When the library performs operations on behalf of an entity that require authentication or authorization, such as creating or updating a lobby, the library will look up a token associated with the entity to use for the operation. If no token has previously been set for the entity, the operation will synchronously fail. During the asynchronous operation, the PlayFab service will validate that the token is valid, is not expired, is associated with the Entity ID provided, and is authorized to perform the operation. If these conditions aren't met, the operation will fail.

A PlayFab Entity Key and Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method.

The provided *localMember* and *entityToken* must have been acquired using the same PlayFab Title ID that was passed to [`Initialize`](./Initialize.md).

The Multiplayer library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as [`CreateAndJoinLobby`](./CreateAndJoinLobby.md). If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Multiplayer library by calling this method again using the same entity key.

The caller is responsible for monitoring the expiration of the entity token provided to this method. When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Multiplayer library by calling this method again. It is recommended to acquire a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.

## See Also

* method [Initialize](./Initialize.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

