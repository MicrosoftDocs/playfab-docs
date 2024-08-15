---
title: Porting to PlayFab Party from Sockets
description: Tips and considerations when porting your game from sockets to the PlayFab Party real-time chat and data communication API.
author: TBD
ms.author: joanlee
ms.date: 08/15/2019
ms.topic: article
ms.service: azure-playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, networking
---
# Porting to PlayFab Party from Sockets

**TBD**


|Sockets call             |PlayFab Party equivalents                                                                                 |
|-------------------------|----------------------------------------------------------------------------------------------------------|
|`WSAStartup()` (Winsock)|`PartyManager::Initialize()`, `PartyManager::CreateLocalUser()`                                 |
|`socket()`              |`PartyManager::CreateNewNetwork()`, `PartyNetwork::ConnectToNetwork()`                          |
|`getsockaddr()`        |`PartyNetwork::GetNetworkDescriptor()`, `PartyManager::SerializeNetworkDescriptor`()          |
|`connect()`             |`PartyNetwork::ConnectToNetwork()` `PartyNetwork::CreateEndpoint()`                             |
|`send()`                |`PartyEndpoint::SendMessage()`                                                                        |
|`recv()`                |`PartyManager::StartProcessingStateChanges()`, `PartyManager::FinishProcessingStateChanges()`|
