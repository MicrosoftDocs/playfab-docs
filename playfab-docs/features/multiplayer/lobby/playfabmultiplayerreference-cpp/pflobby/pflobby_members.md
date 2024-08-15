---
author: ScottMunroMS
title: "PFMultiplayer C/C++ API overview - PFLobby.h"
description: "PFMultiplayer C/C++ API overview - PFLobby.h"
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFMultiplayer C/C++ API overview - PFLobby.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFLobbyAddMember](functions/pflobbyaddmember.md) | Add a local user as a member to the lobby. |  
| [PFLobbyForceRemoveMember](functions/pflobbyforceremovemember.md) | Forcibly remove an entity from the lobby. |  
| [PFLobbyGetAccessPolicy](functions/pflobbygetaccesspolicy.md) | Gets the access policy of the lobby. |  
| [PFLobbyGetConnectionString](functions/pflobbygetconnectionstring.md) | Gets the default connection string associated with the lobby. |  
| [PFLobbyGetCustomContext](functions/pflobbygetcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this lobby object. |  
| [PFLobbyGetLobbyId](functions/pflobbygetlobbyid.md) | Gets the ID of the Lobby. |  
| [PFLobbyGetLobbyProperty](functions/pflobbygetlobbyproperty.md) | Get the lobby property value from its key. |  
| [PFLobbyGetLobbyPropertyKeys](functions/pflobbygetlobbypropertykeys.md) | Get the list of lobby property keys. |  
| [PFLobbyGetMaxMemberCount](functions/pflobbygetmaxmembercount.md) | Gets the max member count of the lobby. |  
| [PFLobbyGetMemberConnectionStatus](functions/pflobbygetmemberconnectionstatus.md) | Determines a member's connection status to the notification service. |  
| [PFLobbyGetMemberProperty](functions/pflobbygetmemberproperty.md) | Get the member property's value from its key. |  
| [PFLobbyGetMemberPropertyKeys](functions/pflobbygetmemberpropertykeys.md) | Get a list of the specified member's property keys. |  
| [PFLobbyGetMembers](functions/pflobbygetmembers.md) | Gets the list of PlayFab entities currently joined to the lobby as members. |  
| [PFLobbyGetMembershipLock](functions/pflobbygetmembershiplock.md) | Gets the lobby's current membership lock state. |  
| [PFLobbyGetOwner](functions/pflobbygetowner.md) | Gets the current owner of the lobby. |  
| [PFLobbyGetOwnerMigrationPolicy](functions/pflobbygetownermigrationpolicy.md) | Gets the owner migration policy of the lobby. |  
| [PFLobbyGetSearchProperty](functions/pflobbygetsearchproperty.md) | Get the search property value from its key. |  
| [PFLobbyGetSearchPropertyKeys](functions/pflobbygetsearchpropertykeys.md) | Get the list of search property keys. |  
| [PFLobbyGetServer](functions/pflobbygetserver.md) | Gets the server entity joined to the lobby. |  
| [PFLobbyGetServerConnectionStatus](functions/pflobbygetserverconnectionstatus.md) | Retrieves the lobby server's connection status to the notification service. |  
| [PFLobbyGetServerProperty](functions/pflobbygetserverproperty.md) | Get the lobby server property's value from its key. |  
| [PFLobbyGetServerPropertyKeys](functions/pflobbygetserverpropertykeys.md) | Get a list of the lobby server's property keys. |  
| [PFLobbyLeave](functions/pflobbyleave.md) | Request one or all local users to leave the lobby. |  
| [PFLobbyPostUpdate](functions/pflobbypostupdate.md) | Post an update to the lobby as a player. |  
| [PFLobbySendInvite](functions/pflobbysendinvite.md) | Send an invite to this lobby from the local user to the invited entity. |  
| [PFLobbyServerDeleteLobby](functions/pflobbyserverdeletelobby.md) | Delete a lobby on behalf of the game_server entity that owns the lobby. |  
| [PFLobbyServerLeaveAsServer](functions/pflobbyserverleaveasserver.md) | Requests that the server leave the client-owned lobby it's currently in. |  
| [PFLobbyServerPostUpdate](functions/pflobbyserverpostupdate.md) | Post an update to the lobby as the server-owner. |  
| [PFLobbyServerPostUpdateAsServer](functions/pflobbyserverpostupdateasserver.md) | Post an update to a client-owned lobby as a joined server. |  
| [PFLobbySetCustomContext](functions/pflobbysetcustomcontext.md) | Configures an optional, custom pointer-sized context value with this lobby object. |  
| [PFMultiplayerClaimServerLobby](functions/pfmultiplayerclaimserverlobby.md) | Claim ownership of a pre-existing server lobby. |  
| [PFMultiplayerCreateAndClaimServerLobby](functions/pfmultiplayercreateandclaimserverlobby.md) | Create a new lobby as a game_server entity. |  
| [PFMultiplayerCreateAndJoinLobby](functions/pfmultiplayercreateandjoinlobby.md) | Create a new lobby and add the creating PlayFab entity to it. |  
| [PFMultiplayerFindLobbies](functions/pfmultiplayerfindlobbies.md) | Search for lobbies on behalf of the local user. |  
| [PFMultiplayerFinishProcessingLobbyStateChanges](functions/pfmultiplayerfinishprocessinglobbystatechanges.md) | Returns an array of PFLobbyStateChanges that were being processed. |  
| [PFMultiplayerGetLobbyInviteListenerStatus](functions/pfmultiplayergetlobbyinvitelistenerstatus.md) | Retrieve the status of the entity's invite listener. |  
| [PFMultiplayerJoinArrangedLobby](functions/pfmultiplayerjoinarrangedlobby.md) | Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters. |  
| [PFMultiplayerJoinLobby](functions/pfmultiplayerjoinlobby.md) | Join a lobby as the local PlayFab entity. |  
| [PFMultiplayerJoinLobbyAsServer](functions/pfmultiplayerjoinlobbyasserver.md) | Join a client-owned lobby as a server. |  
| [PFMultiplayerStartListeningForLobbyInvites](functions/pfmultiplayerstartlisteningforlobbyinvites.md) | Enables the Lobby invite listener for a given entity. |  
| [PFMultiplayerStartProcessingLobbyStateChanges](functions/pfmultiplayerstartprocessinglobbystatechanges.md) | Retrieves an array of all PFLobbyStateChanges to process since the last such call. |  
| [PFMultiplayerStopListeningForLobbyInvites](functions/pfmultiplayerstoplisteningforlobbyinvites.md) | Disables the Lobby invite listener for a given entity. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFLobbyArrangedJoinConfiguration](structs/pflobbyarrangedjoinconfiguration.md) | The initial configuration data used when joining an arranged lobby. |  
| [PFLobbyCreateConfiguration](structs/pflobbycreateconfiguration.md) | The initial configuration data used when creating a lobby. |  
| [PFLobbyDataUpdate](structs/pflobbydataupdate.md) | A request to make an update to the shared portion of the lobby. |  
| [PFLobbyJoinConfiguration](structs/pflobbyjoinconfiguration.md) | The initial configuration data used when joining a lobby. |  
| [PFLobbyMemberDataUpdate](structs/pflobbymemberdataupdate.md) | A request to make an update to the member-owned portion of the lobby document. |  
| [PFLobbyMemberUpdateSummary](structs/pflobbymemberupdatesummary.md) | A collection of hints about an update which has been successfully applied to the lobby on behalf of a member. |  
| [PFLobbySearchConfiguration](structs/pflobbysearchconfiguration.md) | The configuration structure used to specify how a [PFMultiplayerFindLobbies](functions/pfmultiplayerfindlobbies.md) operation should be performed. |  
| [PFLobbySearchFriendsFilter](structs/pflobbysearchfriendsfilter.md) | The filter structure used to limit lobby search results to only those lobbies owned by the player's friends. |  
| [PFLobbySearchResult](structs/pflobbysearchresult.md) | An entry in the collection of lobby search results received upon successful completion of a [PFMultiplayerFindLobbies](functions/pfmultiplayerfindlobbies.md) operation. |  
| [PFLobbyServerDataUpdate](structs/pflobbyserverdataupdate.md) | A request to make an update to the associated server state of a client-owned lobby. |  
| [PFLobbyServerJoinConfiguration](structs/pflobbyserverjoinconfiguration.md) | The initial configuration data used when joining a client-owned lobby as a server. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
| [PFLobbyAddMemberCompletedStateChange](structs/pflobbyaddmembercompletedstatechange.md) | Information specific to the *AddMemberCompleted* type of state change. |  
| [PFLobbyClaimServerLobbyCompletedStateChange](structs/pflobbyclaimserverlobbycompletedstatechange.md) | Information specific to the *ClaimServerLobbyCompleted* type of state change. |  
| [PFLobbyCreateAndClaimServerLobbyCompletedStateChange](structs/pflobbycreateandclaimserverlobbycompletedstatechange.md) | Information specific to the *CreateAndClaimServerLobbyCompleted* type of state change. |  
| [PFLobbyCreateAndJoinLobbyCompletedStateChange](structs/pflobbycreateandjoinlobbycompletedstatechange.md) | Information specific to the *CreateAndJoinLobbyCompleted* type of state change. |  
| [PFLobbyDisconnectedStateChange](structs/pflobbydisconnectedstatechange.md) | Information specific to the *Disconnected* type of state change. |  
| [PFLobbyDisconnectingStateChange](structs/pflobbydisconnectingstatechange.md) | Information specific to the *Disconnecting* type of state change. |  
| [PFLobbyFindLobbiesCompletedStateChange](structs/pflobbyfindlobbiescompletedstatechange.md) | Information specific to the *FindLobbiesCompleted* type of state change. |  
| [PFLobbyForceRemoveMemberCompletedStateChange](structs/pflobbyforceremovemembercompletedstatechange.md) | Information specific to the *ForceRemoveMemberCompleted* type of state change. |  
| [PFLobbyInviteListenerStatusChangedStateChange](structs/pflobbyinvitelistenerstatuschangedstatechange.md) | Information specific to the *InviteListenerStatusChanged* type of state change. |  
| [PFLobbyInviteReceivedStateChange](structs/pflobbyinvitereceivedstatechange.md) | Information specific to the *InviteReceived* type of state change. |  
| [PFLobbyJoinArrangedLobbyCompletedStateChange](structs/pflobbyjoinarrangedlobbycompletedstatechange.md) | Information specific to the *JoinArrangedLobbyCompleted* type of state change. |  
| [PFLobbyJoinLobbyAsServerCompletedStateChange](structs/pflobbyjoinlobbyasservercompletedstatechange.md) | Information specific to the *JoinLobbyAsServerCompleted* type of state change. |  
| [PFLobbyJoinLobbyCompletedStateChange](structs/pflobbyjoinlobbycompletedstatechange.md) | Information specific to the *JoinLobbyCompleted* type of state change. |  
| [PFLobbyLeaveLobbyCompletedStateChange](structs/pflobbyleavelobbycompletedstatechange.md) | Information specific to the *LeaveLobbyCompleted* type of state change. |  
| [PFLobbyMemberAddedStateChange](structs/pflobbymemberaddedstatechange.md) | Information specific to the *MemberAdded* type of state change. |  
| [PFLobbyMemberRemovedStateChange](structs/pflobbymemberremovedstatechange.md) | Information specific to the *MemberRemoved* type of state change. |  
| [PFLobbyPostUpdateCompletedStateChange](structs/pflobbypostupdatecompletedstatechange.md) | Information specific to the *PostUpdateCompleted* type of state change. |  
| [PFLobbySendInviteCompletedStateChange](structs/pflobbysendinvitecompletedstatechange.md) | Information specific to the *SendInviteCompleted* type of state change. |  
| [PFLobbyServerDeleteLobbyCompletedStateChange](structs/pflobbyserverdeletelobbycompletedstatechange.md) | Information specific to the *ServerDeleteLobbyCompleted* type of state change. |  
| [PFLobbyServerLeaveLobbyAsServerCompletedStateChange](structs/pflobbyserverleavelobbyasservercompletedstatechange.md) | Information specific to the *ServerLeaveLobbyAsServerCompleted* type of state change. |  
| [PFLobbyServerPostUpdateAsServerCompletedStateChange](structs/pflobbyserverpostupdateasservercompletedstatechange.md) | Information specific to the *ServerPostUpdateAsServerCompleted* type of state change. |  
| [PFLobbyServerPostUpdateCompletedStateChange](structs/pflobbyserverpostupdatecompletedstatechange.md) | Information specific to the *ServerPostUpdateCompleted* type of state change. |  
| [PFLobbyStateChange](structs/pflobbystatechange.md) | A generic, base structure representation of an event or change in state in the Lobby library. |  
| [PFLobbyUpdatedStateChange](structs/pflobbyupdatedstatechange.md) | Information specific to the *Updated* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFLobbyAccessPolicy](enums/pflobbyaccesspolicy.md) | Values representing the lobby's access policy.|  
| [PFLobbyDisconnectingReason](enums/pflobbydisconnectingreason.md) | Reasons the client no longer has access to the Lobby.|  
| [PFLobbyInviteListenerStatus](enums/pflobbyinvitelistenerstatus.md) | Values representing the current status of an invite listener.|  
| [PFLobbyMemberConnectionStatus](enums/pflobbymemberconnectionstatus.md) | Values representing the current status of a member's connection status to the notification service.|  
| [PFLobbyMemberRemovedReason](enums/pflobbymemberremovedreason.md) | Reasons why a member was removed from a lobby.|  
| [PFLobbyMembershipLock](enums/pflobbymembershiplock.md) | Values representing the state of the lobby's membership lock.|  
| [PFLobbyOwnerMigrationPolicy](enums/pflobbyownermigrationpolicy.md) | The available policies the lobby service can use to migrate lobby ownership between members.|  
| [PFLobbyServerConnectionStatus](enums/pflobbyserverconnectionstatus.md) | Values representing the current status of the Lobby Server's connection status to the notification service.|  
| [PFLobbyStateChangeType](enums/pflobbystatechangetype.md) | The types of state changes that can occur in the Lobby library.|  
