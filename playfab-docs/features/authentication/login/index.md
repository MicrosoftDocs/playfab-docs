---
title: Player Login
author: v-thopra
description: Landing page for Player login topics.
ms.author: v-thopra
ms.date: 02/19/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, authentication, accounts, login, linking
ms.localizationpriority: medium
---

# Player Login

The first step in adding PlayFab to any game is to log in the player. Logging in the player returns a security token that is needed for all other API calls.

PlayFab provides a breadth of login providers to enable both anonymous and recoverable login mechanisms.

## Anonymous login mechanisms  

Anonymous login mechanisms are the simplest to use. They require zero input from the player so that there's no friction to the first time user experience, and they create a unique account in PlayFab for each player.

This is the most common login mechanism to use initially (especially for mobile games). Being anonymous, these methods can uniquely identify a device, but contain no recoverable information about this player. If the player loses or breaks their device, the account is lost, and may be very difficult to recover.

## Recoverable login mechanisms

Recoverable login mechanisms require some identity information from the player. They require the player to either authenticate with an external provider (e.g., Facebook, iOS, Google, Kongregate, PlayStation, Steam, Xbox Live, and others), or manage the login directly with PlayFab by using either a user name or email address and password.

## Best practices
  
Get started by reading the [login best practices guide](login-basics-best-practices.md), and make sure that your game enables your players to join in and start playing quickly and easily, while providing them with a safe and secure method of getting access to their game data on multiple devices.