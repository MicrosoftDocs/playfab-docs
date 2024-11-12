---
author: jdeweyMSFT
title: "PartyConnectToNetworkCompletedStateChange"
description: "Information specific to the *ConnectToNetworkCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyConnectToNetworkCompletedStateChange  

Information specific to the *ConnectToNetworkCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyConnectToNetworkCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetworkDescriptor networkDescriptor;  
    void* asyncIdentifier;  
    PartyNetwork* network;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the connect to network operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor](partynetworkdescriptor.md)  
  
The network descriptor provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network that was connected to.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::ConnectToNetwork](../classes/PartyManager/methods/partymanager_connecttonetwork.md)
  
  
