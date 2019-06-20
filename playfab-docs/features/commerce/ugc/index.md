---
title: User Generated Content (UGC)
author: thomasgu
description: Overview of the PlayFab User Generated Content feature.
ms.author: thomg
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, monetization, ugc
ms.localizationpriority: medium
---

# PlayFab User Generated Content (UGC)

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

PlayFab UGC is a new premium feature for assisting titles that want to build user generated content systems for their games. It contains a full set of APIs that allow for content creation, upload, search and simple moderation scenarios. It's designed to provide out-of-the box capabilities that normally require a bit of custom work and service expertise to accomplish.

## Early access

PlayFab UGC is still in active development. At this point API contracts are generally locked, and we strive to avoid breaking changes, but such changes may turn out to be necessary in order to deliver the optimal experience for customers. We *do not* recommend shipping a game to the public which relies on this feature until it is in Public Preview.

## Pricing

For now there will be no cost to game developers for the use of the UGC. UGC will be charged in the same way other PlayFab services are charged (consumption based similar to other Azure hosted services). More details on pricing will be made available prior to the charges coming into effect.

## Limitations

The following limitations exist in the system in its current state. Many of these will change in the future.

- UGC *only* supports PlayFab Entities - you need to use entity-based authentication to utilize UGC.
- UGC Ties into Playfab V2 Economy features, and does not work with the classic PlayFab commerce APIs
- Although UGC Search and Item Details are part of the Game Manger preview UX flows do not exist for all of the V2 Monetization features. These are in development and will be coming online in the near future.
