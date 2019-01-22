---
title: Title Data
author: v-thopra
description: Landing page for Title Data.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, configuration, title data
ms.localizationpriority: medium
---

# Title Data

Title Data is a set of key/value pairs that you can use to manage configuration for your game remotely. You can set this data in Game Manager or via API.

Internal Title Data is a special set of Title Data that cannot be accessed by clients directly and can be used for storing configuration that is only available to services you control.

> [!NOTE]
> Title Data values are copied and distributed to potentially hundreds of machines in the PlayFab server cluster. As part of this process, Title Data is cached, and changes may take up to fifteen minutes to refresh in those caches. Title Data is best suited for "global constant/static data" and is not suitable or reliable as "global variables".

## Links

- [Title Data quickstart](quickstart.md)
- [Title Data Tutorials](tutorials.md)
