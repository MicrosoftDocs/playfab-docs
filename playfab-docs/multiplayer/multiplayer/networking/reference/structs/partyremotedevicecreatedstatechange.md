---
author: jdeweyMSFT
title: "PartyRemoteDeviceCreatedStateChange"
description: "Information specific to the *RemoteDeviceCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyRemoteDeviceCreatedStateChange  

Information specific to the *RemoteDeviceCreated* type of state change.  

## Syntax  
  
```cpp
struct PartyRemoteDeviceCreatedStateChange : PartyStateChange {  
    PartyDevice* device;  
}  
```
  
### Members  
  
**`device`** &nbsp; [PartyDevice](../classes/PartyDevice/partydevice.md)*  
  
The device that was created.
  
## Remarks  
  
This state change indicates that the device was just created.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
