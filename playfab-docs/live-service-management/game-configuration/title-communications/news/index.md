---
title: News
author: joannaleecy
description: Landing page for News.
ms.author: joanlee
ms.date: 11/01/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, title news
ms.localizationpriority: medium
---

# News

Title News is a mechanism for broadcasting information to your players. It allows you to post updates about things such as upcoming in-game events, patch notes, future downtime, community activity, or anything else you'd like your players to know.

Each post contains a few basic elements:

- **Title**
- **Date**
- **Status**
- **Body**

Posts can be published and made available to users immediately upon creation, or scheduled to go live at a time in the future. After publishing posts in PlayFab via Game Manager or the [`AddNews`](xref:titleid.playfabapi.com.admin.title-widedatamanagement.addnews) API, your client can call [`GetTitleNews`](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitlenews) to retrieve a list of all active posts and then display them to the user however you choose.
