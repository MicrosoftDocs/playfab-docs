---
title: studio_user_added
author: joannaleecy
description: studio_user_added event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# studio_user_added

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AuthenticationId|String|Authentication provider's ID for this user|
|AuthenticationProvider|[AuthenticationProvider](../data-types/authenticationprovider.md)|Authentication provider for the user|
|AuthenticationProviderId|String|Authentication provider entity id, if needed by the provider|
|Email|String|User's email|
|InvitationId|String|Id of the invitation record if user needed to register|
|PlayFabId|String|PlayFab ID for this user|
|StudioPermissions|[]|Array of studio permissions that were be granted to the user|
|TitlePermissions|Object|Dictionary of title id, title permissions that were granted to the user|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
