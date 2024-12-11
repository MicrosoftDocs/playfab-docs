---
author: vicodex
title: OnNetworkChanged
description: Occurs when the Network changes.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# OnNetworkChanged

Occurs when the Network changes. When this event fires you must move all the players to the new network, specified in the newNetworkID so the players can continue to communicate.

## Arguments

### sender (object)

The class that raised the event.

### newNetworkId (string)

The identifier for the new network.