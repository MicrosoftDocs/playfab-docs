---
title: Game Saves limits
author: ajskew
description: Limits for Game Saves
ms.author: askew
ms.date: 06/24/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

# Limits for Game Saves

There are two limits to be aware of when using Game Saves:

- Title players are limited to 256MB of storage per title.
- Title players are limited to 100 service endpoint requests in any 2-minute period. This roughly maps to uploading via the client API 10 times per minute so you should not hit this limit.
