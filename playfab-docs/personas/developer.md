---
title: Getting started for developers
author: mawillia
description: Understanding how to use PlayFab as a Developer
ms.author: joanlee
ms.date: 11/16/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, authentication, developer persona, game developer, catalogs, entities, groups, automation, liveops, player data, cloudscript, playfab features, mobile login, social login
ms.localizationpriority: medium
---

# Getting started for developers

Thank you for either choosing PlayFab as your platform for back-end services and LiveOps or evaluating the PlayFab offering. Welcome!

The first step in adding PlayFab to any Title is adding code to authenticate and log in the player. Logging in the player returns a security token that is needed for all other API calls.

In this topic we show you how to retrieve the **TitleId** for your Title. You can then follow the quickstart guides listed later on in this topic to learn how to use the **TitleId** to log a player in.

> [!NOTE]
> The quickstart guides use a test **TitleId**. When you follow a guide, use a **TitleId** for a Title that you have created in your PlayFab Developer account.

Before you can make your first API call to log a player in, you must create a [PlayFab Developer account](../gamemanager/pfab-account.md).

## Retrieving your TitleId

When you create a Title in Game Manager, PlayFab generates a **TitleId** that identifies your Title. When following the guides, use a **TitleId** for a Title that you have created.

For information about using Game Manager and creating a Title, see [Game Manager quickstart](../gamemanager/quickstart.md).

To retrieve the **TitleId** for your Title, log in to the [Game Manager](https://developer.playfab.com/en-us/login).

On the **My Studios and Titles** screen, locate your Title. The **TitleId** is located just below the name of your Title.

> [!div class="mx-imgBorder"]
> ![Game Manager - My Studios and Titles - Title ID](images/my-title-id.png)  

### Login and account basics

Now that you have retrieved a Title in Game Manager and retrieved your **TitleId**, you're ready to make API calls.

The starting point for any PlayFab integration is *authentication*. You must authenticate your player to make further API calls.

Here are some resources to help you with the initial authentication of your player:

- [Login basics and Best Practices](../features/authentication/login/login-basics-best-practices.md) – Check this tutorial first to learn about the best practices to use various authentication methods in your Title.
- [Platform-Specific Authentication](../features/authentication/platform-specific-authentication/index.md) – Use these guides to understand the basics of authentication calls into PlayFab.
- [Account Linking tutorial](../features/authentication/login/quickstart.md) - Learn about linking and unlinking different types of accounts to a single player profile.

## Calling the PlayFab API to log in

To allow you to integrate PlayFab into your Title, we provide SDKs, libraries, and extensions for the most popular game engines, frameworks, and platforms.

Select the SDK and appropriate quickstart guide for your preferred environment. The quickstart guide walks through installing the SDK into your environment, creating a new test project, and making your first API call. To get started, see [SDK overview](../sdks/playfab-sdk-intro.md).

## Using PlayFab services to instrument your Title

Mapping your Title on top of PlayFab is a great start. But there is more power to be harnessed in PlayFab that can help your LiveOps team create better engagement, retention, and monetization mechanics.

Many of these features leverage PlayStream, an event system that drives real time events. This enables you to perform actions on player behaviors. Actions can occur in several ways - using either segmentation or direct rules that are applied to specific events.

Actions might result in a CloudScript being run. Our CloudScript is JavaScript code that lives on a remote server, and you can execute it either from a rule, or directly from a client.

For more information, check out these resources to get you started with Cloud Scripting and Automation on PlayFab:

- [Automation](../features/automation/index.yml) – A hub for information on CloudScript, Scheduled Tasks, PlayStream and Action & Rules.
- [CloudScript quickstart](../features/automation/cloudscript/quickstart.md) – Get up and running quickly with your first CloudScript call.

> [!TIP]
> To leverage rules in the automation system, write custom events in your Title which creates a PlayStream event. For more information on custom events, see [Custom event overview](../features/analytics/metrics/playstream-events.md#custom-event-overview) in Generating PlayStream events.

## Next steps

Every Title is different, so you will have a unique set of features that you must build every time. It is important to know and understand how to map those features onto PlayFab.

This generally starts with the configuration of your Title. You will want to store variables in PlayFab and pull them down on to game clients. But these are not the only types of configurations that you'll want to make.

Some of the different ways that you can map PlayFab onto a Title are shown below; use these to find the combination of tools that is just right for your Title:

- [Title Data](../features/data/titledata/quickstart.md) – Map variables containing data on PlayFab to data structures in your game clients.
- [Entity Objects](../features/data/entities/quickstart.md) (aka: Player Data) – Store and retrieve data on a per player basis.
- [Catalogs](../features/commerce/items/catalogs.md) (Items) - Very useful for storing configuration data about your Items and potentially being able to sell them as virtual goods.
- [Groups](../features/social/groups/using-shared-group-data.md) – Groups are generally used for things like guilds or clans. Groups are arbitrary and have members, roles and other guild-like features.

Finally, check out each of our feature areas in the links provided below to find the right feature set for your Title:

- [Authentication](../features/authentication/index.yml)
- [Data](../features/data/index.yml)
- [Automation](../features/automation/index.yml)
- [Social](../features/social/index.yml)
- [Economy](../features/commerce/index.yml)
- [Multiplayer](../features/multiplayer/index.yml)
- [Analytics](../features/analytics/index.yml)
- [Engagement](../features/engagement/index.yml)
