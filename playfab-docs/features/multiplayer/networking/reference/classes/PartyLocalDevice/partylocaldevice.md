---
author: jdeweyMSFT
title: "PartyLocalDevice"
description: Represents the local device.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyLocalDevice  

Represents the local device.  

## Syntax  
  
```cpp  
class PartyLocalDevice : public PartyDevice  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [CreateChatControl](methods/partylocaldevice_createchatcontrol.md) | Queues an asynchronous operation to create a local chat control for the specified user. |  
| [DestroyChatControl](methods/partylocaldevice_destroychatcontrol.md) | Queues an asynchronous operation to destroy a local chat control. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyDevice](../PartyDevice/partydevice.md)  
[PartyManager::GetLocalDevice](../PartyManager/methods/partymanager_getlocaldevice.md)
  
  
  
