---
author: vicodex
title: ChatState
description: The visual state of the player for rendering in the game's UI.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# ChatMessageState

The visual state of the player for rendering in the game's UI.

## Syntax

```csharp
public enum ChatState
{
    NoAudioInput,
    Muted,
    MutedByPlatform,
    Silent,
    Talking
}
```

## Constants

| **Constant** | **Description** |
| --- | --- |
| **NoAudioInput** | The player has no audio input. This could be because they do not have an audio device plugged in or they are having an error with audio. |
| **Muted** | The player is muted. |
| **MutedByPlatform** | The player is muted due to platform policies. For example, a player may have privacy settings to not allow communication with other players. |
| **Silent** | The player is not talking. |
| **Talking** | The player is talking. |
