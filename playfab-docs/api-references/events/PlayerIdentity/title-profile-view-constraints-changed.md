---
title: title_profile_view_constraints_changed
author: joannaleecy
description: title_profile_view_constraints_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_profile_view_constraints_changed

This event is triggered when a profile view constraint is changed for the title.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|PreviousProfileViewConstraints|String|Profile view constraints before the change as a JSON string.|
|ProfileType|String|The profile type of the profile view constraints.|
|ProfileViewConstraints|String|Profile view constraints after the change as a JSON string.|
|UserId|String||

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
