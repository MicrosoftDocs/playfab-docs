---
title: client_authentication_completed
author: raulalbertog
description: client_authentication_completed event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_authentication_completed

This event is triggered when client authentication is completed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|The client-generated globally unique identifier of this instance of the Party library.|
|NetworkIdentifier|String|The network's unique identifier at the time of this event.|
|AuthDurationInMs|uint32|The duration of the isolated authentication operation in milliseconds.|
|TotalDurationInMs|uint32|The duration of the authentication operation and all associated operations queued before it in milliseconds.|
|LocalConnectionId|uint32|A local identifier to disambiguate multiple connections to the same network from a single client.|
|Result|int32|The PartyStateChangeResult of the operation.|
|ResultMessage|String|A human-readable representation of the Result value.|
|ErrorDetail|uint32|The PartyError error detail code.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
