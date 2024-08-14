---
author: jdeweyMSFT
title: "PartyTranslationReceivedOptions"
description: "Flags describing how a translation was received."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartyTranslationReceivedOptions  

Flags describing how a translation was received.    

## Syntax  
  
```cpp
enum class PartyTranslationReceivedOptions    
{  
    None = 0x0,  
    Truncated = 0x1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | There is no additional translation information. |  
| Truncated | The translation was truncated.<br/><br/> A translation string may be up to ```c_maxChatTextMessageLength``` characters long, not including the null terminator. Truncation occurs if the translated string length would exceed that limit, which can happen due to language differences even though the original string length is less than or equal to ```c_maxChatTextMessageLength```. Truncation may occur at an arbitrary point in the UTF-8 byte sequence and may not result in a complete, valid character or word. Strings are always null terminated, even when truncated. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
