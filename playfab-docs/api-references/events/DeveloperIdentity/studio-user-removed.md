---
title: studio_user_removed
author: joannaleecy
description: studio_user_removed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# studio_user_removed

This event is triggered when a user is removed from a studio.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AuthenticationId|String|Authentication provider's ID for this user|
|AuthenticationProvider|[AuthenticationProvider](../data-types/authenticationprovider.md)|Authentication provider for the user|
|AuthenticationProviderId|String|Authentication provider entity id, if needed by the provider|
|PlayFabId|String|PlayFab ID for this user|
|StudioPermissions|[]|Array of studio permissions that the user had|
|TitlePermissions|Object|Dictionary of title id, title permissions that the user had|


## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
