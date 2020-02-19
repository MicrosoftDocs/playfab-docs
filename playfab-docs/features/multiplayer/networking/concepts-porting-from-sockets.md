---
title: Porting to PlayFab Party from Sockets
description: Tips and considerations when porting your game from sockets to the PlayFab Party real-time chat and data communication API.
author: TBD
ms.author: TBD
ms.date: 08/15/2019
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, networking
---
# Porting to PlayFab Party from Sockets

> [!IMPORTANT]
> This feature is currently in **Preview**. It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> PlayFab customers in the Indie, Pro, and Enterprise tiers can access the Matchmaking and Party previews automatically through Game Manager. Xbox managed partners are also invited for the preview in the free tier and can get a preview access code from your Microsoft developer partner manager.

**TBD**


|Sockets call             |PlayFab Party equivalents                                                                                 |
|-------------------------|----------------------------------------------------------------------------------------------------------|
|`WSAStartup()` (Winsock)|`PartyManager::Initialize()`, `PartyManager::CreateLocalUser()`                                 |
|`socket()`              |`PartyManager::CreateNewNetwork()`, `PartyNetwork::ConnectToNetwork()`                          |
|`getsockaddr()`        |`PartyNetwork::GetNetworkDescriptor()`, `PartyManager::SerializeNetworkDescriptor`()          |
|`connect()`             |`PartyNetwork::ConnectToNetwork()` `PartyNetwork::CreateEndpoint()`                             |
|`send()`                |`PartyEndpoint::SendMessage()`                                                                        |
|`recv()`                |`PartyManager::StartProcessingStateChanges()`, `PartyManager::FinishProcessingStateChanges()`|
