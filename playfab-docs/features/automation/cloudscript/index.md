---
title: CloudScript
author: joannaleecy
description: Landing page for CloudScript.
ms.author: joanlee
ms.date: 06/12/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, automation, cloudscript, error handling
ms.localizationpriority: medium
---

# CloudScript

CloudScript is one of PlayFab’s most versatile features. It allows client code to request execution of any custom server-side functionality you can implement, and it can be used in conjunction with virtually *anything*.

CloudScript enables you to build server-side logic and functionality that scales to meet your demand, without worrying about servers or infrastructure. You can create CloudScript functions that can only be accessed via your service, to prevent any tampering attempts from clients.

For example, you can have a client request a “daily reward” from your game, and trust your server-side validation to prevent granting the reward twice.

## Links

To get started with CloudScript you can follow the documentation here:
- [CloudScript quickstart](quickstart.md)
- [CloudScript tutorials](tutorials.md)

To leverage the power of [CloudScript using Azure Functions](../cloudscript-af/index.md), check out our [CloudScript using Azure Functions quickstart guide](../cloudscript-af/quickstart.md).