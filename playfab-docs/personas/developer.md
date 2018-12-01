---
title: Getting Started for Developers
author: mawillia
description: Understanding how to use PlayFab as a Developer
ms.author: mawillia
ms.date: 11/16/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, authentication, developer persona, game developer, catalogs, entities, groups, automation, liveops, player data, cloud script, playfab features, mobile login, social login
ms.localizationpriority: medium
---

# Getting started for developers

We are excited that you have either chosen PlayFab as your platform for back-end services and Live Ops, or are evaluating the PlayFab offering. The purpose of this section is to shed some light on how PlayFab helps you, as a developer, build your game on PlayFab.

PlayFab offers a wide range of services and has over 280 different APIs that you can leverage to make your game. This can be a lot to take in, so we'll take it slow, starting with the beginnings of making your game and then getting into more advanced features as we go.

## The beginning

The starting point for any PlayFab integration is authentication. You have to authenticate your player to make further API calls. PlayFab offers many methods to authenticate and link your players.

Here are some resources that will help you along that first step for authenticating your player:

- [Login basics and Best Practices](../features/authentication/platform-specific-authentication/login-basics-best-practices.md) – Check this tutorial first to learn about the best practices to use various authentication methods in your game.
- Authentication Service Helper – Learn how this service can save you valuable time by leveraging building best practices in this Authentication Service for each SDK.
- [Authentication Quickstart](../features/authentication/platform-specific-authentication/quickstart.md) – Use this guide to understand the basics of Authentication calls into PlayFab.
- [Account Linking Quickstart](../features/authentication/linking-unlinking/account-linking-quickstart.md) - Learn about linking and unlinking different types of Accounts to a single player profile.

## Next steps

Every game is fairly different. You will have a unique set of features that you are building, and it is important to know and understand how to map those features onto PlayFab. This generally starts with configuration of your game. You will want to store variables in PlayFab and pull them down on to game clients. These are not the only types of configurations that you'll want to make.

Below, you can find a number of different ways that PlayFab maps onto a game and find the right combo tool set that is right for your game:

- [Title Data](../features/config/titledata/title-data-quickstart.md) – Map variables containing data on PlayFab to data structures in your game clients.
- [Entity Objects](../features/data/entities/entities-quickstart.md) (aka: Player Data) – Store and Retrieve data on a per player basis.
- [Catalogs](../features/commerce/items/catalogs.md) (Items) - Very useful for storing configuration data about your Items and potentially being able to sell them as virtual goods.
- [Groups](../features/social/friends-groups/using-shared-group-data.md) – Groups are generally used for things like Guilds or Clans.  Groups are arbitrary and have members, roles and other guild like features.

<!-- ![Configuration and Events](https://playfab.com/assets/img/products/liveops-config.png) -->
<img src="images/liveops-config.png" width="600" />

## PlayFab advanced

Mapping your game on top of PlayFab is a great start, but there is more power to be harnessed in PlayFab that can help your LiveOps team create better engagement, retention and monetization mechanics. A majority of these features leverage PlayStream. PlayStream is an event system that drives real-time events that enables you to perform actions on player behaviors. Actions can happen in a number of ways, either via segmentation or via direct rules that are applied to specific events.

Actions might result in a CloudScript being run. Our CloudScript is JavaScript code that lives on a remote server and you can execute it either from a rule or directly from a game client. For more information, check out these resources to get you started with Cloud Scripting and Automation on PlayFab:

- [Automation](../index.md?#pivot=documentation&panel=automation) – A hub for information on CloudScript, Scheduled Tasks, PlayStream and Action & Rules.
- [CloudScript Quickstart](../features/automation/cloudscript/cloudscript-quickstart.md) – Get up and running quickly with your first CloudScript call.

> [!TIP]
> To leverage rules in the automation system, [write custom events](../features/automation/playstream-events/playstream-quickstart.md#custom-event-overview) in your game which will create a PlayStream event.

## Get to know PlayFab features

There is much more you can do with PlayFab. Check out each of our feature areas to find the right feature set for your game:

- [Authentication](../index.md?#pivot=documentation&panel=authentication)
- [Data](../index.md?#pivot=documentation&panel=data)
- [Config](../index.md?#pivot=documentation&panel=config)
- [Automation](../index.md?#pivot=documentation&panel=automation)
- [Social](../index.md?#pivot=documentation&panel=social)
- [Commerce](../index.md?#pivot=documentation&panel=commerce)
- [Multiplayer](../index.md?#pivot=documentation&panel=multiplayer)
- [Analytics](../index.md?#pivot=documentation&panel=analytics)
- [Engagement](../index.md?#pivot=documentation&panel=engagement)
