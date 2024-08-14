---
author: jdeweyMSFT
title: "PartyStateChangeResult"
description: "Results for Party library operations that generate state changes."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyStateChangeResult  

Results for Party library operations that generate state changes.    

## Syntax  
  
```cpp
enum class PartyStateChangeResult    
{  
    Succeeded = 0,  
    UnknownError = 1,  
    CanceledByTitle = 2,  
    InternetConnectivityError = 3,  
    PartyServiceError = 4,  
    NoServersAvailable = 5,  
    UserNotAuthorized = 6,  
    UserCreateNetworkThrottled = 7,  
    TitleNotEnabledForParty = 8,  
    NetworkLimitReached = 10,  
    NetworkNoLongerExists = 11,  
    VersionMismatch = 13,  
    LeaveNetworkCalled = 14,  
    FailedToBindToLocalUdpSocket = 15,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Succeeded | The operation succeeded. |  
| UnknownError | An unknown error occurred. |  
| CanceledByTitle | Another title operation canceled this operation. |  
| InternetConnectivityError | The local device has internet connectivity issues which caused the operation to fail. |  
| PartyServiceError | The operation failed because of an unexpected error in the Party service. |  
| NoServersAvailable | There are no available transparent cloud relay servers in the regions specified by the call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md). |  
| UserNotAuthorized | The PartyLocalUser specified in the call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) or [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md) is not authorized to complete the operation. |  
| UserCreateNetworkThrottled | The PartyLocalUser specified in the call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) has created too many networks and cannot create new networks at this time. |  
| TitleNotEnabledForParty | The title has not been enabled to use PlayFab Party. PlayFab Party must be enabled in the PlayFab Game Manager. |  
| NetworkLimitReached | The network rejected this operation because it would violate a limit in the network's configuration. See [PartyNetworkConfiguration](../structs/partynetworkconfiguration.md). |  
| NetworkNoLongerExists | The network no longer exists. |  
| VersionMismatch | The operation failed because this version of the Party library was incompatible with either the Party service or the Party network. |  
| LeaveNetworkCalled | The network was gracefully exited by the local device. |  
| FailedToBindToLocalUdpSocket | The operation failed because the Party library was unable to bind to the socket specified in the [PartyOption::LocalUdpSocketBindAddress](partyoption.md) option. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
