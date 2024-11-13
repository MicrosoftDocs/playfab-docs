---
author: ScottMunroMS
title: "PFLobbyGetMemberConnectionStatus"
description: "Determines a member's connection status to the notification service."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/09/2023
---

# PFLobbyGetMemberConnectionStatus  

Determines a member's connection status to the notification service.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetMemberConnectionStatus(  
    PFLobbyHandle lobby,  
    const PFEntityKey* member,  
    PFLobbyMemberConnectionStatus* connectionStatus  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`member`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The member whose connection status will be inspected.  
  
**`connectionStatus`** &nbsp; [PFLobbyMemberConnectionStatus*](../enums/pflobbymemberconnectionstatus.md)  
*output*  
  
The output connection status of the member.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
When joining a lobby, the library establishes a WebSocket connection to the PlayFab PubSub notification service. This connection is used to provide real-time updates to the library about the lobby. This method can be used to determine a member's connection status, which is useful for diagnosing a member's ability to receive updates about the lobby. <br /><br /> A local member which is still in the process of asynchronously joining the lobby, via a call to any of [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md), [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), or [PFLobbyAddMember](pflobbyaddmember.md), will see their connection status as [PFLobbyMemberConnectionStatus::NotConnected](../enums/pflobbymemberconnectionstatus.md) until the connection is established.   <br /><br /> When a user's connection status changes, a [PFLobbyMemberUpdateSummary](../structs/pflobbymemberupdatesummary.md) will be provided to the title with the ```PFLobbyMemberUpdateSummary::member``` field set to the user's entity key and the ```PFLobbyMemberUpdateSummary::connectionStatusUpdated``` field set to true. The ```PFLobbyMemberUpdateSummary``` will be provided to the title as a ```memberUpdates``` entry on a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) struct via [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md).   <br /><br /> When a user's connection status changes from [PFLobbyMemberConnectionStatus::Connected](../enums/pflobbymemberconnectionstatus.md) to [PFLobbyMemberConnectionStatus::NotConnected](../enums/pflobbymemberconnectionstatus.md), they may be experiencing connectivity issues - or their game may have crashed. The lobby owner can remove such users from the lobby via [PFLobbyForceRemoveMember()](pflobbyforceremovemember.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
