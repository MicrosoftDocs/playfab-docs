---
title: PlayFab Services SDK Release Notes 2024
author: amccalib
description: PlayFab Services SDK Release Notes for 2024.
ms.author: andmcc
ms.date: 02/02/2024
ms.topic: article
ms.service: playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Services SDK Release Notes 2024

> [!NOTE]
> For release notes about service releases and product updates, see the [release notes](https://github.com/PlayFab/PlayFab/releases) section on [PlayFab's public GitHub repository](https://github.com/PlayFab/PlayFab)

## 240202

Date: February 2, 2024

 - Added GetPlayFabIDsFromPSNOnlineIDs call to the Client and Server APIs.

## 240119

Date: January 19, 2024

 - Added RoutingPreference to ListQosServersForTitleRequest in the Multiplayer API
 - Made the following changes to LobbyAsServer preview feature in the Multiplayer API:
   - Added Server property to Lobby object returned by Lobby API calls
   - Renamed Server property in UpdateLobbyAsServerRequest to ServerEntity
   - Removed ServerDataStatus from JoinLobbyAsServerResult
 - Added error codes for new service errors.

## 240105

Date: January 5, 2024

 - Added error codes for new service errors.
