---
title: items_purchased
author: fprotti96
description: ItemsPurchased event.
ms.author: fprotti
ms.date: 09/29/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_purchased

Event raised when items have been purchased from an inventory.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|TransactionId|String|The transaction id.|
|CollectionId|String|The collection id.|
|ItemId|String|The item id.|
|StackId|String|The stack id.|
|Amount|int?|The amount of items that were puchased.|
|DurationInSeconds|long?|The duration of the item that was purchased.|
|SalePriceAmounts|List<[PurchasePriceAmount](data-types/purchasepriceamount.md)>|The per-item price amounts the item was purchased at.|
|StoreId|String|The id of the Store the item was purchased from or null.|
|ItemType|String|The type of the catalog item that was modified in the transaction.|

## Common Properties

All PlayStream events are formatted as JSON objects and share the following common properties:

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CustomTags|Object|Key-Value pair storage. Any provider of this event schema is allowed to send additional values in this property.|
|EntityId|String|The identifier for the entity (title, player, etc) to which this event applies.|
|EntityType|String|The type of entity (player, title, etc.) to which this event applies. If PlayFab is meant to take action on this entity, then the EntityType must be either 'player', 'character', or 'title'. It is required that any entity type that PlayFab does not currently parse should be prepended with a namespace (like 'com.mygame.guild') as PlayFab may begin to parse root entities at any time.|
|EventId|String|PlayFab-assigned unique identifier for this event.|
|EventName|String|"items_purchased"|
|EventNamespace|String|"playfab.inventory"|
|History|[PlayStreamEventHistory](data-types/playstreameventhistory.md)|The history of events associated with this event. This is set in cases where an event has generated children events via a trigger action.|
|Reserved|object|Reserved exclusively for PlayFab internal use.|
|Source|String|The name of the source of this PlayStream event; will be PlayFab if the event originated from us.|
|SourceType|[SourceType](data-types/sourcetype.md)|The type of source of this event (PlayFab partner, other backend, or from the PlayFab API).|
|Timestamp|DateTime|The time (in UTC) associated with this event.|
