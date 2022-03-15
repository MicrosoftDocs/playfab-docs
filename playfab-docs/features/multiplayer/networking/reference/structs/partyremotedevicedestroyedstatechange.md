---
author: jdeweyMSFT
title: "PartyRemoteDeviceDestroyedStateChange"
description: "Information specific to the *RemoteDeviceDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 03/11/2022
---

# PartyRemoteDeviceDestroyedStateChange  

Information specific to the *RemoteDeviceDestroyed* type of state change.  

## Syntax  
  
```cpp
struct PartyRemoteDeviceDestroyedStateChange {  
    PartyDevice* device;  
}  
```
  
### Members  
  
**`device`** &nbsp; [PartyDevice](../classes/PartyDevice/partydevice.md)*  
  
The device that was destroyed.
  
## Remarks  
  
This state change is generated when device has left all networks.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
