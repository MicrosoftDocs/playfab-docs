---
title: How PlayFab Party networks interact with your discovery flows
description: How to incorporate PlayFab Party real-time chat and data communication networks into discovery flows.
author: jdeweyMSFT
ms.author: jdewey
ms.date: 08/16/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking
---

# Integrating discovery with PlayFab Party
Discovery is the process by which users find each other to play together. PlayFab Party does not provide a discovery mechanism, but can be used with any existing mechanism which provides communication between users.

## Basic creation and join flow
A PlayFab Party network is [created](#creating-a-network) by a user on a single client, [advertised](#advertising-a-network), and then [joined](#joining-a-network) by other users on different clients.

### Creating a network
The first consideration when using a PlayFab Party network with a game session is choosing which client and user will create the network (`PartyManager::CreateNewNetwork()`). From the perspective of PlayFab Party, it doesn't matter which user does this; any user can create a network. The creator is given no special privileges within the network. However, the client which creates the network is responsible for:

- setting immutable network configuration (`PartyNetworkConfiguration`)
- determining the initial invitation (`PartyInvitationConfiguration`)
- advertising the network to other users

The initial invitation contains an identifier and a list of users that are allowed to join the network. The users are specified as a list of `title_player_account` [Entity IDs](/gaming/playfab/features/data/entities/). Alternatively, the list can be empty, allowing any user with network descriptor and invitation identifier to join.

### Advertising a Network

In order to join to an existing PlayFab Party Network, a client needs two pieces of information:

- network descriptor
- invitation identifier

A PlayFab Party network is identified by a network descriptor (`PartyNetworkDescriptor`). This is a mostly opaque structure which encodes information required to establish a connection to the network. The network descriptor is provided to the creating client after network creation has completed (`PartyCreateNewNetworkCompletedStateChange`, `PartyNetwork::GetNetworkDescriptor()`). To ease development, PlayFab Party provides methods for serializing and deserializing the network descriptor to and from a web-friendly string (`PartyManager::SerializeNetworkDescriptor(), PartyManager::DeserializeNetworkDescriptor()`).

An invitation identifier is a string which uniquely identifies an invitation. It is provided by a client when creating an invitation explicitly or when creating the initial invitation while creating the network. If the client does not supply an invitation identifier, one will be uniquely generated.

To advertise the new network to other users, send these two pieces of information via any appropriate communication medium.

### Joining a network

Joining a network it is a two-step process. A client that wishes to join a network must first connect to the network by providing the deserialized network descriptor to `PartyManager::ConnectToNetwork()`, and then authenticate a user by providing the invitation identifier to `PartyNetwork::AuthenticateLocalUser()`.

## Scenario examples

### Social invitations

The simplest scenario is one in which a single user creates a game session and wishes to invite other known users via their shared social platform. The flow might look something like this:

- The inviter creates the network with an open invitation, or an invitation containing all the users that the inviter wants to play with.
- Once the network is created, the inviter sends the network descriptor and the invitation identifier to the other users via the social platform's invitation mechanism.
- Each invited user uses the network descriptor and invitation identifier to connect to the network.

> [!NOTE]
> When specifying users in an invitation, the users' `title_player_account` [Entity IDs](/gaming/playfab/features/data/entities/) are used. These Entity IDs will need to be obtained out-of-band of PlayFab Party.

### Lobby

If your game provides a lobby which allows data to be sent between clients, it can be used as a communication medium for exchanging network connection information. The flow might look something like this:

- A set of users is selected to play a game together.
- One of those users is selected as the creator.
- Each user in the set sends their `title_player_account` [Entity ID](/gaming/playfab/features/data/entities/) to the creator.
- The creator creates the network, specifying the users' Entity IDs in the initial invitation configuration.
- Once network creation completes, the creator sends the network descriptor and the initial invitation identifier to the set of users that should join.
- Each user uses the network descriptor and the invitation identifier to connect to the network.

### Matchmaking

A matchmaking service, such as [PlayFab Matchmaking](/gaming/playfab/features/multiplayer/matchmaking/), can be used to find a list of users to play with. The flow might look something like this:

- Users initiate a match request with the service. The `title_player_account` [Entity ID](/gaming/playfab/features/data/entities/) must be part of the request, because the match result must contain each user's Entity ID.
- Users receive a match result containing the set of users that should be part of the network.
- A predetermined algorithm is used to select which user will be the creator.
- The creator creates the network, specifying the other matched users' Entity IDs in the initial invitation configuration.
- Once network creation completes, the creator uses an out-of-band communication medium to send the network descriptor and the initial invitation identifier to other matched users.
- Each matched user uses the network descriptor and the invitation identifier to connect to the network.

> [!NOTE]
> An out-of-band communication medium is required to send the connection information from the creator to the other matched users.
