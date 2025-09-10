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

# Game Saves overview

> [!WARNING]
> Game Saves is currently in public preview. Features and functionality might change before general availability. Title release before the Game Saves service reaches general availability isn't supported.  
>
> To get started, your title must be [onboarded](onboarding.md) for preview.

## What is Game Saves

Game Saves allows players to continue their game, with their progress intact, as they switch across platforms, devices, and stores. Game Saves handles file synchronization and conflict resolution, helps players maintain a single-point-of-progression, and fully supports offline play.

### Benefits

- Connects player progress to your game instead of individual devices or platforms.
- Eliminates the complexity of implementing cross-platform synchronization.
- Supports online and offline play with control of transitions between those states.
- Minimizes the chance of version conflicts.
- Helps players seamlessly transition between devices and platforms to maintain a consistent point-of-progression.
- Provides contextual cues to assist players in making informed conflict resolution and single point of progression decisions, when needed.
- Recovers players from bad state with support for version rollback.
- Works with Xbox-provided background uploader and title-callable UI, where available.

### Gaming platforms currently supported

- Xbox (One, Series S/X, PC, cloud)
- Steam (PC, Steam Deck)
- Windows (other stores / launchers)

### Languages and game engines currently supported

- C++
- Unreal Engine

## Implementation requirements

### Authentication requirements

- **Background uploader authentication**: The background uploader feature is currently limited to Xbox authenticated users (XUser). For titles shipping on Steam PC, Xbox sign-in is required to access the Game Saves functionality.

- **Identity linking**: Titles must use a shared or linked user identity for game saves to seamlessly transition between platforms. PlayFab supports account linking between two authenticated providers, but note that on Xbox and Windows only Xbox sign-in is currently supported.

### Platform-specific considerations

- **Non-Xbox/Windows platforms**: On platforms other than Windows and Xbox (such as Steam Deck), the UI must be provided by the game. Game Saves will trigger UI callbacks that the game can respond to.

- **Upload handling on non-Xbox/Windows platforms**: On platforms other than Windows and Xbox (such as Steam Deck), Game Saves upload will happen in the same process as the game. This means the game must warn the user not to exit before upload finishes, or the game save will not reach the cloud.

### Multi-platform deployment

- **Cross-storefront compatibility**: Games that plan to ship on multiple storefronts should consider how title updates out of lockstep will affect shared cloud game save data.

- **Robust save implementation**: While not required, for maximum reliability, games should implement a double-buffering approach alternating between two local on disk save files to ensure there's always a known good fallback if a write operation fails. This best practice is independent of cloud saves and helps prevent save corruption during abnormal game termination.
