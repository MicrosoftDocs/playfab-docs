---
title: studio_user_invited
author: joannaleecy
description: studio_user_invited event.
ms.author: jenelleb
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
|AuthenticationProvider|[AuthenticationProvider](../data-types/authenticationprovider.md)|Authentication provider type required for user to register with|
|AuthenticationProviderId|String|Authentication provider entity id, if needed by the provider.|
|Email|String|Email the invitation was sent to|
|InvitationExpires|DateTime|Expiration of the invitation|
|InvitationId|String|Id of the invitation if user needed to register|
|InvitedExistingUser|Boolean|Indicates if the user invited already existed, if so no invitation record was created and the user was automatically attached|
|InvitorPlayFabId|String|Identity of the user who created the invitation|
|StudioPermissions|[]|Array of studio permissions which will be granted to the user when registering|
|TitlePermissions|Object|Dictionary of title id, title permissions which will be granted to the user when registering|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
