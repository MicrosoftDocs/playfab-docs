---
title: title_api_settings_changed
author: joannaleecy
description: title_api_settings_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_api_settings_changed

This event is triggered when an API Features setting is changed for the title.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|PreviousSettingsValues|[APISettings](../data-types/apisettings.md)|Settings values before the change.|
|SettingsValues|[APISettings](../data-types/apisettings.md)|Settings values after the change.|
|UserId|String||

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
