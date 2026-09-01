---
title: Player Data
author: DanBehrendt
description: Landing page for Player Data.
ms.author: jenelleb
ms.date: 08/28/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# Player Data

Player Data is per-player storage scoped to player entities (`title_player_account`, `master_player_account`, and `character`). Use it to store game progress, preferences, and other information tied to an individual player.

Player Data is one of several storage features in PlayFab, each scoped to a different entity type. For a comparison, see [Entity Objects](../../live-service-management/game-configuration/entities/entity-objects.md#related-features).

## Storage options

PlayFab provides two ways to store player data:

- [Entities](../../live-service-management/game-configuration/entities/index.md): Allows you to store data in objects and files across Players, Characters, and Groups.
- [Player Data/UserData](quickstart.md): Allows you to store Key/Value pair data for players.

To provide the most flexibility and best performance, we recommended that *all* new titles use [Entity objects](../../live-service-management/game-configuration/entities/entity-objects.md).

In the PlayFab APIs, the function names use the term **UserData**. In the **Game Manager**, this concept is described as **Player Data**. They're identical, and interchangeable.

There are three modes of access to player data:

- Client: This is player data that's available to your title client to read and update. You use the client APIs [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) to create, update, or delete and [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) to read data for the player.
- Read Only: This is player data that's created or updated by your server. Your title client can read, but not update, this data. You use the server API [UpdateUserReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) to create, update, or delete and the client API [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) to read title-specific data for the player. This data is visible to the player, but can only be modified by the server.
- Internal: This is player data that's only available to your server. You use the server APIs [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) to create, update, or delete and [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) to read title-specific data for the player. This data is server-only, and can't be seen by the client.

When you use player data, only User Data and User Read Only Data are available to the Client API. If you have player data that another player should be able to read, you need to set the `Permission` value  to `Public` when you write the data.

## Player data vs player publisher data

[Player data](quickstart.md) is player information that's specific to a game title. It should be used for title-specific information - such as saving your player's position in a dungeon, or other game-specific data.

Player Publisher data is associated with a player's `master_player_account` in the namespace rather than with a `title_player_account`. Use it to save player information relevant to all titles in the namespace, such as cross-title rewards.

The Publisher ID identifies the namespace; **publisher** is the older API term for this scope. By default, all titles in a studio share one Publisher ID. The player's master player account provides cross-title identity in that namespace, while the player also has distinct data in each title player account. For more information, see [PlayFab concepts](../../get-started/concepts.md#studios-namespaces-and-titles).

> [!NOTE]
> Some legacy configurations have multiple Publisher IDs in one studio or share a Publisher ID across studios. These configurations are uncommon.

> [!NOTE]
> Please don't confuse *player* Publisher data with [Publisher data](../../live-service-management/game-configuration/titledata/using-publisher-data.md) which is Key/Value Pair data shared by all titles (it is *not* per-player).

Player Publisher data usage is nearly identical to player data usage. They're *both* dictionaries mapping a string to a JSON blob (or other arbitrary string value).

For more information, see [How to use player publisher data to grant a reward for playing multiple titles](using-player-publisher-data.md).
