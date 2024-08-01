---
title: Player Data
author: DanBehrendt
description: Landing page for Player Data.
ms.author: joanlee
ms.date: 06/12/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# Player Data

Player data is information about a player that is stored to the PlayFab service that you can share across multiple devices and multiple games.

PlayFab provides two ways to store player data:

- [Entities](../entities/index.md): Allows you to store data in objects and files across Players, Characters, and Groups.
- [Player Data/UserData](quickstart.md): Allows you to store Key/Value pair data for players.

To provide the most flexibility and best performance, we recommended that *all* new titles use [Entity objects](../entities/entity-objects.md).

In the PlayFab APIs, the function names use the term **UserData**. In the **Game Manager**, this concept is described as **Player Data**. They are identical, and interchangeable.

There are three modes of access to player data:

- Client: This is player data that is available to your title client to read and update. You use the client APIs [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) to create, update, or delete and [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) to read data for the player.
- Read Only: This is player data that is created or updated by your server. Your title client can read, but not update, this data. You use the server API [UpdateUserReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) to create, update, or delete and the client API [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) to read title-specific data for the player. This data is visible to the player, but can only be modified by the server.
- Internal: This is player data that is only available to your server. You use the server APIs [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) to create, update, or delete and [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) to read title-specific data for the player. This data is server-only, and cannot be seen by the client.

When you use player data, only User Data and User Read Only Data are available to the Client API. If you have player data that another player should be able to read, you need to set the `Permission` value  to `Public` when you write the data.

## Player data vs player publisher data

[Player data](quickstart.md) is player information that is specific to a game title. It should be used for title-specific information - such as saving your player's position in a dungeon, or other game-specific data.

Player Publisher data is data associated with the player account, as opposed to the player account *plus* the title. It is used to save information about a player relevant to all titles in your studio (which may also contain title-specific information, for purposes of cross-title rewards).

All titles within a studio in PlayFab share a Publisher ID by default, and that ID defines this relationship. Player accounts exist at the Publisher layer, and are shared across all titles with the same Publisher ID (and then additionally have distinct player data per title).

If you need to have titles in a studio that have different Publisher IDs, or titles in different studios that share the same Publisher ID, you can open a ticket in the [PlayFab community forums](https://community.playfab.com/) and our **Developer Success** team will help you out.

> [!NOTE]
> Please don't confuse *player* Publisher data with [Publisher data](../titledata/using-publisher-data.md) which is Key/Value Pair data shared by all titles (it is *not* per-player).

Player Publisher data usage is nearly identical to player data usage. They are *both* dictionaries mapping a string to a JSON blob (or other arbitrary string value).

For more information, see [How to use player publisher data to grant a reward for playing multiple titles](using-player-publisher-data.md).