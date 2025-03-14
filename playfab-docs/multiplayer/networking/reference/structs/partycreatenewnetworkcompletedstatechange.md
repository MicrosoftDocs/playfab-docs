---
author: jdeweyMSFT
title: "PartyCreateNewNetworkCompletedStateChange"
description: "Information specific to the *CreateNewNetworkCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyCreateNewNetworkCompletedStateChange  

Information specific to the *CreateNewNetworkCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyCreateNewNetworkCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalUser* localUser;  
    PartyNetworkConfiguration networkConfiguration;  
    uint32_t regionCount;  
    const PartyRegion* regions;  
    void* asyncIdentifier;  
    PartyNetworkDescriptor networkDescriptor;  
    PartyString appliedInitialInvitationIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the create new network operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user provided to the call associated with this state change.
  
**`networkConfiguration`** &nbsp; [PartyNetworkConfiguration](partynetworkconfiguration.md)  
  
The network configuration provided to the call associated with this state change.
  
**`regionCount`** &nbsp; uint32_t  
  
The number of regions provided to the call associated with this state change.
  
**`regions`** &nbsp; const [PartyRegion](partyregion.md)*  
  
The regions provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor](partynetworkdescriptor.md)  
  
The network descriptor of the network that was created.
  
The regionName and opaqueConnectionInformation fields are only populated if the result field is [PartyStateChangeResult::Succeeded](../enums/partystatechangeresult.md). The networkIdentifier field should always be populated. If the result field is PartyStateChangeResult::Succeeded, this network descriptor is serializable via [PartyManager::SerializeNetworkDescriptor()](../classes/PartyManager/methods/partymanager_serializenetworkdescriptor.md).
  
**`appliedInitialInvitationIdentifier`** &nbsp; [PartyString](../typedefs.md)  
  
The identifier for the network's initial invitation.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::CreateNewNetwork](../classes/PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyManager::SerializeNetworkDescriptor](../classes/PartyManager/methods/partymanager_serializenetworkdescriptor.md)
  
  
