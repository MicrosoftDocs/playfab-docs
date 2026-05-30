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

## What is Game Saves

By using Game Saves, players can continue their game with their progress intact when they switch across platforms, devices, and stores. Game Saves handles file synchronization and conflict resolution. It helps players maintain a single point of progression and fully supports offline play.

### Benefits

- Connects player progress to your game instead of individual devices or platforms.
- Eliminates the complexity of implementing cross-platform synchronization.
- Supports online and offline play with control of transitions between those states.
- Minimizes the chance of version conflicts.
- Helps players seamlessly transition between devices and platforms to maintain a consistent point of progression.
- Provides contextual cues to assist players in making informed conflict resolution and single point of progression decisions, when needed.
- Recovers players from bad state with support for version rollback.
- Emits [PlayStream events](playstream-events.md) for tracking save activity, conflicts, and rollbacks across your player base.
- Works with background uploader and title-callable UI, where available.

### Gaming platforms currently supported

- Xbox (One, Series S/X, PC, cloud)
- Steam (PC, Steam Deck)
- Windows (other stores and launchers)
- PlayStation 5

### Languages and game engines currently supported

- C++
- Unreal Engine

## Sample implementation

An end-to-end reference implementation for Windows demonstrating initialization, cloud sync (download/upload), conflict handling, active device management, and UI callbacks is available on GitHub:

[Game Saves sample – PlayFabGameSaveSample-Windows](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/PlayFabGameSaveSample-Windows)

Use this sample to:
- See the ordering of initialization, add user, and upload operations in context.
- Review minimal error handling patterns and UI callback wiring.
- Experiment quickly before integrating the APIs into your production project.

## Implementation requirements

### Authentication requirements

- **Identity linking**: To ensure game saves seamlessly transition between platforms, titles must use a shared or linked user identity. PlayFab supports account linking between two authenticated providers.

### Platform-specific considerations

- **Non-Xbox/Windows platforms**: On platforms other than Windows and Xbox (such as Steam Deck), the game must provide the UI. Game Saves triggers UI callbacks that the game can respond to.

- **Upload handling on non-Xbox/Windows platforms**: On platforms other than Windows and Xbox (such as Steam Deck), Game Saves upload happens in the same process as the game. This condition means the game must warn the user not to exit before upload finishes, or the game save doesn't reach the cloud.

### Multi-platform deployment

- **Cross-storefront compatibility**: Games that plan to ship on multiple storefronts should consider how title updates that don't occur in lockstep affect shared cloud game save data.

- **Robust save implementation**: While not required, for maximum reliability, games should implement a double-buffering approach that alternates between two local on-disk save files to ensure there's always a known good fallback if a write operation fails. This best practice is independent of cloud saves and helps prevent save corruption during abnormal game termination.
