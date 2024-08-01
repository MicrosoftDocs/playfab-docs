---
title: studio_user_invited
author: joannaleecy
description: studio_user_invited event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# studio_user_invited

This event is triggererd when a user is invited to a studio.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AuthenticationProvider|[AuthenticationProvider](data-types/authenticationprovider.md)|Authentication provider type required for user to register with|
|AuthenticationProviderId|String|Authentication provider entity id, if needed by the provider.|
|Email|String|Email the invitation was sent to|
|InvitationExpires|DateTime|Expiration of the invitation|
|InvitationId|String|Id of the invitation if user needed to register|
|InvitedExistingUser|Boolean|Indicates if the user invited already existed, if so no invitation record was created and the user was automatically attached|
|InvitorPlayFabId|String|Identity of the user who created the invitation|
|StudioPermissions|[]|Array of studio permissions which will be granted to the user when registering|
|TitlePermissions|Object|Dictionary of title id, title permissions which will be granted to the user when registering|

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