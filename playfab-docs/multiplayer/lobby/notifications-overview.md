---
title: Lobby notifications
author: joannaleecy
description: Learn about Lobby notifications.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, notifications
ms.localizationpriority: medium
---

# Lobby notifications
 

> [!IMPORTANT]
> This doc page is currently unlinked. It describes service APIs not yet intended to be called by customers.

Lobby notifications allow players to subscribe and receive real-time push notifications. It's part of the Lobby service and you can use Lobby subscribe APIs implement this for your title.

Today, players can receive messages about two types of information. Using Lobby, you don't have to create a notification system or integrate a separate system for these message notifications. 

1. [Lobby changes](#lobby-changes)
1. [Lobby invites](#lobby-invites)

## Lobby changes

Whenever lobby properties change, message notifications can be sent to owners and members of the lobby. 

Use __SubscribeToLobbyResource__ to subscribe players to lobby change notifications.

## Lobby invites

Use __InviteToLobby__ when an invite is sent. This allows the player who receives the invite to get a notification.

## See also

* [Lobby SDK reference](playfabmultiplayerreference-cpp\pflobby\pflobby_members.md)
* [Lobby invites](lobby-invites.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Lobby properties](lobby-properties.md)
* [Create a lobby](create-a-lobby.md)
