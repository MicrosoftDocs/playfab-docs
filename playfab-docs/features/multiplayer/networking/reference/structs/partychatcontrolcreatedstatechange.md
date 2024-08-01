---
author: jdeweyMSFT
title: "PartyChatControlCreatedStateChange"
description: "Information specific to the *ChatControlCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyChatControlCreatedStateChange  

Information specific to the *ChatControlCreated* type of state change.  

## Syntax  
  
```cpp
struct PartyChatControlCreatedStateChange : PartyStateChange {  
    PartyChatControl* chatControl;  
}  
```
  
### Members  
  
**`chatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control that was created.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::CreateChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)
  
  
