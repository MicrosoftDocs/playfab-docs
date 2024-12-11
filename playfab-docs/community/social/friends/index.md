---
title: Friends 
author: joannaleecy
description: Landing page for Friends 
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, social, friends
ms.localizationpriority: medium
---

# Friends

Letting players connect with their friends is a great engagement tool for your game! PlayFab offers you the ability to integrate with your players' existing social network (like Facebook, Steam, or Xbox Live) or to manage your own custom friends lists within your game.

Any player in your title may be friends with any other player in your title. Notably, friendship on PlayFab is a one-way street.

If **Julie** adds **Bob** as a friend, there is *no* approval process for **Bob**.  In fact, **Bob** may be unaware.

**Bob** must separately add **Julie** for the friendship to be *mutual*.

If you wish to have reciprocity rules, it is your title's responsibility to enforce these conditions with a custom game server or [CloudScript](../../automation/cloudscript/index.md) logic, if necessary.