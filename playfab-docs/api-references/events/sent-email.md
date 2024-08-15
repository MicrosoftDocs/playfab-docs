---
title: sent_email
author: joannaleecy
description: sent_email event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# sent_email

This event is triggered when an email is sent or fails to send to a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Body|String|The content of the email body, truncated to 4096 characters.|
|EmailName|String|The name of the player's contact email the email was sent to.|
|EmailTemplateId|String|The email template id during a send email attempt.|
|EmailTemplateName|String|The email template name during a send email attempt.|
|EmailTemplateType|[EmailTemplateType](data-types/emailtemplatetype.md)|The email template type during a send email attempt.|
|ErrorMessage|String|The error that occurred if an email failed to send.|
|ErrorName|String|The name of the error that occurred if an email failed to send.|
|Language|String|The language the email was sent in|
|Subject|String|The content of the email subject, truncated to 1024 characters.|
|Success|Boolean|Indicates if the email was successfully sent.|
|TitleId|String|The ID of the title to which this player event applies.|
|Token|String|The auth token included in the sent email as part of a confirmation URL.|

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