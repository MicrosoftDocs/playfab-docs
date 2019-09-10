---
title: Getting started for developers
author: mawillia
description: Understanding how to use PlayFab as a Developer
ms.author: mawillia
ms.date: 11/16/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, authentication, developer persona, game developer, catalogs, entities, groups, automation, liveops, player data, cloudscript, playfab features, mobile login, social login
ms.localizationpriority: medium
---

# Getting started for developers

Thank you for either choosing PlayFab as your platform for back-end services and LiveOps, or evaluating the PlayFab offering.  Welcome!

The purpose of this section is to shed some light on how PlayFab helps you - as a developer - to build your game using PlayFab.

PlayFab offers you a wide range of services, and has over 280 different APIs that you can leverage to make your game. This can be a lot to absorb in one session, so we'll take it slow.

Let's start with the first steps of making your game - and then move into the more advanced features as we go.

> [!NOTE]
> Before you can make your first API call, you need to create a [PlayFab Developer account](pfab-account.md). 

## Making your first API call with PlayFab

We have SDKs for all major game engines and languages.

Choose an environment from the links provided below, and follow it to the appropriate quickstart guide. These quickstarts walk you through installing your environment, creating a new test project, and making your first API call.

Pick your SDK:

- [Unity](../sdks/unity3d/quickstart.md)
- [Unreal](../sdks/unreal/quickstart.md)
- [HTML5 (Javascript)](../sdks/javascript/quickstart.md)
- [Flash (ActionScript3)](../sdks/actionscript/quickstart.md)
- [C#](../sdks/c-sharp/quickstart.md)
- [Cocos2d-x](../sdks/cocos2d-x/quickstart.md)
- [Xamarin](../sdks/xamarin/quickstart.md)
- [Node](../sdks/nodejs/quickstart.md)
- [Java](../sdks/java/quickstart.md)
- [Defold (Lua)](../sdks/lua/quickstart-defold.md)
- [Corona (Lua)](../sdks/lua/quickstart-corona.md)  
- [Windows - C++](../sdks/playfab-cpp/quickstart-windows.md)
- [Linux - C++](../sdks/playfab-cpp/quickstart-linux.md)  
- [Xbox - C++](../sdks/playfab-cpp/quickstart-xbox.md)

## Updating your login mechanism

The first step in adding PlayFab to any game is *always* logging in the player. Logging in the player returns a security token that is needed for all other API calls.

The quickstart guides utilize a test **TitleId** - but from *now on*, you should be using your *own*.

Create a **Title** in Game Manager, and update your environment with your own **TitleId**.

### Obtaining your TitleId

A **TitleId** is obtained from the Game Manager. If you haven't already, [register for a free PlayFab developer account](https://developer.playfab.com/en-us/sign-up), then [log into the Game Manager](https://developer.playfab.com/en-us/login).

Once you have logged in, select **Settings**. The **TitleId** for your game should already be present in the field below the **Name** column.

![Game Manager - Settings - Secret Keys - Title ID](images/game-manager-settings-secret-keys.png)  

The SDK guide that you followed in the first step should have included instructions on how to enter your **Title ID**.

## Login and account basics

Now that you're set up to make API calls, the starting point for any PlayFab integration is *authentication*.

You have to authenticate your player to make further API calls. PlayFab offers a number of methods to authenticate and link your players.

Here are some resources that will help you with the initial authentication of your player:

- [Login basics and Best Practices](../features/authentication/login/login-basics-best-practices.md) – Check this tutorial first to learn about the best practices to use various authentication methods in your game.
- **Authentication Service Helper** – Learn how this service can save you valuable time by leveraging building best practices in this authentication service for each SDK.
- [Authentication quickstart](../features/authentication/platform-specific-authentication/index.md) – Use this guide to understand the basics of authentication calls into PlayFab.
- [Account Linking tutorial](../features/authentication/login/quickstart.md) - Learn about linking and unlinking different types of accounts to a single player profile.

## Next steps

Every game is fairly different, so you will have a unique set of features that you must build every time. It is important to know and understand how to map those features onto PlayFab.

This generally starts with the configuration of your game. You will want to store variables in PlayFab, and pull them down on to game clients. But these are not the only types of configurations that you'll want to make.

Some of the number of different ways that PlayFab maps onto a game are shown below, giving you the opportunity to find the combo tool set that is just right for your game:

- [Title Data](../features/config/titledata/quickstart.md) – Map variables containing data on PlayFab to data structures in your game clients.
- [Entity Objects](../features/data/entities/quickstart.md) (aka: Player Data) – Store and retrieve data on a per player basis.
- [Catalogs](../features/commerce/items/catalogs.md) (Items) - Very useful for storing configuration data about your Items and potentially being able to sell them as virtual goods.
- [Groups](../features/social/groups/using-shared-group-data.md) – Groups are generally used for things like guilds or clans. Groups are arbitrary and have members, roles and other guild-like features.

![Configuration and Events](images/liveops-config.png)

## PlayFab advanced

Mapping your game on top of PlayFab is a great start. But there is more power to be harnessed in PlayFab that can help your LiveOps team create better engagement, retention and monetization mechanics.

A majority of these features leverage PlayStream, an event system that drives real time events. This enables you to perform actions on player behaviors. Actions can occur in a number of ways - either via segmentation, or direct rules that are applied to specific events.

Actions might result in a CloudScript being run. Our CloudScript is JavaScript code that lives on a remote server, and you can execute it either from a rule, or directly from a game client.

For more information, check out these resources to get you started with Cloud Scripting and Automation on PlayFab:

- [Automation](../index.md?#pivot=documentation&panel=automation) – A hub for information on CloudScript, Scheduled Tasks, PlayStream and Action & Rules.
- [CloudScript quickstart](../features/automation/cloudscript/quickstart.md) – Get up and running quickly with your first CloudScript call.

> [!TIP]
> To leverage rules in the automation system, [write custom events](../features/analytics/metrics/playstream-events.md#custom-event-overview) in your game which will create a PlayStream event.

## Get to know PlayFab features

There is much more you can do with PlayFab. Check out each of our feature areas in the links provided below to find the right feature set for your game:

- [Authentication](../index.md?#pivot=documentation&panel=authentication)
- [Data](../index.md?#pivot=documentation&panel=data)
- [Config](../index.md?#pivot=documentation&panel=config)
- [Automation](../index.md?#pivot=documentation&panel=automation)
- [Social](../index.md?#pivot=documentation&panel=social)
- [Commerce](../index.md?#pivot=documentation&panel=commerce)
- [Multiplayer](../index.md?#pivot=documentation&panel=multiplayer)
- [Analytics](../index.md?#pivot=documentation&panel=analytics)
- [Engagement](../index.md?#pivot=documentation&panel=engagement)
