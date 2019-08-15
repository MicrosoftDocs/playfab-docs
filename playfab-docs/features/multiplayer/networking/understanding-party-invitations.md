---
title: PlayFab Party invitations
description: How PlayFab Party real-time chat and data communication secures and limits access to networks.
author: TBD
ms.author: TBD
ms.date: TBD
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
---

# PlayFab Party Invitations

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS and Android will be available later in 2019. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

PlayFab Party is designed to provide a secure communication environment by default.
This helps protects games and players, but security restrictions can raise API usage questions for developers.
This page introduces common security concepts such as PlayFab Party *access control lists*, and effective patterns for using them.

## What are access control lists?
*Access control lists* are arrays of **PlayFab** `title_player_account` [Entity](/../../data/entities/index.md) IDs that are granted permission to authenticate into a specific network.

An important aspect is that there are multiple *access control lists*.
Each participating user can choose to manage one for the network, and the effective set of new players that are actually permitted to join is the **union** of all existing users' *access control lists*.
This allows scenarios like populating a user's *access control list* with social-platform-specific "friends" or title-implemented "clan" members such that the PlayFab Party network is joinable by just that subset of players and no one else, but without running into a potential privacy issue with sharing a player's friends list to a remote device in order to build a single list.

Games can choose to manage only a single authorative user's *access control list*, all users' *access control lists*, or any combination, and can put the same or different content in each user's list.
The following table shows a variety of simple scenarios for two users managing *access control lists* for two additional users, all of which result in the same effective *access control list* union for the network:

|*Scenario name*                        |*User 1's list*|+|*User 2's list*|=|*Effective list*|
|---------------------------------------|---------------|-|---------------|-|----------------|
|**Every user with unique listed users**|[User3]        |+|[User4]        |=|[User3, User4]  |
|**One user managing for all**          |[User3, User4] |+|               |=|[User3, User4]  |
|**Every user managing matching copies**|[User3, User4] |+|[User3, User4] |=|[User3, User4]  |

When a user is removed from the network, its *access control list* is removed from the effective set.
Any [Entity](/../../data/entities/index.md) IDs that were only in that user's *access control list* and nowhere else will no longer be able to authenticate into the network.

Changes to *access control lists* only impact newly authenticating users that are performing `PartyNetwork::AuthenticateLocalUser()` operations.
No users that have already authenticated into the network are affected, even if their [Entity](/../../data/entities/index.md) IDs are not included in any *access control list* anymore.
However those users would be unable to reauthenticate if they were removed.

> [!NOTE]
> If you want to remove a remote user from the session, you can use the separate `PartyNetwork::KickUser()` or `PartyNetwork::KickDevice()` methods.

There is also a persistent *access control list* that is optionally specified when a network is created using `PartyManager::CreateNewNetwork()`.
This list always implicitly includes the creating `PartyLocalUser` object's [Entity](/../../data/entities/index.md) ID, and may contain any additional IDs desired.
As its name suggests, the users referenced in the persistent *access control list* will be allowed to authenticate into the network for as long as the network exists.
It is **not** removed even if the original network creator is removed from the network (or fails to ever connect to the network).


## Successfully working with access control lists

As described above, PlayFab Party networks always require that you have at least one valid user, and that user must have been authorized ahead of time to actually join the network.
There are two common challenges in working with *access control lists*:
1. Not actually knowing which users to permit ahead of time.
2. Learning the specific **PlayFab** [Entity](/../../data/entities/index.md) ID of a remote user you intend to permit.

Many games find that the solutions to both are related.

Deciding which users should be added to an *access control list* is very clear when you know everyone who should be in the PlayFab Party network.
If you've gathered 4 players together who want to begin communicating in a game lobby, for example, just specify the 4 players to the persistent *access control list* provided when creating the network, or else have the creator place the others in its *access control list* using `PartyNetwork::SetAccessControlList()` once the creator has successfully authenticated into the network.

But what about when you don't know the exact set of users for a network ahead of time?
This may still be straightforward, depending on the scenario.

For example, if the PlayFab Party network is meant to be something like a "friends-only" game session, you can simply have all users that join the network (seeded initially by the creator) call `PartyNetwork::SetAccessControlList()` with their list of friends' [Entity](/../../data/entities/index.md) IDs.
As new friend users come and go, their own friends lists will be incorporated or removed from the effective *access control list*, and in turn allow other friends.
Anyone who isn't a friend of someone currently in the PlayFab Party network will then fail to authenticate into the network.

Games that are accessible by invitation only can also be straightforward.
Before the game transmits the invitation, it simply adds the invited user's [Entity](/../../data/entities/index.md) ID to the *access control list*.
Anyone not invited will be unable to authenticate into the network.
If the invitation expires, the [Entity](/../../data/entities/index.md) ID can be removed from the *access control list*.

The challenges arise when you want to support "unsolicited" players joining a PlayFab Party network without a previously established relationship that can be captured in a finite list.
For example, you want to support arbitrary players selecting other players' game sessions through a "browse" scenario.
The hosting player who created the game session network may not know or have ever encountered the particular browsing player before.

Also, **PlayFab** `title_player_account` [Entity](/../../data/entities/index.md) IDs are assigned to players who have successfully performed [**PlayFab** Player Login](../../authentication/login/index.md) under your **PlayFab** title at least once.
You might be aware of a friend or invited user through an external social platform, but if that user has not played your game yet, it's not possible to add it to an *access control list*.
You will need the player to launch the game and log in first.

For these cases, PlayFab Party may work best when combined with an external, authoritative participant management process, such as a dedicated game server using [**PlayFab Multiplayer Servers**](../servers/index.md), or a custom web service.
That is, the game should track all game sessions and their participants, including their **PlayFab** [Entity](/../../data/entities/index.md) IDs once known, in this external "session directory" or "roster" web service.
When the browsing or first-time player decides to connect to the hosting player's game session, it should perform any operation and policy checks needed to join the external web service game session first.
That action should in turn alert the player(s) already in the network to the change in the official list of participating **PlayFab** [Entity](/../../data/entities/index.md) IDs so they can add the new intended player to the PlayFab Party network access control lists.
When the *access control list* or lists have been successfully updated, the roster web service should again by updated to inform the browsing player it's now safe to start connecting and authenticating through the PlayFab Party API.


## Other security features protecting networks

PlayFab Party uses industry-standard encryption and authentication for all communication it performs for management and real-time communication.
This includes all peer-to-peer transmissions and all transactions to **Azure** services, whether they're web services (which use HTTPS) or the transparent cloud relay service (which uses DTLS).

Games must use caution choosing how and where to share network descriptors, and when triggering requests to update to network *access control lists* through external services.
A PlayFab Party network is only as secure as those you permit to connect and authenticate into it.
However, within a network, you are not expected to need or use your own cryptography to protect chat or data.


#### Next steps
* [Learn how PlayFab Party interacts with your discovery flows](understanding-party-discovery.md)
