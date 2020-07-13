---
author: vicodex
title: The type of delivery guarantee for a message.
description: 
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 06/22/2020
---

# ChatMessageType

The type of delivery guarantee for a message.

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
| **SpeechToText** | A chat message that was synthesized to text, using speech to text technology. |
| **TextToSpeech** | An audio chat message that was synthesized, using text to speech technology. |
