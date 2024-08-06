---
author: jdeweyMSFT
title: "PartyChatTextReceivedStateChange"
description: "Information specific to the *ChatTextReceived* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/22/2024
---

# PartyChatTextReceivedStateChange  

Information specific to the *ChatTextReceived* type of state change.  

## Syntax  
  
```cpp
struct PartyChatTextReceivedStateChange : PartyStateChange {  
    PartyChatControl* senderChatControl;  
    uint32_t receiverChatControlCount;  
    PartyLocalChatControlArray receiverChatControls;  
    PartyString languageCode;  
    PartyString chatText;  
    uint32_t dataSize;  
    const void* data;  
    uint32_t translationCount;  
    PartyTranslation* translations;  
    PartyChatTextReceivedOptions options;  
    PartyString originalChatText;  
    PartyError errorDetail;  
}  
```
  
### Members  
  
**`senderChatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control object that originated the text message.
  
**`receiverChatControlCount`** &nbsp; uint32_t  
  
The number of local receiver chat controls to which the text message is addressed.
  
**`receiverChatControls`** &nbsp; [PartyLocalChatControlArray](../typedefs.md)  
*array of size `receiverChatControlCount`*  
  
The local receiver chat controls to which the text message is addressed.
  
**`languageCode`** &nbsp; [PartyString](../typedefs.md)  
  
The language of the chat text.
  
The language is only provided when translation to the local language is enabled. If translation isn't enabled, or failure is encountered during translation, the language code is an empty string. <br /><br /> The language code is in BCP 47 format, such as en-US for English (United States). Supported language codes are enumerated in [Language support](/azure/ai-services/speech-service/language-support).
  
**`chatText`** &nbsp; [PartyString](../typedefs.md)  
  
The received chat text.
  
The string may be up to ```c_maxChatTextMessageLength``` characters long, not including the null terminator. <br /><br /> When filtering is enabled, this text may not be the exact text sent by the remote user. The exact source text can be retrieved from the ```originalChatText``` field.
  
**`dataSize`** &nbsp; uint32_t  
  
The size of the data associated with this text message.
  
**`data`** &nbsp; const void*  
*buffer of size `dataSize` bytes*  
  
The data associated with this text message.
  
**`translationCount`** &nbsp; uint32_t  
  
The number of translations associated with the chat text.
  
Translations are provided if [PartyTextChatOptions::TranslateToLocalLanguage](../enums/partytextchatoptions.md) has previously been specified via [PartyLocalChatControl::SetTextChatOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md) on a chat control local to this device. There may be more than one translation if multiple local chat controls have enabled translation and the local chat controls have specified different languages via [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md). In that case, the app can compare the ```languageCode``` field of each PartyTranslation in ```translations``` against the language code, obtained via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md), for each local chat control in ```receiverChatControls``` to determine the target local chat control for each translation.
  
**`translations`** &nbsp; [PartyTranslation](partytranslation.md)*  
*array of size `translationCount`*  
  
An array containing the translations of the chat text string.
  
Translations are provided if [PartyTextChatOptions::TranslateToLocalLanguage](../enums/partytextchatoptions.md) has previously been specified via [PartyLocalChatControl::SetTextChatOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md) on a chat control local to this device. There may be more than one translation if multiple local chat controls have enabled translation and the local chat controls have specified different languages via [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md). In that case, the app can compare the ```languageCode``` field of each PartyTranslation in ```translations``` against the language code, obtained via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md), for each local chat control in ```receiverChatControls``` to determine the target local chat control for each translation.
  
**`options`** &nbsp; [PartyChatTextReceivedOptions](../enums/partychattextreceivedoptions.md)  
  
Flags describing additional information about the chat text.
  
**`originalChatText`** &nbsp; [PartyString](../typedefs.md)  
  
The original version of the incoming text chat.
  
This field is always the unfiltered source text sent by the remote user. If filtering isn't enabled, it's a pointer to ```chatText```. If filtering is enabled but filtering was not needed, as indicated by PartyChatTextReceivedOptions::None in the ```options``` field, then this is a pointer to ```chatText```.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
This error is intended for diagnostic purposes only. If an error occurs, the [PartyChatTextReceivedOptions::FilteredDueToError](../enums/partychattextreceivedoptions.md) flag will be present in the ```options``` field.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::CreateChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyLocalChatControl::SendText](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_sendtext.md)  
[PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)
  
  
