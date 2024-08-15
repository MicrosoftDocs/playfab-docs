---
author: vicodex
title: ChatMessageType
description: The type of a chat message.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# ChatMessageType

The type of a chat message.

## Syntax

```csharp
public enum ChatMessageType
{
    Text,
    SpeechToText,
    TextToSpeech
}
```

## Constants

| **Constant** | **Description** |
| --- | --- |
| **Text** | The standard type of text chat message. |
| **SpeechToText** | A chat message that was transcribed into text, using speech-to-text technology. |
| **TextToSpeech** | An audio chat message that was synthesized, using text-to-speech technology. |
