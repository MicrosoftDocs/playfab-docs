---
title: character_inventory_item_added
author: joannaleecy
description: character_inventory_item_added event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# character_inventory_item_added

This event is triggered when an item is granted to a character.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Annotation|String|Optional details about the inventory item.|
|BundleContents|[]|Catalog item IDs of any other items granted to the character along with this one as part of a bundle.|
|CatalogVersion|String|Catalog version in which the item that was added is defined.|
|Class|String|Class of the item that was added.|
|CouponCode|String|Redeemed coupon (if any) that granted the item.|
|DisplayName|String|Display name of the item that was added.|
|Expiration|DateTime|When the item expires. The value is null if the item does not expire.|
|InstanceId|String|Unique instance ID of the inventory item that was added.|
|ItemId|String|Catalog item ID of the inventory item that was added.|
|PlayerId|String||
|RemainingUses|uint32|How many uses the item has, if it has a limited number of uses.|
|TitleId|String||

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