---
author: jdeweyMSFT
title: "PartyDestroyedReason"
description: "Reasons an object might be destroyed."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyDestroyedReason  

Reasons an object might be destroyed.    

## Syntax  
  
```cpp
enum class PartyDestroyedReason    
{  
    Requested = 0,  
    Disconnected = 1,  
    Kicked = 2,  
    DeviceLostAuthentication = 3,  
    CreationFailed = 4,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Requested | The invitation, endpoint, device, network, or chat control is being destroyed gracefully by request. |  
| Disconnected | The invitation, endpoint, device, network, or chat control is being destroyed because connectivity to the transparent cloud relay server was lost. |  
| Kicked | The device or user that the invitation, endpoint, or chat control depended upon was kicked. |  
| DeviceLostAuthentication | No local users on the local device were authenticated on the network, so the local device lost visibility to the remotely managed invitation, endpoint, device, or chat control.<br/><br/> Even though the local object referring to the remotely managed object has been destroyed, the remotely managed object may still exist in the network. |  
| CreationFailed | The invitation or endpoint creation failed asynchronously, so the local object has been destroyed. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
