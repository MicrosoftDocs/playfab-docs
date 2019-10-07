---
author: jdeweyMSFT
title: "PartyChatTextReceivedStateChange"
description: "Information specific to the *ChatTextReceived* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyChatTextReceivedStateChange  

Information specific to the *ChatTextReceived* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyChatTextReceivedStateChange {  
    PartyChatControl* senderChatControl;  
    uint32_t receiverChatControlCount;  
    PartyLocalChatControlArray receiverChatControls;  
    PartyString languageCode;  
    PartyString chatText;  
    uint32_t dataSize;  
    const void* data;  
    uint32_t translationCount;  
    PartyTranslation* translations;  
} PartyChatTextReceivedStateChange  
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
  
The language will only be provided when translation to the local language is enabled. If translation isn't enabled, or failure is encountered during translation, the language code will be an empty string. <br /><br /> The language code will be in BCP 47 format, such as en-US for English (United States). Supported language codes are enumerated at [https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support](https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support).
  
**`chatText`** &nbsp; [PartyString](../typedefs.md)  
  
The received chat text.
  
The string may be up to ```c_maxChatTextMessageLength``` characters long, not including the null terminator.
  
**`dataSize`** &nbsp; uint32_t  
  
The size of the data associated with this text message.
  
**`data`** &nbsp; const void*  
*buffer of size `dataSize` bytes*  
  
The data associated with this text message.
  
**`translationCount`** &nbsp; uint32_t  
  
The number of translations associated with the chat text.
  
Translations will be provided if [PartyTextChatOptions::TranslateToLocalLanguage](../enums/partytextchatoptions.md) had previously been specified via [PartyLocalChatControl::SetTextChatOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md) on a chat control local to this device. There may be more than one translation if multiple local chat controls have enabled translation and the local chat controls have specified different languages via either [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) or [PartyLocalChatControl::SetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setlanguage.md). In that case, the app can compare the ```languageCode``` field of each PartyTranslation in ```translations``` against the language code, obtained via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md), for each local chat control in ```receiverChatControls``` to determine the target local chat control for each translation.
  
**`translations`** &nbsp; [PartyTranslation](partytranslation.md)*  
*array of size `translationCount`*  
  
An array containing the translations of the chat text string.
  
Translations will be provided if [PartyTextChatOptions::TranslateToLocalLanguage](../enums/partytextchatoptions.md) had previously been specified via [PartyLocalChatControl::SetTextChatOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md) on a chat control local to this device. There may be more than one translation if multiple local chat controls have enabled translation and the local chat controls have specified different languages via either [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) or [PartyLocalChatControl::SetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setlanguage.md). In that case, the app can compare the ```languageCode``` field of each PartyTranslation in ```translations``` against the language code, obtained via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md), for each local chat control in ```receiverChatControls``` to determine the target local chat control for each translation.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::CreateChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyLocalChatControl::SendText](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_sendtext.md)  
[PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md)  
[PartyLocalChatControl::SetLanguage](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setlanguage.md)
  
  
