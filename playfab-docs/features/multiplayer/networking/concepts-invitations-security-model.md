---
title: PlayFab Party invitations and the security model
description: Conceptual overview of PlayFab Party invitations and the security model.
author: jdeweyMSFT
ms.author: jdewey
ms.date: 08/21/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
---

# PlayFab Party invitations and the security model

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS and Android are available now. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

## Overview

PlayFab Party is designed to provide a secure communication environment by default. This helps protect games and players, but security restrictions can raise API usage questions for developers. This page introduces the security features of PlayFab Party, primarily focusing on invitations and effective patterns for using them.

PlayFab Party uses industry-standard encryption and authentication for all communication (management data, game data, and real-time communication). This includes all peer-to-peer transmissions and all transactions to Azure services, whether they're web services (which use HTTPS) or the transparent cloud relay service (which uses DTLS).

Limiting access to a network is a core part of protecting the integrity of the network. The ability to join a network is gated by four things:

- Knowledge of the [network descriptor](concepts-objects.md#network)
- Possession of a valid PlayFab `title_player_account` [entity token](/../../data/entities/index.md)
- Knowledge of an invitation [identifier](#identifiers)
- Presence of the PlayFab [entity ID](/../../data/entities/index.md) for the above token in the specified invitation, or the specified invitation being an [open invitation](#users-and-open-invitations)

## Invitations

An invitation (`PartyInvitation`) is an object within a network that grants user access to the network. Invitations can be [created](#creation) and [revoked](#revocation) throughout the lifetime of a network. An invitation has a [creator](#creation), a unique [identifier](#identifiers), a [revocability setting](#initial-invitation-and-other-invitations), and an optional [set of users](#users-and-open-invitations) specified as entity IDs. A network can have any number of active invitations, including none. A network is always created with an initial invitation.

## Invitation lifetime

An invitation is active from the time it is created until it is revoked.

### Creation

There are two ways to create an invitation. The first way is by calling `PartyManager::CreateNewNetwork()`. Since an invitation is required to join a network, one must exist when a network is created. This invitation is known as the initial invitation, and it has some special properties [described below](#initial-invitation-and-other-invitations). The second way is by calling `PartyNetwork::CreateInvitation()`.

The creator of an invitation is the user which was specified when calling `PartyNetwork::CreateInvitation()`. The initial invitation has no creator.

When an invitation is created (or when joining a network with an active initial invitation), a `PartyInvitationCreatedStateChange` is generated.

> [!IMPORTANT]
> The initial invitation does not implicitly allow the creator of a network to join. Unless an [open invitation](#users-and-open-invitations) is being used, be sure to include the creator's entity ID in the user list.

### Enumeration

Enumerating active invitations is done using `PartyNetwork::GetInvitations()`. Only the invitations created on the local device, along with the initial invitation if it is still active, can be enumerated.

### Revocation

An invitation is revoked by calling `PartyNetwork::RevokeInvitation()`. Only the creator of an invitation may revoke it, except for the initial invitation, which may be revoked by any user. Additionally, an invitation is automatically revoked when the user that created it is removed from the network.

When an invitation is revoked, a `PartyInvitationRevokedStateChange` is generated on all devices that could see the invitation.

Once the initial invitation is revoked, it cannot be created again. Its identifier may be reused for a new invitation, but that new invitation will not have the special properties of the initial invitation.

> [!IMPORTANT]
> Revoking an invitation has no effect on the devices and users that have already joined the network. To remove a user or device from the network, use `PartyNetwork::KickUser()` or `PartyNetwork::KickDevice()`. Note that these methods are not yet implemented.

## Invitation configuration

The configuration of an invitation is specified during creation using the `PartyInvitationConfiguration` struct.

### Identifiers

Each invitation has an identifier which uniquely identifies it within the network. If an identifier is not specified when creating an invitation, Party will assign one. For calls to `PartyManager::CreateNewNetwork()`, the assigned identifier is returned in an out parameter and also reported in `PartyCreateNewNetworkCompletedStateChange` when network creation completes. For calls to `PartyManager::CreateInvitation()`, the assigned identifier can be retrieved from the `invitation` out parameter or the `invitation` field in `PartyCreateInvitationCompletedStateChange` when the invitation creation completes.

Although an invitation identifier must be unique, after an invitation is revoked, its identifier may be reused when creating a new invitation.

### Initial invitation and other invitations

Although there is only one type of invitation, the initial invitation created by the call to `PartyManager::CreateNewNetwork()` is a bit different from invitations created later via `PartyNetwork::CreateInvitation()`. The differences are summarized in the table below.

Property | Initial invitation | Other invitations
--- | --- | ---
Visibility | All devices can see the initial invitation. As long as the initial invitation has not been revoked, it will be returned by calls to `PartyNetwork::GetInvitations()`. Upon joining a network, each device will receive a `PartyInvitationCreatedStateChange` for the initial invitation if it has not been previously revoked. | Only the device that created the invitation will be able to see it. A non-initial invitation will only be returned by `PartyNetwork::GetInvitations()` if it was created on that device, and a `PartyInvitationCreatedStateChange` will only be generated for it on the creating device.
Revocability | Anyone may revoke the initial invitation. When explicitly specifying the invitation configuration, revocability must be set to `PartyInvitationRevocability::Anyone`. | Only the creator may revoke the invitation. When creating the invitation, revocability must be set to `PartyInvitationRevocability::Creator`.
Lifetime | The initial invitation is active until it is explicitly revoked. | A non-initial invitation is active until it are explicitly revoked, or until the user which created it is removed from the network. When the user is removed from the network, all the invitations they created are automatically revoked.
Creator | The initial invitation has no creator. `PartyInvitation::GetCreatorEntityId()` will return null. | The user specified when calling `PartyNetwork::CreateInvitation` is the creator. `PartyInvitation::GetCreatorEntityId()` will return that user's entity ID.

Invitations (other than the initial invitation) are hidden from other devices for privacy reasons. See the [friends list usage pattern](#friends-list) for an example of why this is important.

### Users and open invitations

An invitation contains 0 or more users specified as `title_player_account` [entity IDs](/../../data/entities/index.md). If an invitation contains users, that invitation only grants access to join the network to those users. However, if an invitation contains no users, this is an open invitation. Any user may join the network with the identifier of an open invitation.

> [!NOTE]
> On a multi-user device, such as a game console, be sure to use the correct invitation with with correct user. Depending on which users are specified in each invitation, it may be possible that different users on the device may need to use different invitations when authenticating a user to the network via `PartyNetwork::AuthenticateLocalUser()`.

### Immutability

Once an invitation is created, its configuration cannot be changed. However, after an invitation has been revoked, another can be created with the same identifier but a different configuration. See the [dynamic single invitation usage pattern](#dynamic-single-invitation).

## Usage patterns

PlayFab Party invitations are simple but flexible. There are many effective ways to use them to achieve different access models for a network. Below are a few common patterns.

### Open network

An open network is the simplest to understand and implement. It allows anyone with the network descriptor and invitation identifier to join.

Create an open network by passing null for the `initialInvitationConfiguration` parameter when calling `PartyManager::CreateNewNetwork()`. The identifier for the open invitation is returned as an out parameter. After the network creation completes, share the network descriptor and invitation identifier to allow users to join.

Optionally, you may close the network at any point in the future by revoking the initial invitation.

> [!WARNING]
> Because a network is only as secure as the devices and users that join it, exercise caution when sharing the network descriptor and invitation identifier of an open network.

### Static user list

For games that know all players in advance, such as a game created by matchmaking with no backfill, a static user list is an easy and effective pattern. This allows only those users identified before the game begins to join the network.

Create a `PartyInvitationConfiguration` struct and add the known users to its `entityIds` field. Pass this struct into `PartyManager::CreateNewNetwork()`. After the network creation completes, share the network descriptor and invitation identifier to allow users to join.

### One-to-one invitations

In a game where users are individually invited by existing users, a one-to-one invitation pattern is effective and simple.

Create a `PartyInvitationConfiguration` struct and add only the creator to its `entityIds` field. Pass this struct into `PartyManager::CreateNewNetwork()`. Once the creator connects to the network, the initial invitation may optionally be revoked. Alternatively, the creator of the network can create an [open network](#open-network) and then revoke the initial invitation as soon as they connect.

Create additional `PartyInvitationConfiguration` structs for each user that should join the network. Create invitations by passing these structs into `PartyNetwork::CreateInvitation()`. Share the network descriptor with each user along with the invitation identifier for their specific invitation. As users join, they may repeat this pattern to invite more users.

Once a user joins, their specific invitation may optionally be revoked.

### Friends list

For games which want to allow each user's friends to easily join without creating [one-to-one invitations](#one-to-one-invitations), invitations containing the users' entire friends lists can be created.

After connecting to the network, each user will create a `PartyInvitationConfiguration` struct and add each of their social platform friends to its `entityIds` field. Pass this struct to `PartyNetwork::CreateInvitation()`, and share the network descriptor and invitation identifier with friends. When a user's friends list changes, the invitation should be revoked and a new invitation created with the new friends list.

### Dynamic single invitation

Many games will have a lobby or other external service which controls who should join a given network. To keep a network in sync with the external service, a dynamic single invitation pattern can be used. This pattern uses a single invitation with a well known identifier.

There are two variants of this pattern. Either the external service can select a single user to manage invitations for the network, or it can ask all users to attempt to manage invitations. In both cases, whenever the set of users which should be in the network changes, the external service notifies the user(s), and the user(s) attempt to revoke the current invitation and create a new invitation with the same well known identifier containing the new full set of users.

#### Single user management

Having a single user responsible for revoking the current invitation and creating the new invitation leads to predictable ownership of the invitation. However, the external service will need to the following.

- Select the user that will manage invitations.
- Select a new user when the previous user leaves the network.

#### All user management

Having all users attempt to manage invitations leads to unpredictable invitation ownership, but prevents the external service from needing to select a single user. Instead, a user on each device will do the following.

- Attempt to revoke the current invitation. For the initial invitation, all users will attempt this but only one will succeed. For other invitations, only the user who created the last invitation will be able to attempt to revoke it, since the invitation will not be visible to the other users.
- Attempt to create a new invitation. Since invitations must have unique identifiers, only one of the users will succeed. That user must notify the others that it is the new invitation owner, since the invitation will not be visible on other devices.
- When the creator of the current invitation leaves the creating device, all users must again attempt to create a new invitation, just like above.

> [!IMPORTANT]
> When revoking an invitation and creating a new one with the same identifier, there will be a small window of time where the invitation identifier is invalid. If you are using this approach, it will be necessary to retry the call to `PartyNetwork::AuthenticateLocalUser()` if it fails after a reasonable waiting period.

### Rolling open invitation

For games where a lobby or other external service controls who should join a given network, an alternative to the [dynamic single invitation](#dynamic-single-invitation) pattern is the rolling open invitation pattern. In this pattern, there is always a single open invitation. The invitation is revoked and re-created with a new identifier whenever a user that was previously allowed to join is removed from the external service's user list. The invitation identifier acts like a password, and should be similarly protected. The pattern can be implemented in these steps:

- The external service selects a device to create the network and specifies the invitation identifier to use.
- The external service sends the invitation identifier to all other users that should join the network.
- When a new user should join the network, the external service shares the current invitation identifier with that user.
- When an user that had been given the current invitation should no longer be allowed to join, the external service will need to "change the password" by doing the following.
  - Select a new invitation identifier.
  - Request that one or all of the users revoke the current invitation and create a new one with the selected invitation identifier. See [dynamic single invitation](#dynamic-single-invitation) for a discussion of single user management versus all user management.
  - Share the new invitation identifier with all users that should now be allowed to join the network.

## Next steps

- [Learn how PlayFab Party interacts with your discovery flows](concepts-discovery.md)
