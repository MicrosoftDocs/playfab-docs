---
title: Photon
author: joannaleecy
description: Landing page for Photon.
ms.author: joanlee
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, photon
ms.localizationpriority: medium
---

# Photon

Multiplayer games are typically one of two designs:

1. Authoritative
2. Non-authoritative.

Authoritative games have a central authority for game state, this may be a player device or a cloud-hosted dedicated server. Non-authoritative designs require player devices to synchronize game state cooperatively, over a peer-to-peer network.

Photon is a 3rd party partner integrated with PlayFab, that provides peer-to-peer networking. Currently, PlayFab offers the following Photon integrations:

- Authenticate Photon players with PlayFab.
- Listen for room events using PlayFab CloudScript callbacks.
