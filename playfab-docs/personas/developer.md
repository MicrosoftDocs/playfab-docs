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

# Getting Started for Developers

We are excited that you have chosen PlayFab as your platform for backend services and Live Ops.  If you haven&#39;t made your decision yet, that is okay too.  The purpose of this section is to shed some light on how PlayFab helps you, as a developer, build your game on PlayFab.

PlayFab offers a wide range of services and we have over 280 different APIs that you can leverage to make your game.  This can be a lot to take in, so we will take it slow with some beginnings of making your game and then get into more advanced features as we go.

**The Beginning**

The starting point for any PlayFab integration is authentication.  You have to authenticate your player to make further API calls.  PlayFab offers many methods to authenticate and link your players.

Here are some resources that will help you along that first step for authenticating your player.

- [Login Best Practice](https://review.docs.microsoft.com/en-us/gaming/playfab/features/authentication/platform-specific-authentication/login-basics-best-practices) – Check this section first to learn about the best practices to use various authentication methods in your game.
- Authentication Service Helper – Learn how this service can save you valuable time by leveraging building best practices in this Authentication Service for each SDK.
- [Authentication Quickstart](https://review.docs.microsoft.com/en-us/gaming/playfab/features/authentication/platform-specific-authentication/quickstart) – Use this guide to understand the basics of Authentication calls into PlayFab.
- [Linking and Unlinking](https://review.docs.microsoft.com/en-us/gaming/playfab/features/authentication/linking-unlinking/quickstart) - Learn about linking and unlinking different types of Accounts to a single player profile.

**Next Steps**

Every game is fairly different.  You are going to have a unique set of features that you are building.  It is important to know and understand how to map those features onto PlayFab.  This generally starts with configuration of your game.  You will want to store variables in PlayFab and pull them down on to game clients.   These are not the only types of configurations that you&#39;ll want to make.  Below find a number of different ways that PlayFab maps onto a game and find the right combo tool set that is right for your game.

- [Title Data](https://review.docs.microsoft.com/en-us/gaming/playfab/features/config/titledata/) – Map variables containing data on playfab to data structures in your game clients.
- [Entity Objects](https://review.docs.microsoft.com/en-us/gaming/playfab/features/data/entities/) (aka: Player Data) – Store and Retrieve data on a per player basis.
- [Catalogs](https://review.docs.microsoft.com/en-us/gaming/playfab/features/commerce/items/) (Items) - Very useful for storing configuration data about your Items and potentially being able to sell them as virtual goods.
- [Groups](https://review.docs.microsoft.com/en-us/gaming/playfab/features/social/friends-groups/) – Groups are generally used for things like Guilds or Clans.  Groups are arbitrary and have members, roles and other guild like features.

<!-- ![Configuration and Events](https://playfab.com/assets/img/products/liveops-config.png) -->
<img src="images/liveops-config.png" width="600" />

**PlayFab Advanced**

Mapping your game on top of PlayFab is a great start, but there is more power to be harnessed in PlayFab that can help your LiveOps team create better engagement, retention and monetization mechanics.   A majority of these features leverage PlayStream.  PlayStream is an event system that drives real-time events that you can perform actions on player behaviors.   Actions can happen in a number of ways, either via segmentation or via direct rules that are applied to specific events.

Actions might result in a Cloud Script being run.  Our Cloud Script is JavaScript code that lives on a remote server and you can execute from a rule or directly from a game client.  For more information check out these resources to get you started with Cloud Scripting and Automation on PlayFab.

- [Automation](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-automation) – A hub for information on Cloud Script, Scheduled Tasks, PlayStream and Action &amp; Rules.
- [Cloud Script Quickstart](https://review.docs.microsoft.com/en-us/gaming/playfab/features/automation/cloudscript/quickstart) – Get up and running quickly with your first Cloud Script call

ProTip:  To leverage rules in the automation system, [write custom events](https://review.docs.microsoft.com/en-us/gaming/playfab/features/automation/playstream-events/playstream-events#custom-event-overview) in your game which creates a PlayStream event.

**Get to know PlayFab features**
There is much more you can do with PlayFab, check out each of our feature areas to find the right feature set for your game.

- [Authentication](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-authentication)
- [Data](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-data)
- [Config](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-config)
- [Automation](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-automation)
- [Social](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-social)
- [Commerce](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-commerce)
- [Multiplayer](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-multiplayer)
- [Analytics](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-analytics)
- [Engagement](https://review.docs.microsoft.com/en-us/gaming/playfab/feature-engagement)