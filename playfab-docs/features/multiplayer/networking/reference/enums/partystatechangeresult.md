---
author: jdeweyMSFT
title: "PartyStateChangeResult"
description: "Results for operations that generate state changes."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyStateChangeResult  

Results for operations that generate state changes.    

## Syntax  
  
```cpp
enum class PartyStateChangeResult    
{  
    Succeeded,  
    UnknownError,  
    CanceledByTitle,  
    InternetConnectivityError,  
    PartyServiceError,  
    NoServersAvailable,  
    UserNotAuthorized,  
    UserCreateNetworkThrottled,  
    TitleNotEnabledForParty,  
    TitleCreateNetworkThrottled,  
    NetworkLimitReached,  
    NetworkNoLongerExists,  
    NetworkNotJoinable,  
    VersionMismatch,  
    LeaveNetworkCalled,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Succeeded | The operation succeeded. |  
| UnknownError | An unknown error occurred. |  
| CanceledByTitle | Another title operation canceled this operation. |  
| InternetConnectivityError | The local device has internet connectivity issues which caused the operation to fail. |  
| PartyServiceError | The operation failed because of an unexpected error in the Party Service. |  
| NoServersAvailable | There are no available transparent cloud relay servers in the regions specified by the call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md). |  
| UserNotAuthorized | The PartyLocalUser specified in the call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) or [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md) is not authorized to complete the operation. |  
| UserCreateNetworkThrottled | The PartyLocalUser specified in the call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) has created too many networks and cannot create new networks at this time. |  
| TitleNotEnabledForParty | The title has not been enabled to use PlayFab Party. PlayFab Party must be enabled in the PlayFab Game Manager. |  
| TitleCreateNetworkThrottled | The title has created too many networks.<br/><br/> The title scale configuration in the PlayFab Party portal has been reached and will not allow additional networks to be created. |  
| NetworkLimitReached | The network rejected this operation because it would violate a limit in the network's configuration. See [PartyNetworkConfiguration](../structs/partynetworkconfiguration.md). |  
| NetworkNoLongerExists | The network no longer exists. |  
| NetworkNotJoinable | The network is not currently allowing new devices or users to join. |  
| VersionMismatch | The operation failed because this version of the Party library was incompatible with either the Party service or the Party network. |  
| LeaveNetworkCalled | The network was gracefully exited by the local device. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
