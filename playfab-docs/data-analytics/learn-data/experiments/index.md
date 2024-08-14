---
title: Experimentation
author: shikha-tarware
description: PlayFab Experimentation Service Overview
ms.author: shtarwar
ms.date: 08/03/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, a/b testing, experiments, experimentation 
ms.localizationpriority: medium
---

# Experiments

## Overview

PlayFab **Experiments** feature helps you identify the best strategies for your game. It does so by helping you run multiple concurrent experiments and ensure statistical trustworthiness.

You can elevate the player experience by comparing different versions of game configurations, pricing models, and outreach mechanisms, determining the best variation for your title’s goals (engagement, monetization, retention, etc.) via experiments.

### Capabilities of PlayFab's Experiments

PlayFab Experiments is a tailored solution for running experiments in your games. It's powered by Microsoft's internal experimentation platform, which unlocks the best-in-class capabilities, which are used by Minecraft, Azure, Office, Bing, and many other Microsoft products.
PlayFab Experiments empower you by providing the following capabilities:
-	Creation and management of multiple concurrent experiments with the (interactive and self-directing) user interface on PlayFab Game Manager and via scalable APIs.
-	Targeting of the desired audience at random but in a controlled manner by making use of existing traffic. You can experiment over a segment and define the percentage of the target audience in each variant.
-	Scheduling of experiments or to run immediately.
-	Analysis of experiments' scorecard results. The scorecards are computed reliably and possess enriched statistical details. This gives you an indication of statistical significance and alerts if a Sample Ratio Mismatch is observed.
-	Integrability with other PlayFab services such as Title Data, Player Profile, PlayStream events, CloudScript and Insights Explorer, etc.

### Experiment Configurations using PlayFab’s Experiments Variants

The experiment compares the game configurations, be it the in-game experience, or the other game growth strategy. These configurations can be enabled through a game code and mapped to the variant-variable pair or variant-override pair. Each configuration is easily mappable to variants of an experiment to enable any game experience. 

A control experience is mapped to a control variant and is compared against one or more treatment experience mapped to a treatment variant to study the player behavior and determine which variant experience or configuration works better. 

#### Game Configurations mapped to Variables (Requiring no new code deployment)
-	Each configuration is easily mappable to variants where each variant is supported by variables. These variables allow you to bundle a different set of game experiences via parameterization.

#### Overrides as Game Configuration (Requiring no game code change)
-	Game configuration using PlayFab services can be experimented using Overrides without adding any extra code.
-	Overrides are subsets of configuration, which contain modifications to the default title data that can be used as variants in Experimentation. Currently, experiments with overrides are only available when using Title Data.
    * Configurations involving Title Data are a set of key-value pairs that are ideal for storing and managing the game’s remote configuration on the server. It keeps the title wide configuration variables accessible and organized, which can be retrieved on the client-side.
    
> [!Note]
> For concurrent experiments using overrides, it is recommended to experiment on a mutually exclusive target audience. This will ensure the correct assignment of overriding configuration and no interaction on the client-side. Thus, resulting in statistically correct experiment design and thereby analysis results. 

### PlayFab Experiments at a Glance

![Screenshot of Experimentation at a Glance](media/tutorials/experiments-at-a-glance.png "Experiments at a Glance")

PlayFab Experiments enable you to run multiple concurrent randomized experiments in a managed and controlled manner. In the process, 

- A unique identifier for each running experiment's variant groups called a variant ID is tagged to each player profile. These variant IDs are assigned to different treatments via client or server-side code. Thus, instrumenting different treatment behavior.
- Each variant group is supported and defined by variables. These variables are attributes on variant groups that allow you to bundle a different set of game experience via parameterization.
-    Reliable computation of results of an experiment with statistical significance calculation is provided.
-    Detection of issues when the targeted audience traffic is way off. This is often caused by a treatment causing crashes or affecting logging. PlayFab's experimentation feature flags such issues enabling you to run a reliable experiment.   

![Screenshot of Onboard to Experiments](media/tutorials/onboarding-experiments-page.PNG "Onboard to Experiments")
