---
title: Getting started with Azure PlayFab Party
author: joannaleecy
description: Learn how to get started with Azure PlayFab Party.
ms.author: joanlee
ms.date: 10/13/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, party, getting started
ms.localizationpriority: medium
---

# Getting started with Azure PlayFab Party

This topic describes how to set up the development environment for Azure PlayFab Party and start using it.

## Prerequisites

You need a PlayFab account, and you *must enable* the Party feature to start using Party. 

1. Create/sign in to your [PlayFab account](https://playfab.com). For instructions, see [Quickstart: Game Manager](../../../gamemanager/quickstart.md).
1. [Enable Party feature via Game Manager](enable-party.md) from your PlayFab account.

## Download and set up Party SDK

Like the PlayFab SDKs, we have Party SDKs for different platforms and game engines. Select and download the one that you need. For download links, see [Party SDKs](party-sdks.md).

After installing the SDK, you might want to run a sample to see how Party works before you start writing code. For more information, see the [Run a sample](#run-a-sample) section.

If you're using Party in Xbox and PC titles, we recommend that you use the [Party Xbox Live Helper Library](party-xbox-live-guide.md) to ensure consistent functionality and behavior. This library helps your title meet Xbox Live requirements. To learn more, see [Xbox requirements](xbox-requirements.md).

## Start using Party

Now that you've finished the setup, you're ready to make your first API call and use more Party features.

To start making Party API calls, you also need the PlayFab Entity Token. Get it via REST calls ([GetEntityToken](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken)) or by using the PlayFab SDK. For instructions about how to install the PlayFab SDK, see the [Install PlayFab SDK](#install-the-playfab-sdk) section. If you're using Xbox Live, you can also get this token from the [Party Xbox Live Helper Library](party-xbox-live-guide.md).

Here are some quickstart guides to help you make your first API call.
* [Quickstart for Android](android-specific-requirements.md)
* [Quickstart for iOS](ios-specific-requirements.md)
* [Quickstart for Unity](party-unity-plugin-quickstart.md)
* [Quickstart for Unreal](party-unreal-engine-oss-quickstart.md)

For a high-level, general overview of all the core features in Party, see [Party SDK quickstart](quickstart.md).

## Useful resources

### Run a sample

Running a sample is a helpful way to learn how Party works. To download a sample, go to [Party samples](party-samples.md). If you have questions or need help, go to [PlayFab forums](https://community.playfab.com/index.html).

### Install the PlayFab SDK

You can use the PlayFab SDK to get the PlayFab Entity Token. The PlayFab SDK is needed when you want to use other PlayFab functionalities such as commerce and leaderboards.

1. Install the version of the PlayFab SDK that you need&mdash;select by [languages](https://docs.microsoft.com/gaming/playfab/sdks/languages/), [game engines](https://docs.microsoft.com/gaming/playfab/sdks/game-engines/), or [frameworks](https://docs.microsoft.com/gaming/playfab/sdks/frameworks/).
1. Associate your game's PlayFab title ID with the PlayFab SDK. If you need to find out what title IDs are or where to find them, see [Your studios and titles](../../../gamemanager/quickstart.md#your-studios-and-titles).

## Key concepts

To help you design and harness the full power of Party, following are some concepts that cover different key areas.

- [Party objects and their relationships](concepts-objects.md)

    Know what the key objects are and how they relate to each another. This information provides you with a basic understanding of the overall data communication architecture.

- [Party chat basics](concepts-chat.md)

    Understand how chat works. Learn which key objects need to be created and defined to implement chat.

- [Party invitations and the security model](concepts-invitations-security-model.md)

    Learn how to limit access to a network as a way to protect the integrity of your own network. Understand how you can effectively use invites as part of your security design.

- [Party interacts with your discovery flows](concepts-discovery.md)

    Party can be used with other PlayFab multiplayer features. These features enable players to find other players so that they can play together. Learn how matchmaking, lobby, and other features can help in this discovery process.

* [Party API reference documentation](reference/party_members.md)

    Get more details about parameters, return values, and behaviors when invoking the C/C++ libraries.

* Party UX guidelines for [Text-to-speech](party-text-to-speech-ux-guidelines.md) and [Speech-to-text](party-speech-to-text-ux-guidelines.md)

    Understand the best practices for designing user experiences. Be informed about our recommendations around chat and data communication user interfaces.

## See also

* [Party overview](index.md)
* [Party features](party-features.md)
* [Party SDKs](party-sdks.md)
* [Party samples](party-samples.md)
* [Multiplayer servers](../servers/index.md)
* [Multiplayer](../mpintro.md)
* [Matchmaking](../matchmaking/index.md)