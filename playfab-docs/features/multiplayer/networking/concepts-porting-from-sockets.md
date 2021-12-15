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
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS and Android are available now. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

**TBD**


|Sockets call             |PlayFab Party equivalents                                                                                 |
|-------------------------|----------------------------------------------------------------------------------------------------------|
|`WSAStartup()` (Winsock)|`PartyManager::Initialize()`, `PartyManager::CreateLocalUser()`                                 |
|`socket()`              |`PartyManager::CreateNewNetwork()`, `PartyNetwork::ConnectToNetwork()`                          |
|`getsockaddr()`        |`PartyNetwork::GetNetworkDescriptor()`, `PartyManager::SerializeNetworkDescriptor`()          |
|`connect()`             |`PartyNetwork::ConnectToNetwork()` `PartyNetwork::CreateEndpoint()`                             |
|`send()`                |`PartyEndpoint::SendMessage()`                                                                        |
|`recv()`                |`PartyManager::StartProcessingStateChanges()`, `PartyManager::FinishProcessingStateChanges()`|
