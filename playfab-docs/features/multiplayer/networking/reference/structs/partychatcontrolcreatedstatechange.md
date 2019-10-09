---
author: jdeweyMSFT
title: "PartyChatControlCreatedStateChange"
description: "Information specific to the *ChatControlCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyChatControlCreatedStateChange  

Information specific to the *ChatControlCreated* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyChatControlCreatedStateChange {  
    PartyChatControl* chatControl;  
} PartyChatControlCreatedStateChange  
```
  
### Members  
  
**`chatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control that was created.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::CreateChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)
  
  
