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

Thank you for either choosing PlayFab as your platform for back-end services and LiveOps or evaluating the PlayFab offering. Welcome!

The first step in adding PlayFab to any Title is adding code to login the player. Logging in the player returns a security token that is needed for all other API calls.

To allow you to integrate PlayFab into your Title, we provide SDKs, libraries, and extensions for the most popular game engines, frameworks, and platforms.

Scripting:

- ActionScript
- JavaScript
- NodeJS
- PHP
- Python

Frameworks:

- Cocos2D-x
- Phaser.io (Javascript)

Game Engines:

- Corona (Lua)
- Defold (Lua)
- Unity3D (c#)
- Unreal Engine

Languages:

- C#
- C# (Xamarin)
- CPP (Linux)
- CPP (Windows)
- CPP (Xbox One)
- Java
- Java (Android Studio Project)
- Objective-C

In this topic we show you how to retrieve the **TitleId** for your Title. You can then follow the quickstart guides listed later on this topic to learn how to use the **TitleId** to log a player in.

Before you can make your first API call to log a player in, you must create a [PlayFab Developer account](pfab-account.md).

> [!NOTE] 
> The quickstart guides use a test **TitleId**. When you follow a guide, use a **TitleId** for Title that you have created in your PlayFab Developer account.

## Player login

Your Title is identified by its **TitleId**. When following the guides, use a **TitleId** for a Titled that you have created.

### Retrieving your TitleId

When you create a Title in Game Manager PlayFab generates a **TitleId**.

To retrieve the **TitleId** for your Title, log in to the [Game Manager](https://developer.playfab.com/en-us/login).

On the **My Studios and Titles** screen, locate your Title. The **TitleId** is located just below the name of your Title.

> [!div class="mx-imgBorder"]
> ![Game Manager - My Studios and Titles - Title ID](images/my-titlles-titleid.png)  

## Login and account basics

Now that you have created a Title in Game Manager and retrieved your **TitleId**, you're ready to make API calls.

The starting point for any PlayFab integration is *authentication*. You must authenticate your player to make further API calls. PlayFab offers a number of methods to authenticate and link your players.

Here are some resources to help you with the initial authentication of your player:

- [Login basics and Best Practices](../features/authentication/login/login-basics-best-practices.md) – Check this tutorial first to learn about the best practices to use various authentication methods in your Title.
- **Authentication Service Helper** – Learn how this service can save you valuable time by leveraging building best practices in this authentication service for each SDK.
- [Authentication quickstart](../features/authentication/platform-specific-authentication/index.md) – Use this guide to understand the basics of authentication calls into PlayFab.
- [Account Linking tutorial](../features/authentication/login/quickstart.md) - Learn about linking and unlinking different types of accounts to a single player profile.

## Calling the PlayFab API to log in

We have SDKs for all major game engines and languages.

Choose an environment from the links provided below and follow it to the appropriate quickstart guide. These quickstarts walk you through installing your environment, creating a new test project, and making your first API call.

Pick your SDK:

- [Unity](../sdks/unity3d/quickstart.md)
- [Unreal](../sdks/unreal/quickstart.md)
- [HTML5 (Javascript)](../sdks/javascript/quickstart.md)
- [Flash (ActionScript3)](../sdks/actionscript/quickstart.md)
- [C#](../sdks/c-sharp/quickstart.md)
- [Cocos2d-x](../sdks/cocos2d-x/quickstart.md)
- [Xamarin](../sdks/xamarin/quickstart.md)
- [Node](../sdks/nodejs/quickstart.md)
- [Java (Native and Android Studio)](../sdks/java/quickstart.md)
- [Defold (Lua)](../sdks/lua/quickstart-defold.md)
- [Corona (Lua)](../sdks/lua/quickstart-corona.md)  
- [Windows - C++](../sdks/playfab-cpp/quickstart-windows.md)
- [Linux - C++](../sdks/playfab-cpp/quickstart-linux.md)  
- [Xbox - C++](../sdks/playfab-cpp/quickstart-xbox.md)

## Next steps

Every Title is different, so you will have a unique set of features that you must build every time. It is important to know and understand how to map those features onto PlayFab.

This generally starts with the configuration of your Title. You will want to store variables in PlayFab and pull them down on to game clients. But these are not the only types of configurations that you'll want to make.

Some of the different ways that you can map PlayFab onto a Title are shown below; use these to find the combination of tools that is just right for your Title:

- [Title Data](../features/config/titledata/quickstart.md) – Map variables containing data on PlayFab to data structures in your game clients.
- [Entity Objects](../features/data/entities/quickstart.md) (aka: Player Data) – Store and retrieve data on a per player basis.
- [Catalogs](../features/commerce/items/catalogs.md) (Items) - Very useful for storing configuration data about your Items and potentially being able to sell them as virtual goods.
- [Groups](../features/social/groups/using-shared-group-data.md) – Groups are generally used for things like guilds or clans. Groups are arbitrary and have members, roles and other guild-like features.

![Configuration and Events](images/liveops-config.png)

## PlayFab advanced

Mapping your Title on top of PlayFab is a great start. But there is more power to be harnessed in PlayFab that can help your LiveOps team create better engagement, retention, and monetization mechanics.

A majority of these features leverage PlayStream, an event system that drives real time events. This enables you to perform actions on player behaviors. Actions can occur in a number of ways - using either segmentation or direct rules that are applied to specific events.

Actions might result in a CloudScript being run. Our CloudScript is JavaScript code that lives on a remote server, and you can execute it either from a rule, or directly from a client.

For more information, check out these resources to get you started with Cloud Scripting and Automation on PlayFab:

- [Automation](../index?#pivot=documentation&panel=automation) – A hub for information on CloudScript, Scheduled Tasks, PlayStream and Action & Rules.
- [CloudScript quickstart](../features/automation/cloudscript/quickstart.md) – Get up and running quickly with your first CloudScript call.

> [!TIP]
> To leverage rules in the automation system, [write custom events](../features/analytics/metrics/playstream-events.md#custom-event-overview) in your Title which creates a PlayStream event.

## Get to know PlayFab features

There is much more you can do with PlayFab. Check out each of our feature areas in the links provided below to find the right feature set for your Title:

- [Authentication](../index?#pivot=documentation&panel=authentication)
- [Data](../index?#pivot=documentation&panel=data)
- [Config](../index?#pivot=documentation&panel=config)
- [Automation](../index?#pivot=documentation&panel=automation)
- [Social](../index?#pivot=documentation&panel=social)
- [Commerce](../index?#pivot=documentation&panel=commerce)
- [Multiplayer](../index?#pivot=documentation&panel=multiplayer)
- [Analytics](../index?#pivot=documentation&panel=analytics)
- [Engagement](../index?#pivot=documentation&panel=engagement)
