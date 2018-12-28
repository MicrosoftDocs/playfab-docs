---
title: PubSub policies
author: MarcoWilliamsPF
description: Private preview release notes for PubSub.
ms.author: mawillia
ms.date: 12/21/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, pubsub, policies
ms.localizationpriority: medium
---

# PlayFab PubSub private preview notes

## Private preview state

PlayFab PubSub is currently available as a private preview. It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development. Access to PubSub is restricted to select titles. Reach out to [devrel@playfab.com](mailto:devrel@playfab.com) if you are interested in trying it out but don't yet have access.  

PlayFab PubSub is still in active development and will be changing over time. We will strive to avoid breaking changes, but such changes may turn out to be necessary during the preview in order to deliver the optimal experience for customers in the general release. We do not recommend shipping a game to the public which relies on this feature until it is more stable.

For now there will be no cost to game developers for use of the PubSub functionality, however at some point in the future there will be a charge for PubSub usage. More details on pricing will be made available prior to the charges coming into effect.

## Known limitations

The following limitations exist in the system in its current state. Many of these will change in the future.

- PubSub is only available in the PlayFab SDK for **Unity 2018 or later**.
- While in private preview, there is no SLA for PlayFab PubSub.  We do not recommend shipping a game which uses this feature.
- Only Entity-based events are supported in the current version.  For custom events, that means any event sent via the [WriteEvents](https://api.playfab.com/documentation/events/method/WriteEvents) API. For the full list of supported standard events, see the dropdown in the PubSub Policy UI.
- There is no way to publish an event through PubSub without also sending it through PlayStream. To publish a custom event, call the PlayStream `WriteEvents` API.
- The Publish permissions UI is currently not functional; you can ignore it.  `WriteEvents` has a built-in policy for who can send events which remains the single policy for who can publish events for now.