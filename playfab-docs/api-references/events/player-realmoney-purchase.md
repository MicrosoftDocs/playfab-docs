---
title: player_realmoney_purchase
author: joannaleecy
description: player_realmoney_purchase event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_realmoney_purchase

This event is triggered when a player makes a real money purchase, and generates revenue for the game.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|OrderId|String|Unique identifier of the order.|
|OrderTotal|uint32|Total value of the purchase in the system currency (defaults to USD).|
|PaymentProvider|String|Payment provider used to make the purchase.|
|PaymentType|[PaymentType](data-types/paymenttype.md)|Type of payment used to make the purchase.|
|PurchasedProduct|[]|The ItemIds from the catalog of the purchased items, if applicable.|
|TitleId|String|The ID of the title to which this player event applies.|
|TransactionCurrency|[Currency](data-types/currency.md)|Local currency used to make the purchase, if applicable.|
|TransactionId|String|Unique identifier of the transaction.|
|TransactionTotal|uint32|Total value of the purchase in the local currency used to make the purchase, if applicable.|

## Common Properties

All PlayStream events are formatted as JSON objects and share the following common properties:

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CustomTags|Object|Key-Value pair storage. Any provider of this event schema is allowed to send additional values in this property.|
|EntityId|String|The identifier for the entity (title, player, etc) to which this event applies.|
|EntityType|String|The type of entity (player, title, etc.) to which this event applies. If PlayFab is meant to take action on this entity, then the EntityType must be either 'player', 'character', or 'title'. It is required that any entity type that PlayFab does not currently parse should be prepended with a namespace (like 'com.mygame.guild') as PlayFab may begin to parse root entities at any time.|
|EventId|String|PlayFab-assigned unique identifier for this event.|
|EventName|String|The name of this event.|
|EventNamespace|String|The assigned namespacing for this event. For example: 'com.myprogram.ads'|
|History|[PlayStreamEventHistory](data-types/playstreameventhistory.md)|The history of events associated with this event. This is set in cases where an event has generated children events via a trigger action.|
|Reserved|object|Reserved exclusively for PlayFab internal use.|
|Source|String|The name of the source of this PlayStream event; will be PlayFab if the event originated from us.|
|SourceType|[SourceType](data-types/sourcetype.md)|The type of source of this event (PlayFab partner, other backend, or from the PlayFab API).|
|Timestamp|DateTime|The time (in UTC) associated with this event.|