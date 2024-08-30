---
title: Using text moderation
description: Information on how to use PlayFab Party's text moderation feature
author: sardavi
ms.author: kevinasg
ms.date: 2/12/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, text, moderation, filtering
---

# Using text moderation

PlayFab Party offers a text moderation solution that is integrated with text chat. Text chat can be moderated in real-time to filter out offensive language. This feature is backed by AI Content Safety. For more information, see [Azure AI Content Safety](https://azure.microsoft.com/products/ai-services/ai-content-safety/).


## Language support

Text moderation is supported for more than 100 languages. However, you don't need to do anything to configure a language selection for text moderation; Azure automatically detects the language of each text message. For a complete list of supported languages that support autodetection and profanity filtering, refer to Azure AI Content Safety's [list of supported languages](/azure/ai-services/content-safety/language-support).

## Enabling text moderation

Text moderation is configured per chat control. It's enabled by calling `PartyLocalChatControl::SetTextChatOptions()` with the `PartyTextChatOptions::FilterOffensiveText` option. Chat controls that have moderation enabled receive text chat with offensive words masked by asterisks. Since moderation is enabled per chat control, you're able to create UI to allow users to set their own moderation choice. Alternatively, you can enforce moderation for some or all users.

To disable moderation for a chat control, use the same function, passing in a `PartyTextChatOptions` option that doesn't contain the `FilterOffensiveText` flag.

Sample code:
```cpp
// Opt into moderation
myLocalChatControl->SetTextChatOptions(PartyTextChatOptions::FilterOffensiveText, nullptr);

// Opt out of moderation
myLocalChatControl->SetTextChatOptions(PartyTextChatOptions::None, nullptr);
```

## Sending and receiving moderated text

All text sent to a chat control with moderation enabled have moderation applied, regardless of the sender's own moderation settings. Text messages received by a chat control with moderation enabled have the `chatText` field in `PartyChatTextReceivedStateChange` replaced with the moderated version.

More fields are present on the `PartyChatTextReceivedStateChange` to enable more complex scenarios, such as giving users an option to view an unfiltered version of the text. For more information, see the [PartyChatTextReceivedStateChange](reference/structs/partychattextreceivedstatechange.md) reference page. 

If moderating a text message fails, either due to a service error or because the text was deemed offensive by the service without being able to identify specific terms, then the entire text message is masked with asterisks. The `PartyChatTextReceivedOptions` enum provided in the `options` field of `PartyChatTextReceivedStateChange` contains more information when this error case occurs.

## Adjusting filtering levels

For English, the level of filtering that happens for a chat control can be adjusted by using the `PartyManager::SetOption` function. The filtering levels available are Family-Friendly, Medium, and Mature. The default level is Family-Friendly.

Sample code:
```cpp
// Set the filter level to Mature
PartyTextChatFilterLevel filterLevel = PartyTextChatFilterLevel::Mature;
PartyOption option = PartyOption::TextChatFilterLevel;
PartyError error = PartyManager::SetOption(nullptr, option, &filterLevel);
```

## See also

* [Understanding how PlayFab Party chat works](concepts-chat.md)
* [PartyLocalChatControl::SetTextChatOptions](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)
* [PartyChatTextReceivedOptions](reference/enums/partychattextreceivedoptions.md)
