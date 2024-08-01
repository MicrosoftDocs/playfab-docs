---
title: marketplace_transaction_redeemed
author: fprotti96
description: marketplace_transaction_redeemed event.
ms.author: fprotti
ms.date: 04/26/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# marketplace_transaction_redeemed

This event is triggered when a bundle or subscription has been redeemed to an inventory.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Marketplace|String|The name of the marketplace the items were redeemed from.|
|MarketplaceTransctionId|String|The transaction Id from the marketplace the items were redeemed from.|
|MarketplaceAlternateId|String|The alternate Id of the item for the marketplace.|
|Amount|int?|The amount that was redeemed.|
|DurationInSeconds|long?|The amount of subscription that was redeemed.|
|ItemId|String|The identifier of the item that was redeemed.|
|ItemType|String|The type of the catalog item that was redeemed.|
|RealMoneyPrices|Dictionary<string, int>|The multi-currency unit price, in real money, of the item that was redeemed. The property is a dictionary where the key is the three-letter currency code as defined in ISO 4217, and the value is the currency amount in the smallest unit (for example, cents, pence) in accordance with ISO 4217. Only United States Dollar (USD) is currently supported. Example: If the product price in USD is $1.39, the dictionary entry would be: ["USD"] = 139;|

## Common properties

All PlayStream events are formatted as JSON objects and share the following common properties.

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CustomTags|Object|Key-Value pair storage. Any provider of this event schema is allowed to send additional values in this property.|
|EntityId|String|The identifier for the entity (such as title and player) to which this event applies.|
|EntityType|String|The type of entity (such as player and title) to which this event applies. If PlayFab is meant to take action on this entity, then the EntityType must be either 'player', 'character', or 'title'. It is required that any entity type that PlayFab does not currently parse should be prepended with a namespace (like **com.mygame.guild**) as PlayFab may begin to parse root entities at any time.|
|EventId|String|PlayFab-assigned unique identifier for this event.|
|EventName|String|The name of this event.|
|EventNamespace|String|The assigned namespacing for this event. For example: **com.myprogram.ads**|
|History|[PlayStreamEventHistory](data-types/playstreameventhistory.md)|The history of events associated with this event. This is set in cases where an event has generated children events via a trigger action.|
|Reserved|object|Reserved exclusively for PlayFab internal use.|
|Source|String|The name of the source of this PlayStream event; will be PlayFab if the event originated from us.|
|SourceType|[SourceType](data-types/sourcetype.md)|The type of source of this event (PlayFab partner, other backend, or from the PlayFab API).|
|Timestamp|DateTime|The time (in UTC) associated with this event.|


