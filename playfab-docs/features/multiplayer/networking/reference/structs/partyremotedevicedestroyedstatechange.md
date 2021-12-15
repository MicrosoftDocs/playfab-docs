---
author: jdeweyMSFT
title: "PartyRemoteDeviceDestroyedStateChange"
description: "Information specific to the *RemoteDeviceDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyRemoteDeviceDestroyedStateChange  

Information specific to the *RemoteDeviceDestroyed* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyRemoteDeviceDestroyedStateChange {  
    PartyDevice* device;  
} PartyRemoteDeviceDestroyedStateChange  
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

  
  
