---
title: Game Saves overview
author: ajskew
description: Landing page for Game Saves
ms.author: askew
ms.date: 06/24/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

## What is Game Saves

> [!WARNING]
> Game Saves is currently in public preview. Features and functionality may change before general availability. Title release before the Game Saves service reaches general availability is not supported.  
>
> To get started, your title must be [onboarded](onboarding.md) for preview.

Game Saves allows players to continue their game, with their progress intact, as they switch across platforms, devices, and stores. Game Saves handles file synchronization and conflict resolution, helps players maintain a single-point-of-progression, and fully supports offline play.

### Benefits

- Connects player progress to your game, not individual devices or platforms.
- Eliminates the complexity of implementing cross-platform synchronization.
- Supports online and offline play with control of transitions between those states.
- Minimizes the chance of version conflicts.
- Provides contextual cues that can assist players in making informed resolution decisions, when needed.
- Helps players seamlessly transition between devices and platforms to maintain a consistent point-of-progression.
- Recovers players from bad state with support for version rollback.
- Provides a platform supported background uploader and title-callable UI on Xbox and Windows platforms.

### Gaming platforms currently supported

- Xbox (One, Series S/X, PC, cloud)
- Windows (store and launcher agnostic including PC Game Pass and Steam on PC)
- Steam Deck 

### Languages and game engines currently supported

- C++
- Unreal Engine

## Current limitations

- **Background uploader authentication**: The background uploader feature is currently limited to Xbox Live authenticated users (XUser). For titles shipping on Steam PC, Xbox sign-in is required to access the Game Saves functionality.