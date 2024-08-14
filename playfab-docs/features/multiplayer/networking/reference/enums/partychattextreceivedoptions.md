---
author: jdeweyMSFT
title: "PartyChatTextReceivedOptions"
description: "Flags describing the received text message in PartyChatTextReceivedStateChange."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyChatTextReceivedOptions  

Flags describing the received text message in PartyChatTextReceivedStateChange.    

## Syntax  
  
```cpp
enum class PartyChatTextReceivedOptions    
{  
    None = 0x0,  
    FilteredOffensiveTerms = 0x1,  
    FilteredEntireMessage = 0x2,  
    FilteredDueToError = 0x4,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No flags are specified. |  
| FilteredOffensiveTerms | Offensive terms were found and replaced with asterisks.<br/><br/> This value is exclusive to FilteredEntireMessage and FilteredDueToError. |  
| FilteredEntireMessage | The incoming text chat was unable to filter specific terms, and the entire text has been replaced by asterisks.<br/><br/> This option occurs when the moderation service was not able to identify specific terms to filter, but has still identified the text as being offensive. <br /><br /> This value is exclusive to FilteredOffensiveTerms and FilteredDueToError. |  
| FilteredDueToError | The incoming text was unable to be filtered, and the entire text has been replaced by asterisks.<br/><br/> This value is exclusive to FilteredOffensiveTerms and FilteredEntireMessage. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyChatTextReceivedStateChange](../structs/partychattextreceivedstatechange.md)
  
  
