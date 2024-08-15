---
title: Using PlayFab Party with MPSD
author: ScottMunroMS
description: Supplemental guidance for using PlayFab Party with MPSD
ms.author: scmunro
ms.date: 04/24/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, mpsd, roster
ms.localizationpriority: medium
---

# Using PlayFab Party with MPSD

Xbox multiplayer scenarios rely on the use of the Multiplayer Session Directory (MPSD) service and MPSD documents. MPSD documents act as the roster for your current game session and drive multiplayer experiences such as matchmaking, platform invites, recent player lists, and join-in-prgress.

In this document we will describe how you can incorporate PlayFab Party into common multiplayer flows that require MPSD.

This document does not provide an in-depth discussion of MPSD and all of it's capabilities. For more information, refer to the [MPSD documentation](/gaming/gdk/_content/gc/live/features/multiplayer/mpsd/live-mpsd-overview).

## Matchmaking

Here's a simplified flow for how to use matchmaking and MPSD together with PlayFab Party:

1. Players will create and gather into MPSD sessions that represent the groups they want playing together across matchmaking sessions. Players will gather into these sessions by using Xbox's invite and join features.

2. Those player groups will submit tickets to the matchmaking service which will gather compatible player groups into a matchmaking session. This matchmaking session will, itself, be represented by a new session document which the players will then join. Players must also listen for changes to this session document.

3. Once the matchmaking session has been finalized and the roster is locked, the title must elect one of the members of the matchmaking session to set up the PlayFab Party network. A simple strategy for selecting the Party network creator is to use the first member of the matchmaking MPSD session document.

4. The selected member will create the network with an initial `PartyInvitation` that restricts network access to only the members of the matchmaking session. Once the network has successfully completed creation, the selected member should post the resulting network descriptor and Party invitation to the session document as a session property for other members to use.

    ```cpp
    void
    OnMatchmakingSessionFinalized(
        uint32_t usersInSessionCount,
        const uint64_t* usersInSession
        )
    {
        PartyInvitationConfiguration initialInvite{};
        initialInvite.identifier = nullptr; // let Party select the invitation identifier for simplicity
        initialInvite.revocability = PartyInvitationRevocability::Anyone; // must be revocable by anyone

        // the updated invite should contain all users in the matchmaking session
        std::vector<PartyString> entityIdsInSession;
        for (uint32_t i = 0; i < usersInSessionCount; ++i)
        {
            uint64_t xboxUserId = usersInSession[i];
            // Call title-defined xuid->entityid mapping helper
            PartyString xboxUserEntityId = GetEntityIdFromXboxUserId(xboxUserId);
            if (xboxUserEntityId != nullptr)
            {
                entityIdsInSession.push_back(xboxUserEntityId);
            }
            else
            {
                DEBUGLOG("User %llu did not have a matching entity ID.", xboxUserId);
            }
        }
        initialInvite.entityIdCount = entityIdsInSession.size();
        initialInvite.entityIds = entityIdsInSession.data();

        // This is an asynchronous call. It will be completed when StartProcessingStateChanges generates a
        // PartyCreateNewNetworkCompletedStateChange struct
        PartyError error = PartyManager::GetSingleton().CreateNewNetwork(
            m_localPartyUser,
            &networkConfiguration,
            0,
            nullptr,
            &initialInvite,
            nullptr,
            nullptr,
            nullptr);
        if (FAILED(error))
        {
            DEBUGLOG("PartyManager::CreateNetwork failed! 0x%08x\n", error);
            return;
        }
    }

    void
    HandleCreateNewNetworkCompleted(
        const PartyCreateNewNetworkCompletedStateChange& createNewNetworkCompletedStateChange
        )
    {
        if (createNewNetworkCompletedStateChange.result == PartyStateChangeResult::Succeeded)
        {
            // The network was created successfully! Post the networks descriptor and invitation

            char serializedDescriptor[c_maxSerializedNetworkDescriptorStringLength + 1];
            PartyError error = PartyManager::SerializeNetworkDescriptor(
                &createNewNetworkCompletedStateChange.networkDescriptor,
                serializedDescriptor);
            if (PARTY_FAILED(error))
            {
                DEBUGLOG("PartyManager::SerializeNetworkDescriptor failed: 0x%08x\n", error);
                return;
            }

            UpdateSessionProperty(
                "PartyNetworkDescriptor", // arbitrary property name
                serializedDescriptor);

            UpdateSessionProperty(
                "PartyInitialInvitation", // arbitrary property name
                createNewNetworkCompletedStateChange.appliedInitialInvitationIdentifier);
        }
        else
        {
            // The network was not created successfully.
            // Please refer to CreateNewNetwork reference documentation for retry guidance
        }
    }
    ```

5. When each member sees the session document updated, they may use the network descriptor and invitation to connect to and join the network.

    ```cpp
    void
    OnNetworkInformationPostedToSessionDocument(
        PartyString serializedNetworkDescriptor,
        PartyString invitationId
        )
    {
        PartyNetworkDescriptor networkDescriptor;
        PartyError error = PartyManager::DeserializeNetworkDescriptor(serializedNetworkDescriptor, &networkDescriptor);
        if (PARTY_FAILED(error))
        {
            DEBUGLOG("PartyManager::DeserializeNetworkDescriptor failed: 0x%08x\n", error);
            return;
        }

        // attempt to connect to the network
        PartyNetwork* network;
        error = PartyManager::GetSingleton().ConnectToNetwork(
            &networkDescriptor,
            nullptr,
            &network);
        if (PARTY_FAILED(error))
        {
            DEBUGLOG("PartyManager::ConnectToNetwork failed: 0x%08x\n", error);
            return;
        }

        // immediately queue an authentication on the network we've attempted to connect to.
        error = network->AuthenticateLocalUser(
            m_localUser,
            invitationId,
            nullptr);
        if (PARTY_FAILED(error))
        {
            DEBUGLOG("PartyNetwork::AuthenticateLocalUser failed: 0x%08x\n", error);
            return;
        }
    }
    ```

> [!NOTE]
> Here we've presented one flow for incorporating matchmaking and MPSD with PlayFab Party. The core ideas of this flow can be extended to other flows you might be interested in with MPSD, but presenting all possible flows is outside the scope of this documentation. For more information, see the [full MPSD documentation](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview).

## Platform invites

Here's a flow for how to incorporate Xbox platform invites into PlayFab Party:

1. *PlayerA* creates an MPSD session document, listens for session changes, and a creates a Party network. When the Party network creation has completed, *PlayerA *posts the network descriptor and an initial invite (if necessary) to the MPSD session document.

    ```cpp
    void
    OnSessionDocumentCreated()
    {
        // This is an asynchronous call. It will be completed when StartProcessingStateChanges generates a
        // PartyCreateNewNetworkCompletedStateChange struct
        PartyError error = PartyManager::GetSingleton().CreateNewNetwork(
            m_localPartyUser,
            &networkConfiguration,
            0,
            nullptr,
            nullptr,
            nullptr,
            nullptr,
            nullptr);
        if (FAILED(error))
        {
            DEBUGLOG("PartyManager::CreateNetwork failed! 0x%08x\n", error);
            return;
        }
    }

    void
    HandleCreateNewNetworkCompleted(
        const PartyCreateNewNetworkCompletedStateChange& createNewNetworkCompletedStateChange
        )
    {
        if (createNewNetworkCompletedStateChange.result == PartyStateChangeResult::Succeeded)
        {
            // The network was created successfully! Post the networks descriptor and invitation

            char serializedDescriptor[c_maxSerializedNetworkDescriptorStringLength + 1];
            PartyError error = PartyManager::SerializeNetworkDescriptor(
                &createNewNetworkCompletedStateChange.networkDescriptor,
                serializedDescriptor);
            if (PARTY_FAILED(error))
            {
                DEBUGLOG("PartyManager::SerializeNetworkDescriptor failed: 0x%08x\n", error);
                return;
            }

            UpdateSessionProperty(
                "PartyNetworkDescriptor", // arbitrary property name
                serializedDescriptor);
        }
        else
        {
            // The network was not created successfully.
            // Please refer to CreateNewNetwork reference documentation for retry guidance
        }
    }
    ```

2. When *PlayerA* wants to invite *PlayerB* to the Party network, *PlayerA* initiates a platform invite to *PlayerB* via in-game or console UI.

3. *PlayerB* receives the platform invite which includes an "invite handle" that *PlayerB* can use to find *PlayerA's* MPSD session document.

4. *PlayerB* joins the session document and listens for changes.

5. *PlayerA* sees *PlayerB* join the session document. *PlayerA* creates a new invitation for *PlayerB* to use and posts that invitation to the session document

    ```cpp
    void
    OnUserJoinedSessionDocument(
        PartyNetwork* network,
        uint64_t newSessionMemberXboxUserId
        )
    {
        std::string newMemberIdString = std::to_string(newSessionMemberXboxUserId);

        // Specify our own invitation id so we don't have to query for it after the invitation has been created.
        // Here we will specify the invite id with the format "InviterXboxUserID_InviteeXboxUserID" so that we can
        // ensure this invitation ID doesn't clash with the invitations other members might try and create for this user.
        std::string invitationId = std::to_string(m_localXboxUserId) + "_" + newMemberIdString;

        PartyInvitationConfiguration newInvite{};
        newInvite.identifier = invitationId.c_str();
        newInvite.revocability = PartyInvitationRevocability::Creator; // must be revocable by the creator only

        // Call title-defined xuid->entityid mapping helper
        PartyString newSessionMemberEntityId = GetEntityIdFromXboxUserId(newSessionMemberXboxUserId);
        newInvite.entityIdCount = 1;
        newInvite.entityIds = &newSessionMemberEntityId;

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

        // Post the invitation to the local user's member property store in the session document, key'd by the invitee's
        // xbox user id. This will let the invitee recognize when an invitation is intended for them.
        UpdateMemberProperty(
            newMemberIdString.c_str(),
            invitationId.c_str());
    }
    ```

6. *PlayerB* sees the invitation posted to the session document and uses it to join the Party network.

    ```cpp
    void
    OnRemoteMemberPropertyUpdated(
        PartyString memberPropertyKey,
        PartyString memberPropertyValue
        )
    {
        // The member property update signifies a new invitation, if the remote member updated a property that matches
        // our xbox user id.
        if (memberPropertyKey == std::to_string(m_localXboxUserId))
        {
            OnUserInvitationPostedToSessionDocument(memberPropertyValue);
        }

        // ...
    }

    void
    OnUserInvitationPostedToSessionDocument(
        PartyString invitationId
        )
    {
        // The network descriptor should have already been posted to the session document before the invitation.
        // Call title-defined function to pull it from the session document.
        PartyNetworkDescriptor networkDescriptor = QueryNetworkDescriptorFromSessionDocument();

        // attempt to connect to the network
        PartyNetwork* network;
        error = PartyManager::GetSingleton().ConnectToNetwork(
            &networkDescriptor,
            nullptr,
            &network);
        if (PARTY_FAILED(error))
        {
            DEBUGLOG("PartyManager::ConnectToNetwork failed: 0x%08x\n", error);
            return;
        }

        // immediately queue an authentication on the network we've attempted to connect to.
        error = network->AuthenticateLocalUser(
            m_localUser,
            invitationId,
            nullptr);
        if (PARTY_FAILED(error))
        {
            DEBUGLOG("PartyNetwork::AuthenticateLocalUser failed: 0x%08x\n", error);
            return;
        }
    }
    ```

    > [!IMPORTANT]
    > Invitations created via [PartyNetwork::CreateInvitation](reference/classes/PartyNetwork/methods/partynetwork_createinvitation.md) will become invalid if the PartyLocalUser which created them leaves the network. Therefore, if a new user adds themselves to a session document but the user which invited them leaves, it is recommended that the new user remove themselves from the session document and wait to be re-invited by another user.


## Join in-progress

Joining in-progress game sessions is very similar to the [platform invite](#platform-invites) scenario. The core difference is that instead of *PlayerA* sending *PlayerB* an "invite handle", *PlayerB* will get a "join handle" when they initiate a join-in-progress from the platform UI. Using this "join handle", the *PlayerB* will join the session document and listen for changes. *PlayerA* will respond by creating and posting a new Party invitation for them to the session document. *PlayerB* will see this new invitation alongside the network descriptor and will use it to join the Party network.

> [!IMPORTANT]
> Invitations created via [PartyNetwork::CreateInvitation](reference/classes/PartyNetwork/methods/partynetwork_createinvitation.md) will become invalid if the PartyLocalUser which created them leaves the network. Therefore, if a new user receives a Party invitation from the join-in-progress flow, but cannot use it becaues the user which created it has left, it is recommended that the new user remove themselves from the session document and re-join later. This will enable another member of the session to restart the flow and generate a new Party invitation for this user.

## Disconnects and Cleanup

If a player leaves or is otherwise disconnected from a Party network, they should also remove themselves from any MPSD sessions associated with that Party network. Party network disconnects not initiated by a [PartyNetwork::LeaveNetwork](reference/classes/PartyNetwork/methods/partynetwork_leavenetwork.md) operation are considered fatal. After experiencing a fatal disconnect, a player may try to re-connect and re-authenticate into the network but must also rejoin the MPSD session.

If a player's connection to an MPSD session is temporarily interrupted, they may get disconnected from that session. Players can attempt to rejoin the session but, if they fail, should voluntarily remove themselves from the Party network by calling [PartyNetwork::LeaveNetwork](reference/classes/PartyNetwork/methods/partynetwork_leavenetwork.md).

> [!NOTE]
> The mechanisms and heuristics which detect disconnects for Party networks and MPSD sessions are different. Even in scenarios where a player will be disconnected from both the Party network and MPSD session, these disconnect events are independent, and it is not guaranteed that they occur close to each other in time. Titles should handle the scenario where a player might only be disconnected from either the Party network or MPSD session.

If the game shuts down, the player will be disconnected from the Party network and MPSD document automatically, and no further clean up is necessary.
