---
title: PubSub private preview notes
author: TomGu
description: Private preview release notes for PubSub.
ms.author: tomgu
ms.date: 5/9/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, pubsub, policies
ms.localizationpriority: medium
---

# PlayFab PubSub private preview notes

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

## Early access

PlayFab PubSub is still in active development and will be changing over time. We will strive to avoid breaking changes, but such changes may turn out to be necessary during the preview in order to deliver the optimal experience for customers in the general release. We do not recommend shipping a game to the public which relies on this feature until it is more stable.

## Pricing

For now, there will be no cost to game developers for use of PubSub functionality. However, at some point in the future there will be a charge for this PubSub usage. More details on pricing will be made available, prior to the charges coming into effect.

## Limitations

The following known limitations exist in the system in its current state. Many of these will change in the future.

- PubSub uses PlayStream V2 events.  V2 events can be identified in the PlayStream monitor by a small "v2" icon which shows up on each V2 event.  You can also identify them by namespace.  V2 events have namsepaces which start with either "playfab" or "custom".  V2 events are a work in progress and do not yet support all features of V1 PlayStream events.
- PubSub is only available in the PlayFab SDK for Unity 2018 or later.
- While in private preview, there is no SLA for PlayFab PubSub. We do not recommend shipping a game which uses this feature.
- Only entity-based events are supported in the current version. For custom events, that means any event sent via the [WriteEvents](xref:titleid.playfabapi.com.events.playstreamevents.writeevents) or PublisEvents API. For the full list of supported standard events, see the drop-down in the PubSub Policy UI.
- WriteEvents has a built-in policy on who can send events, which is not affected by the publish policies configured for PubSub.  Publish policies control who can send via the PublishEvents API.
