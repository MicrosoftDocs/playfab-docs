---
title: Xbox Requirements
author: ScottMunroMS
description: Supplemental guidance for using PlayFab Party on the Xbox platform and on Xbox Live multiplayer ecosystem
ms.author: scmunro
ms.date: 04/24/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, xbox, live, xr, requirements, certification
ms.localizationpriority: medium
---

# Xbox Requirements

If your game is targeting Xbox consoles, it must adhere to a set of requirements to ensure consistent functionality and behavior when interacting with Xbox Live. This set of requirements is listed in the [Xbox Requirements](https://aka.ms/xrs) (XRs for short). XRs interact and overlap with [the policies](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview) that are required to make use of Xbox Live in your game on PC and other platforms. Here we describe best practices for PlayFab Party that will help you comply with these requirements.

For quick reference, refer to the following table which matches PlayFab Party scenarios to the XRs they address:

| Scenario | XR |
|----------|----|
| [Aligning PlayFab Party with an Xbox Live user's chat settings and privileges](#aligning-playfab-party-with-an-xbox-live-users-chat-settings-and-privileges) | [XR-015](https://developer.microsoft.com/games/xbox/docs/gdk/xr015), [XR-045](https://developer.microsoft.com/games/xbox/docs/gdk/xr045) |
| [Maintaining a multiplayer session document](#maintaining-a-multiplayer-session-document) | [XR-067](https://developer.microsoft.com/games/xbox/docs/gdk/xr067) |
| [Identifying players in a cross-network game session](#identifying-players-in-a-cross-network-game-session) | [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007) |
| [Respecting cross-network communication permissions for Xbox Live users](#respecting-cross-network-communication-permissions-for-xbox-live-users) | [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007) |
| [Use PlayFab Party invitations to restrict access to networks when cross-play is not allowed](#use-playfab-party-invitations-to-restrict-access-to-networks-when-cross-play-is-not-allowed) | [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007) |
| [Keeping in sync with Xbox Live profile settings](#keeping-in-sync-with-xbox-live-profile-settings) | [XR-048](https://developer.microsoft.com/games/xbox/docs/gdk/xr048) |
| [Supporting platform multiplayer join flows](#supporting-platform-multiplayer-join-flows) | [XR-064](https://developer.microsoft.com/games/xbox/docs/gdk/xr064), [XR-124](https://developer.microsoft.com/games/xbox/docs/gdk/console-certification-requirements-and-tests) |
| [Friends lists](#friends-lists) | [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007), [XR-070](https://developer.microsoft.com/games/xbox/docs/gdk/console-certification-requirements-and-tests) |
| [Honoring Xbox Live service retry policy and service access limitations](#honoring-xbox-live-service-retry-policy-and-service-access-limitations) | [XR-074](https://developer.microsoft.com/games/xbox/docs/gdk/xr074), [XR-132](https://developer.microsoft.com/games/xbox/docs/gdk/xr132) |

## PlayFab Party Xbox Live Helper library

Alongside the core PlayFab Party library, we offer an [Xbox Live Helper library](party-xbox-live-guide.md) which is designed to help comply with Xbox Live policies and, by extension, XRs. Use of this helper library is not required but is highly recommended and considered best practice. The examples presented here will assume use of the Xbox Live Helper library.

## Aligning PlayFab Party with an Xbox Live user's chat settings and privileges

PlayFab Party uses an opt-in model of chat communication and, by default, restricts all communications between two [chat controls](concepts-objects.md#chat-control) to the set of communications which both participants have enabled. For more information, see the documentation for [chat permissions and muting](concepts-chat-permissions-and-muting.md).

PlayFab Party's [Xbox Live Helper library](party-xbox-live-guide.md) indicates which set of chat permissions should be enabled to match the preferences and privileges of the Xbox Live users currently communicating in the Party session. For more information, see the documentation about [respecting an Xbox Live user's privacy settings and permissions](party-xbox-live-guide.md#respecting-an-xbox-live-users-privacy-settings-and-permissions).

By properly making use of PlayFab Party and the [Xbox Live Helper library](party-xbox-live-guide.md), your game can entirely meet the requirements specified by [XR-015](https://developer.microsoft.com/games/xbox/docs/gdk/xr015) and can meet the relevant communication requirements specified by [XR-045](https://developer.microsoft.com/games/xbox/docs/gdk/xr045). Refer to the [XR-045](https://developer.microsoft.com/games/xbox/docs/gdk/xr045) technical documentation for further requirements outside the scope of PlayFab Party.

## Maintaining a multiplayer session document

PlayFab Party does not provide any sort of Xbox user roster. It relies on your game using the Multiplayer Session Directory service (MPSD) to maintain a roster and associate Party network activity with the users in the game session. PlayFab Party will advertise remote [endpoints](concepts-objects.md#endpoint) and [chat controls](concepts-objects.md#chat-control) as they come and go from Party [networks](concepts-objects.md#network). The PlayFab Entity IDs associated with these objects should be matched with the Xbox users in the MPSD document to recognize which PlayFab Party objects represent Xbox users in the game session. For cross-play scenarios, a PlayFab Entity not associated with an Xbox user may represent a user in another multiplayer ecosystem.

To recognize Xbox users, you should build mappings between PlayFab Entity IDs and Xbox Live users. To achieve this, it is recommended that you store the session's list of Xbox Live users in an MPSD document and translate those Xbox Live users to PlayFab Entity IDs using the Xbox Live Helper library. For examples, see [Mapping between Xbox Live User IDs and PlayFab Entity IDs](party-xbox-live-guide.md#mapping-between-xbox-live-user-ids-and-playfab-entity-ids).

In addition to providing the Party network's roster, MPSD documents also drive many multiplayer experiences in the Xbox multiplayer ecosystem such as matchmaking, platform invites, recent player lists, and join-in-progress. For more information on how to incorporate Party networks into these MPSD flows, see [Using PlayFab Party with MPSD](using-mpsd.md).

For more information, see [MPSD overview](/gaming/gdk/_content/gc/live/features/multiplayer/mpsd/live-mpsd-overview).

> [!IMPORTANT]
> This section provides best practices when using PlayFab Party together with MPSD, but PlayFab Party itself does not implicitly satisfy the MPSD requirements of [XR-067](https://developer.microsoft.com/games/xbox/docs/gdk/xr067). Refer to the [XR-067](https://developer.microsoft.com/games/xbox/docs/gdk/xr067) technical documentation for information on satisfying these requirements.

## Using Xbox clients in cross-play Party networks

For cross-play scenarios, please keep in mind the following best practices when interacting with the Xbox Live ecosystem.

> [!IMPORTANT]
> This section provides best practices for using PlayFab Party in cross-play scenarios with Xbox Live, but use of PlayFab Party does not implicitly satisfy the cross-play requirements of [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007). Refer to the [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007) technical documentation for information on satisfying these requirements.

### Identifying players in a cross-network game session

Unique players should be identifiable and distinguishable across multiplayer ecosystems. For this purpose, PlayFab Party provides PlayFab Entity IDs on the various objects which might be associated with users in your session: `PartyLocalUser`, `PartyEndpoint`, `PartyChatControl`.

Cross-network display names are not provided by the PlayFab Party API. When displaying Xbox users in UI, you should use their gamertag and the gamertag should be resolved from the Xbox User ID in the MPSD document. Non-Xbox users should be presented in UI based on the guidelines in [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007). In the absence of a platform-provided display name, PlayFab provides support for display names via [GetPlayerProfile](xref:titleid.playfabapi.com.client.accountmanagement.getplayerprofile). When joining a network, a player should post their display name in a shared session document for other players to see.

Though the PlayFab Party library associates some of its objects with PlayFab users (via PlayFab Entity IDs), the library does not provide functionality to identify which multiplayer ecosystems a PlayFab user might be associated with. To distinguish Xbox Live PlayFab users from users in other multiplayer ecosystems, it is recommended to cross-reference the PlayFab Entity IDs in a Party network with MPSD. For more information on distinguishing Xbox Live players from non-Xbox Live players via MPSD, see the section on [Maintaining a multiplayer session document](#maintaining-a-multiplayer-session-document).

For more information on requirements around identifying users in cross-play networks with Xbox Live, refer to [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007).

### Respecting cross-network communication permissions for Xbox Live users

PlayFab Party does not implicitly comply with Xbox Live's cross-network communication restrictions. Therefore, the PlayFab Party Xbox Live Helper library provides functionality for querying an Xbox Live user's cross-network communication permissions. You must use this information to conform to the cross-network communication requirements specified in [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007).

See [Respecting cross-network communications](party-xbox-live-guide.md#respecting-cross-network-communication-permissions) for more information.

### Use PlayFab Party invitations to restrict access to networks when cross-play is not allowed.

Xbox Live users require cross-network privileges to interact with non-Xbox Live users in cross-network game sessions. PlayFab Party does not implicitly comply with these cross-network restrictions (outlined in [XR-007](https://developer.microsoft.com/games/xbox/docs/gdk/xr007)), therefore this privilege must be queried outside of the PlayFab Party library. When these privileges are not given, you should restrict the Party network to only allow the Xbox Live users known in the game session's MPSD document. You can accomplish this by augmenting our sample [join-in-progress flow](using-mpsd.md#join-in-progress) to use Party invitations that only allow known Xbox users to join the network.

First, ensure that the Party network is created with a restricted invitation.

```cpp
PartyString networkCreatorEntityId;
RETURN_VOID_IF_FAILED(m_localPartyUser->GetEntityId(&networkCreatorEntityId));

PartyInvitationConfiguration newNetworkInitialInvite{};
newNetworkInitialInvite.identifier = nullptr; // let Party select the invitation identifier for simplicity
newNetworkInitialInvite.revocability = PartyInvitationRevocability::Anyone; // the initial invitation must be revocable by anyone

// this initial invitation only allows the original xbl user creating the network
newNetworkInitialInvite.entityIdCount = 1;
newNetworkInitialInvite.entityIds = &networkCreatorEntityId;

PartyError error = PartyManager::GetSingleton().CreateNewNetwork(
    m_localPartyUser,
    &networkConfiguration,
    0,
    nullptr,
    &newNetworkInitialInvite,
    nullptr,
    nullptr,
    nullptr);
```

Similar to the [join-in-progress flow](using-mpsd.md#join-in-progress), when a new Xbox user wants to join the network, they will first add themselves to the session document. When the player that wants to allow them into the network sees the update, they will update the set of invitations to reflect the session document. This will ensure that only users in the session document (which are guaranteed to be Xbox Live users) can join the network.

```cpp
void
OnSessionDocumentUpdated(
    PartyNetwork* network,
    uint32_t usersInDocumentCount,
    const uint64_t* usersInDocument
    )
{
    PartyInvitationConfiguration newInvite{};
    newInvite.identifier = nullptr; // let Party select the invitation identifier for simplicity
    newInvite.revocability = PartyInvitationRevocability::Creator; // must be revocable by the creator only

    // the updated invite should contain all users currently in the document
    std::vector<PartyString> entityIdsInDocument;
    for (uint32_t i = 0; i < usersInDocumentCount; ++i)
    {
        uint64_t xboxUserId = usersInDocument[i];
        // Call title-defined xuid->entityid mapping helper
        PartyString xboxUserEntityId = GetEntityIdFromXboxUserId(xboxUserId);
        if (xboxUserEntityId != nullptr)
        {
            entityIdsInDocument.push_back(xboxUserEntityId);
        }
        else
        {
            DEBUGLOG("User %llu did not have a matching entity ID.", xboxUserId);
        }
    }
    newInvite.entityIdCount = entityIdsInDocument.size();
    newInvite.entityIds = entityIdsInDocument.data();

    // Create a new invitation which includes all of the users currently in the document
    PartyInvitation* newInvitation;
    PartyError error = network->CreateInvitation(
        m_localUser,
        &newInvite,
        nullptr,
        &newInvitation);
    if (PARTY_FAILED(error))
    {
        DEBUGLOG("PartyNetwork(0x%p)::CreateInvitation failed! (error=0x%x)", network, error);
        return;
    }

    // Post the invitation's id somewhere that it can be seen by anyone trying to join/rejoin
    PostInvitationToMPSD(newInvite);

    // Cleanup previous invitations. This isn't strictly necessary, but is a good practice.
    uint32_t invitationCount;
    PartyInvitationArray invitations;
    error = network->GetInvitations(&invitationCount, &invitations);
    if (PARTY_FAILED(error))
    {
        DEBUGLOG("PartyNetwork(0x%p)::GetInvitations failed! (error=0x%x)", network, error);
        return;
    }

    for (uint32_t i = 0; i < invitationCount; ++i)
    {
        if (invitations[i] == newInvite)
        {
            continue; // don't prune the old invitation
        }

        PartyInvitation* oldInvitation = invitations[i];

        error = network->RevokeInvitation(m_localUser, oldInvitation, nullptr);
        if (PARTY_FAILED(error))
        {
            DEBUGLOG("PartyNetwork(0x%p)::RevokeInvitation failed! (err=0x%x)", network, error);
        }
    }
}
```

> [!NOTE]
> Because you will need to translate between Xbox Live User IDs and PlayFab Entity IDs, it is recommended to build a mapping between the two. See [Mapping between Xbox Live User IDs and PlayFab Entity IDs](party-xbox-live-guide.md#mapping-between-xbox-live-user-ids-and-playfab-entity-ids) for examples on how to do this.

## Keeping in sync with Xbox Live profile settings

PlayFab Party, by default, conforms to the profile settings requirements in [XR-048](https://developer.microsoft.com/games/xbox/docs/gdk/xr048). The library does not keep a persistent cache of any Xbox Live profile settings. When profile settings are needed for PlayFab Party's use, the settings are queried from Xbox Live and remain valid for the lifetime of the PlayFab Party API object associated with the setting, but will not persist across multiple instances of the object.

For information on using Xbox Live profile settings data outside of PlayFab Party, see the [XR-048](https://developer.microsoft.com/games/xbox/docs/gdk/xr048) technical documentation.

## Supporting platform multiplayer join flows

On Xbox, players can join multiplayer games via the join-in-progress and platform invitation features. PlayFab Party does not integrate with these platform features directly, but supports their use via `PartyNetworkDescriptor` and `PartyInvitation` objects. `PartyNetworkDescriptor` objects provide the connection information necessary for a remote user to find and connect to the Party network and can be serialized via `PartyManager::SerializeNetworkDescriptor`. `PartyInvitation` objects provide remote users with an ID which is used to authenticate into and join a Party network. To enable remote users to join multiplayer games via join-in-progress and platform invites, integrate the serialized network descriptor and Party invitation identifier into your pre-existing flows. Example flows can also be found in the [Using PlayFab Party with MPSD](using-mpsd.md) document.

For more information on platform multiplayer join flow requirements, see the [XR-064](https://developer.microsoft.com/games/xbox/docs/gdk/xr064) and [XR-124](https://developer.microsoft.com/games/xbox/docs/gdk/console-certification-requirements-and-tests) technical documentation.

## Friends lists

Even though PlayFab Party does not interact natively with friends lists on any platform, multiplayer games may still need to consider friends lists for different scenarios. For information on requirements and guidance when interacting with Xbox Live and cross-network friends lists, see the following documentation:

- [Xbox Live friends list requirements (XR-070)](https://developer.microsoft.com/games/xbox/docs/gdk/console-certification-requirements-and-tests)
- [Cross-network friends list requirements (XR-007)](https://developer.microsoft.com/games/xbox/docs/gdk/xr007)
- [Xbox Social Manager](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview)
- [Xbox Live Services API (XSAPI)](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview)

## Honoring Xbox Live service retry policy and service access limitations.

PlayFab Party does not directly interact with Xbox Live services outside of the [Xbox Live Helper library](party-xbox-live-guide.md). The Xbox Live Helper library, internally, conforms to the retry policies and access limitations for its relevant Xbox Live services as outlined in [XR-074](https://developer.microsoft.com/games/xbox/docs/gdk/xr074) and [XR-132](https://developer.microsoft.com/games/xbox/docs/gdk/xr132). As well, you can recognize API failures as a result of complying with these service policies through the following error codes reported by the Xbox Live Helper library: [PartyXblChatPermissionMaskReason::XboxLiveServiceError](xblreference/enums/partyxblchatpermissionmaskreason.md) and [PartyXblStateChangeResult::PartyServiceError](xblreference/enums/partyxblstatechangeresult.md).

For more information on complying with these service policies outside of the Xbox Live Helper library, see the [XR-074](https://developer.microsoft.com/games/xbox/docs/gdk/xr074) and [XR-132](https://developer.microsoft.com/games/xbox/docs/gdk/xr132) technical documentation.
