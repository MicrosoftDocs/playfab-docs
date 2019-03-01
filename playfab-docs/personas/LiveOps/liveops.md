---
title: Getting started for LiveOps
author: v-kciril
description: Getting started page for LiveOps.
ms.author: v-kciril
ms.date: 01/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, real-time analytics, PlayStream, live operations, player behaviors, event archiving, data export, player data, webhooks, analytic reporting, reports
ms.localizationpriority: medium
---

# Getting started with LiveOps

We believe that a successful LiveOps strategy is the single, most important contributor to a game’s ability to connect with and grow a community. That’s why PlayFab was built from the ground up -  to support great LiveOps for your game.

This document will introduce you to the LiveOps capabilities of PlayFab, and help you discover more resources for LiveOps design and implementation.

Before continuing, make sure you have completed [Getting started for developers](../../personas/developer.md) which ensures you have a PlayFab account and are familiar with the PlayFab Game Manager.

## Exploring LiveOps

LiveOps refers to an approach to game design and development that centers around the game after launch, and specifically player engagement and retention. LiveOps processes emphasis experimentation, real-time data collection and analysis, and iteration.

If you want to learn more about LiveOps in general, and how the LiveOps approach is applied to games at every phase of development, check out [The PlayFab Definitive Guide to LiveOps](liveops-handbook.md)

## Doing LiveOps with PlayFab

PlayFab offer a variety of tools to empower you to run your LiveOps strategy.

- The [PlayFab Game Manager](../../features/config/gamemanager/quickstart.md) is your portal to access the tools and abilities described below. GameManager provides a web-based interface from which LiveOps can be managed and deployed. Most LiveOps functions can be created, managed, and deployed entirely from the GameManager and many can also be updated easily in bulk through JSON file uploads.
- [Player Segments](../../features/data/playerdata/player-segments.md) - PlayFab can automatically sort your players into cohorts, that can then be acted upon through [Cloudscript](../features/automation/cloudscript/quickstart.md), [A/B testing](../../features/analytics/ab-testing/quickstart.md), or [Rules](../../features/automation/actions-rules/quickstart.md). PlayFab comes with several of the most common segments already set up but you can also make your own segments using player login data or Groups defined by in-game behavior.
- [Economy](../../features/commerce/economy/quickstart.md) - Manage your game’s monetization across all platforms through configurable Stores, Currencies, and pricing. Also, in game economy can be managed through PlayFab allowing real-time changes to item Catalogs, availability, pricing, and Drop Tables.
- [Leaderboards](../../features/social/tournaments-leaderboards/quickstart.md) – Create leaderboards to track any aspect of your game and manage reset frequency and aggregation method.
- [Content configuration](../../features/config/titledata/quickstart.md) – PlayFab allows for robust content management in real time through key value pair definitions, in game messaging, and email templates.
- [Automation](../../features/automation/cloudscript/quickstart.md) – Store and run scripts in the cloud with **CloudScript**, enabling everything from triggered events to highly customized data tracking.
- [A/B testing](../../features/analytics/ab-testing/quickstart.md) – Create, run, and report on A/B testing using PlayFab player segments.
- [Rules and scheduled tasks](../../features/automation/actions-rules/quickstart.md) – Set up rules and scheduled tasks based on PlayStream events or CloudScripts.

- **Player Segments** – PlayFab can automatically sort your players into cohorts, that can then be acted upon through **Cloudscript**, A/B testing, or rules. PlayFab comes with several of the most common segments already set up – but you can also make your own segments using player login data, or groups defined by in-game behavior.
- **Economy** – Manage your game’s monetization across all platforms through configurable stores, currencies, and pricing. Also, in-game economy can be managed through PlayFab, allowing real time changes to item catalogs, availability, pricing, and drop tables.
- **Leaderboards** – Create leaderboards to track any aspect of your game, and manage reset frequency and aggregation methods.
- **Content Configuration** – PlayFab allows for robust content management in real time, through key value pair definitions, in-game messaging, and email templates.
- **Automation** – Store and run scripts in the cloud with **CloudScript**, enabling everything from triggered events to highly customized data tracking.
- **A/B Testing** – Create, run, and report on A/B testing using PlayFab player segments.
- **Rules and Scheduled Tasks** – Set up rules and scheduled tasks based on **PlayStream** events or **CloudScripts**.