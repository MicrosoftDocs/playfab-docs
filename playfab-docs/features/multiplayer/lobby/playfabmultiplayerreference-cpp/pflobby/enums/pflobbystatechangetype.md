---
author: ScottMunroMS
title: "PFLobbyStateChangeType"
description: "The types of state changes that can occur."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyStateChangeType  

The types of state changes that can occur.    

## Syntax  
  
```cpp
enum class PFLobbyStateChangeType  : uint32_t  
{  
    CreateAndJoinLobbyCompleted = 0,  
    JoinLobbyCompleted = 1,  
    MemberAdded = 2,  
    AddMemberCompleted = 3,  
    MemberRemoved = 4,  
    ForceRemoveMemberCompleted = 5,  
    LeaveLobbyCompleted = 6,  
    Updated = 7,  
    PostUpdateCompleted = 8,  
    Disconnecting = 9,  
    Disconnected = 10,  
    JoinArrangedLobbyCompleted = 11,  
    FindLobbiesCompleted = 12,  
    InviteReceived = 13,  
    InviteListenerStatusChanged = 14,  
    SendInviteCompleted = 15,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| CreateAndJoinLobbyCompleted | The operation started by a previous call to [PFMultiplayerCreateAndJoinLobby()](../functions/pfmultiplayercreateandjoinlobby.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyCreateAndJoinLobbyCompletedStateChange](../structs/pflobbycreateandjoinlobbycompletedstatechange.md) object for more information. |  
| JoinLobbyCompleted | The operation started by a previous call to [PFMultiplayerJoinLobby()](../functions/pfmultiplayerjoinlobby.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md) object for more information. |  
| MemberAdded | A PlayFab entity was added to a lobby as a member.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) object for more information. |  
| AddMemberCompleted | The operation started by a previous call to [PFLobbyAddMember()](../functions/pflobbyaddmember.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyAddMemberCompletedStateChange](../structs/pflobbyaddmembercompletedstatechange.md) object for more information. |  
| MemberRemoved | A PlayFab entity was removed from a lobby as a member.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyMemberRemovedStateChange](../structs/pflobbymemberremovedstatechange.md) object for more information. |  
| ForceRemoveMemberCompleted | The operation started by a previous call to [PFLobbyForceRemoveMember()](../functions/pflobbyforceremovemember.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyForceRemoveMemberCompletedStateChange](../structs/pflobbyforceremovemembercompletedstatechange.md) object for more information. |  
| LeaveLobbyCompleted | The operation started by a previous call to [PFLobbyLeave()](../functions/pflobbyleave.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyLeaveLobbyCompletedStateChange](../structs/pflobbyleavelobbycompletedstatechange.md) object for more information. |  
| Updated | A lobby was updated.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) object for more information. |  
| PostUpdateCompleted | The operation started by a previous call to [PFLobbyPostUpdate()](../functions/pflobbypostupdate.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyPostUpdateCompletedStateChange](../structs/pflobbypostupdatecompletedstatechange.md) object for more information. <br /><br /> This operation completing only indicates whether the Lobby service has accepted the update or not. The title's local view of the Lobby state will not reflect this update until a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) is provided to the title with the updated state. |  
| Disconnecting | The client has started disconnecting from a lobby.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyDisconnectingStateChange](../structs/pflobbydisconnectingstatechange.md) object for more information. |  
| Disconnected | The client has disconnected from a lobby.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyDisconnectedStateChange](../structs/pflobbydisconnectedstatechange.md) object for more information. |  
| JoinArrangedLobbyCompleted | The operation started by a previous call to [PFMultiplayerJoinArrangedLobby()](../functions/pfmultiplayerjoinarrangedlobby.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyJoinArrangedLobbyCompletedStateChange](../structs/pflobbyjoinarrangedlobbycompletedstatechange.md) object for more information. |  
| FindLobbiesCompleted | The operation started by a previous call to [PFMultiplayerFindLobbies()](../functions/pfmultiplayerfindlobbies.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyFindLobbiesCompletedStateChange](../structs/pflobbyfindlobbiescompletedstatechange.md) object for more information. |  
| InviteReceived | An entity on this client has received an invite to a lobby.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyInviteReceivedStateChange](../structs/pflobbyinvitereceivedstatechange.md) object for more information. |  
| InviteListenerStatusChanged | An invite listener's status has changed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbyInviteListenerStatusChangedStateChange](../structs/pflobbyinvitelistenerstatuschangedstatechange.md) object for more information. |  
| SendInviteCompleted | The operation started by a previous call to [PFLobbySendInvite()](../functions/pflobbysendinvite.md) completed.<br/><br/> The PFLobbyStateChange object should be cast to a [PFLobbySendInviteCompletedStateChange](../structs/pflobbysendinvitecompletedstatechange.md) object for more information. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
