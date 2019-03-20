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
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

**PlayFab UGC** is a new premium feature for assisting titles that want to build user generated content systems for their games. It’s a full set of **APIs** that allow for content creation, upload, search and simple moderation scenarios. It's designed to provide out-of-the box capabilities that normally require a bit of custom work and service expertise to accomplish.

## Early Access

**PlayFab UGC** is still in active development, and will be changing over time. We will strive to avoid breaking changes, but such changes may turn out to be necessary during the preview, in order to deliver the optimal experience for customers in the general release. We *do not* recommend shipping a game to the public which relies on this feature until it is more stable.

## Pricing

For now there will be no cost to game developers for use of the **UGC** - however at some point in the future there will be a charge for usage. More details on pricing will be made available prior to the charges coming into effect.

## Limitations

The following *known* limitations exist in the system in its current state. Many of these will change in the future.

- **UGC** is only available via server to server calls (no **SDK** support yet) - this will change in the near future.
- **UGC** *only* supports entity-based users.
- There is currently no **UX/Game Manger** support (just **APIs**) - this will change in the near future.
