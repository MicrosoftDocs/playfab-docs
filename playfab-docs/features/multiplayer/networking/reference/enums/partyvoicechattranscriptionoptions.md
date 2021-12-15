---
author: jdeweyMSFT
title: "PartyVoiceChatTranscriptionOptions"
description: "Voice chat transcription options."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/27/2019
---

# PartyVoiceChatTranscriptionOptions  

Voice chat transcription options.    

## Syntax  
  
```cpp
enum class PartyVoiceChatTranscriptionOptions    
{  
    None = 0x0,  
    TranscribeSelf = 0x1,  
    TranscribeOtherChatControlsWithMatchingLanguages = 0x2,  
    TranscribeOtherChatControlsWithNonMatchingLanguages = 0x4,  
    DisableHypothesisPhrases = 0x8,  
    TranslateToLocalLanguage = 0x10,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No chat controls will be transcribed. |  
| TranscribeSelf | Transcriptions of the local chat control will be generated and provided to the same local chat control via [PartyVoiceChatTranscriptionReceivedStateChange](../structs/partyvoicechattranscriptionreceivedstatechange.md) events. |  
| TranscribeOtherChatControlsWithMatchingLanguages | Transcriptions of other chat controls with the same language as the local chat control will be generated and provided to the local chat control via [PartyVoiceChatTranscriptionReceivedStateChange](../structs/partyvoicechattranscriptionreceivedstatechange.md) events. |  
| TranscribeOtherChatControlsWithNonMatchingLanguages | Transcriptions of other chat controls with languages that are different from the local chat control's language will be generated and provided to the local chat control via [PartyVoiceChatTranscriptionReceivedStateChange](../structs/partyvoicechattranscriptionreceivedstatechange.md) events.<br/><br/> The transcriptions are not translated by default. Translation to the local chat control's language can also be enabled by adding *TranslateToLocalLanguage*. |  
| DisableHypothesisPhrases | Hypothesis phrases will be disabled.<br/><br/> Use of hypothesis phrases is encouraged as a best practice to minimize the perceived latency of the transcription. If the phrases will not be used, however, they can be disabled in order to reduce the network bandwidth used to send the phrases to the local chat control. <br /><br /> This option will have no effect unless also combined with *TranscribeSelf*, *TranscribeOtherChatControlsWithMatchingLanguages*, and/or *TranscribeOtherChatControlsWithNonMatchingLanguages*. |  
| TranslateToLocalLanguage | Transcriptions will be translated to the local chat control's language.<br/><br/> Transcriptions generated as specified via other PartyVoiceChatTranscriptionOptions values will be translated into the local chat control's language, which is specified by [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md). The translations will be provided in addition to the original transcription via [PartyVoiceChatTranscriptionReceivedStateChange](../structs/partyvoicechattranscriptionreceivedstatechange.md) events. <br /><br /> If translation is enabled, a translation corresponding to the local chat control's language will always be provided in each resulting PartyVoiceChatTranscriptionReceivedStateChange. If the speaking chat control's language is the same as the local chat control's language, the transcription and translation strings will be identical.   <br /><br /> This option will have no effect unless also combined with one or more of *TranscribeSelf*, *TranscribeOtherChatControlsWithMatchingLanguages*, and *TranscribeOtherChatControlsWithNonMatchingLanguages*. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetTranscriptionOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md)  
[PartyVoiceChatTranscriptionReceivedStateChange](../structs/partyvoicechattranscriptionreceivedstatechange.md)  
[PartyVoiceChatTranscriptionPhraseType](partyvoicechattranscriptionphrasetype.md)
  
  
