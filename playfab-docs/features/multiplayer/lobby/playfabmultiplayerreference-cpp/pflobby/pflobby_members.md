---
author: tomcoMSFT
title: "PFLobby"
description: TBD
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobby members  

> [!IMPORTANT]
> This feature is in **private preview** for limited, Microsoft managed partners.

  
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
| [PFLobbyGetMemberProperty](functions/pflobbygetmemberproperty.md) | Get the member property's value from its key. |  
| [PFLobbyGetMemberPropertyKeys](functions/pflobbygetmemberpropertykeys.md) | Get a list of the specified member's property keys. |  
| [PFLobbyGetMembers](functions/pflobbygetmembers.md) | Gets the list of PlayFab entities currently joined to the lobby as members. |  
| [PFLobbyGetMembershipLock](functions/pflobbygetmembershiplock.md) | Gets the lobby's current membership lock state. |  
| [PFLobbyGetOwner](functions/pflobbygetowner.md) | Gets the current owner of the lobby. |  
| [PFLobbyGetOwnerMigrationPolicy](functions/pflobbygetownermigrationpolicy.md) | Gets the owner migration policy of the lobby. |  
| [PFLobbyGetSearchProperty](functions/pflobbygetsearchproperty.md) | Get the search property value from its key. |  
| [PFLobbyGetSearchPropertyKeys](functions/pflobbygetsearchpropertykeys.md) | Get the list of search property keys. |  
| [PFLobbyLeave](functions/pflobbyleave.md) | Request one or all local users to leave the lobby. |  
| [PFLobbyPostUpdate](functions/pflobbypostupdate.md) | Post an update to the lobby. |  
| [PFLobbySendInvite](functions/pflobbysendinvite.md) | Send an invite to this lobby from the local user to the invited entity. |  
| [PFLobbySetCustomContext](functions/pflobbysetcustomcontext.md) | Configures an optional, custom pointer-sized context value with this lobby object. |  
| [PFMultiplayerCreateAndJoinLobby](functions/pfmultiplayercreateandjoinlobby.md) | Create a new lobby and add the creating PlayFab entity to it. |  
| [PFMultiplayerFindLobbies](functions/pfmultiplayerfindlobbies.md) | Search for lobbies on behalf of the local user. |  
| [PFMultiplayerFinishProcessingLobbyStateChanges](functions/pfmultiplayerfinishprocessinglobbystatechanges.md) | Returns an array of PFLobbyStateChanges that were being processed. |  
| [PFMultiplayerGetLobbyInviteListenerStatus](functions/pfmultiplayergetlobbyinvitelistenerstatus.md) | Retrieve the status of the entity's invite listener. |  
| [PFMultiplayerJoinArrangedLobby](functions/pfmultiplayerjoinarrangedlobby.md) | Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters. |  
| [PFMultiplayerJoinLobby](functions/pfmultiplayerjoinlobby.md) | Join a lobby as the local PlayFab entity. |  
| [PFMultiplayerStartListeningForLobbyInvites](functions/pfmultiplayerstartlisteningforlobbyinvites.md) | Enables the Lobby invite listener for a given entity. |  
| [PFMultiplayerStartProcessingLobbyStateChanges](functions/pfmultiplayerstartprocessinglobbystatechanges.md) | Retrieves an array of all PFLobbyStateChanges to process since the last such call. |  
| [PFMultiplayerStopListeningForLobbyInvites](functions/pfmultiplayerstoplisteningforlobbyinvites.md) | Disables the Lobby invite listener for a given entity. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFLobbyAddMemberCompletedStateChange](structs/pflobbyaddmembercompletedstatechange.md) | Information specific to the *AddMemberCompleted* type of state change. |  
| [PFLobbyArrangedJoinConfiguration](structs/pflobbyarrangedjoinconfiguration.md) | The initial configuration data used when joining an arranged lobby. |  
| [PFLobbyCreateAndJoinLobbyCompletedStateChange](structs/pflobbycreateandjoinlobbycompletedstatechange.md) | Information specific to the *CreateAndJoinLobbyCompleted* type of state change. |  
| [PFLobbyCreateConfiguration](structs/pflobbycreateconfiguration.md) | The initial configuration data used when creating a lobby. |  
| [PFLobbyDataUpdate](structs/pflobbydataupdate.md) | A request to make an update to the shared portion of the lobby on behalf of a member. |  
| [PFLobbyDisconnectedStateChange](structs/pflobbydisconnectedstatechange.md) | Information specific to the *Disconnected* type of state change. |  
| [PFLobbyDisconnectingStateChange](structs/pflobbydisconnectingstatechange.md) | Information specific to the *Disconnecting* type of state change. |  
| [PFLobbyFindLobbiesCompletedStateChange](structs/pflobbyfindlobbiescompletedstatechange.md) | Information specific to the *FindLobbiesCompleted* type of state change. |  
| [PFLobbyForceRemoveMemberCompletedStateChange](structs/pflobbyforceremovemembercompletedstatechange.md) | Information specific to the *ForceRemoveMemberCompleted* type of state change. |  
| [PFLobbyInviteListenerStatusChangedStateChange](structs/pflobbyinvitelistenerstatuschangedstatechange.md) | Information specific to the *InviteListenerStatusChanged* type of state change. |  
| [PFLobbyInviteReceivedStateChange](structs/pflobbyinvitereceivedstatechange.md) | Information specific to the *InviteReceived* type of state change. |  
| [PFLobbyJoinArrangedLobbyCompletedStateChange](structs/pflobbyjoinarrangedlobbycompletedstatechange.md) | Information specific to the *JoinArrangedLobbyCompleted* type of state change. |  
| [PFLobbyJoinConfiguration](structs/pflobbyjoinconfiguration.md) | The initial configuration data used when joining a lobby. |  
| [PFLobbyJoinLobbyCompletedStateChange](structs/pflobbyjoinlobbycompletedstatechange.md) | Information specific to the *JoinLobbyCompleted* type of state change. |  
| [PFLobbyLeaveLobbyCompletedStateChange](structs/pflobbyleavelobbycompletedstatechange.md) | Information specific to the *LeaveLobbyCompleted* type of state change. |  
| [PFLobbyMemberAddedStateChange](structs/pflobbymemberaddedstatechange.md) | Information specific to the *MemberAdded* type of state change. |  
| [PFLobbyMemberDataUpdate](structs/pflobbymemberdataupdate.md) | A request to make an update to the member-owned portion of the lobby document. |  
| [PFLobbyMemberRemovedStateChange](structs/pflobbymemberremovedstatechange.md) | Information specific to the *MemberRemoved* type of state change. |  
| [PFLobbyMemberUpdateSummary](structs/pflobbymemberupdatesummary.md) | A collection of hints about an update which has been successfully applied to the lobby on behalf of a member. |  
| [PFLobbyPostUpdateCompletedStateChange](structs/pflobbypostupdatecompletedstatechange.md) | Information specific to the *PostUpdateCompleted* type of state change. |  
| [PFLobbySearchConfiguration](structs/pflobbysearchconfiguration.md) | The configuration structure used to specify how a [PFMultiplayerFindLobbies](functions/pfmultiplayerfindlobbies.md) operation should be performed. |  
| [PFLobbySearchFriendsFilter](structs/pflobbysearchfriendsfilter.md) | The filter structure used to limit lobby search results to only those lobbies owned by the player's friends. |  
| [PFLobbySearchResult](structs/pflobbysearchresult.md) | An entry in the collection of lobby search results received upon successful completion of a [PFMultiplayerFindLobbies](functions/pfmultiplayerfindlobbies.md) operation. |  
| [PFLobbySendInviteCompletedStateChange](structs/pflobbysendinvitecompletedstatechange.md) | Information specific to the *SendInviteCompleted* type of state change. |  
| [PFLobbyStateChange](structs/pflobbystatechange.md) | A generic, base structure representation of an event or change in state. |  
| [PFLobbyUpdatedStateChange](structs/pflobbyupdatedstatechange.md) | Information specific to the *Updated* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFLobbyAccessPolicy](enums/pflobbyaccesspolicy.md) | Values representing the lobby's access policy.|  
| [PFLobbyDisconnectingReason](enums/pflobbydisconnectingreason.md) | Reasons the client no longer has access to the Lobby.|  
| [PFLobbyInviteListenerStatus](enums/pflobbyinvitelistenerstatus.md) | Values representing the current status of an invite listener.|  
| [PFLobbyMemberRemovedReason](enums/pflobbymemberremovedreason.md) | Reasons why a member was removed from a lobby.|  
| [PFLobbyMembershipLock](enums/pflobbymembershiplock.md) | Values representing the state of the lobby's membership lock.|  
| [PFLobbyOwnerMigrationPolicy](enums/pflobbyownermigrationpolicy.md) | The available policies the lobby service can use to migrate lobby ownership between members.|  
| [PFLobbyStateChangeType](enums/pflobbystatechangetype.md) | The types of state changes that can occur.|  
