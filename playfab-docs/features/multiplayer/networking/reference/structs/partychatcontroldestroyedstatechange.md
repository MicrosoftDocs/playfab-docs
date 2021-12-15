---
author: jdeweyMSFT
title: "PartyChatControlDestroyedStateChange"
description: "Information specific to the *ChatControlDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyChatControlDestroyedStateChange  

Information specific to the *ChatControlDestroyed* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyChatControlDestroyedStateChange {  
    PartyChatControl* chatControl;  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
} PartyChatControlDestroyedStateChange  
```
  
### Members  
  
**`chatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control that was destroyed.
  
The memory remains valid until this state change is returned.
  
**`reason`** &nbsp; [PartyDestroyedReason](../enums/partydestroyedreason.md)  
  
The reason the chat control was destroyed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::DestroyChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_destroychatcontrol.md)
  
  
