---
author: jdeweyMSFT
title: "PartyRemoteDeviceCreatedStateChange"
description: "Information specific to the *RemoteDeviceCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyRemoteDeviceCreatedStateChange  

Information specific to the *RemoteDeviceCreated* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyRemoteDeviceCreatedStateChange {  
    PartyDevice* device;  
} PartyRemoteDeviceCreatedStateChange  
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

  
  
