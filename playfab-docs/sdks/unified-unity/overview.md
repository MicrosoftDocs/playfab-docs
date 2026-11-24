---
title: PlayFab for Unity (v2 Unified)
author: Jeffrey-Shi
description: Learn about PlayFab for Unity (v2 Unified), built on the PlayFab Unified SDK.
ms.author: jeffshi
ms.date: 11/20/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, unity, unified sdk, package, multiplayer, party, gdk
ms.localizationpriority: medium
---

# PlayFab for Unity (v2 Unified)

PlayFab for Unity (v2 Unified) is the next-generation Unity integration built on top of the [PlayFab Unified SDK](../unified-sdk/overview.md). It's distributed as a single Unity Package Manager (UPM) package.

This package replaces the three separate v1 Unity packages: the [PlayFab Unity SDK](../unity3d/index.md) (Services REST wrappers), the [v1 PlayFab Multiplayer for Unity plugin](../../multiplayer/lobby/lobby-matchmaking-sdks/multiplayer-unity-overview.md), and the [v1 PlayFab Party for Unity plugin](../../multiplayer/networking/party-unity-overview.md).

> [!IMPORTANT]
> Use PlayFab for Unity (v2 Unified) for all new projects. You can't use v1 and v2 together in the same project.

## Key benefits

PlayFab for Unity brings the modern architecture of the Unified SDK to Unity:

- **Single package**: One UPM install brings PlayFab Core, Services, Multiplayer (Lobby and Matchmaking), and Party together. You no longer need separate Services, Multiplayer, and Party packages.

- **Unified authentication**: When you sign in with `PFAuthentication`, it produces a single entity handle that Services and Multiplayer reuse. There's no per-component `SetEntityToken` call or per-call `PlayFabAuthenticationContext` to track.

- **Automatic token management**: The background process refreshes entity tokens. You no longer need to manually sign in again.

- **Consistent async model**: Services and Multiplayer calls use the Unified SDK async pattern, replacing the v1 `(request, onSuccess, onError)` callback pairs.

- **Native HTTP and serialization**: The same native `libHttpClient` that powers the Unified SDK across engines serves HTTP traffic. `PFHttpConfig` configures it. v1 pluggable transports (`ITransportPlugin`) and JSON serializers (`ISerializerPlugin`) are no longer needed.

- **GDK-aware editor tooling**: Your installed Microsoft Gaming Development Kit (GDK) automatically resolves native binaries. Switch between installed GDK editions from the **PlayFab → Change GDK** menu.

## Supported platforms

PlayFab for Unity officially supports:

- **Windows** (XBOX store and other PC storefronts)
- **XBOX** (One, Series S|X, Cloud)

Support for other platforms is coming soon.

## Components

PlayFab for Unity (v2 Unified) provides C# APIs for each Unified SDK component in the same package. The following sections describe the multiplayer components: Party, and Lobby and Matchmaking. Both components require a signed-in player entity (`PFPlayerEntity`) and use native binaries from your installed GDK.

### Party

PlayFab Party adds real-time networking, voice chat, and text chat to your Unity game. Party is part of the PlayFab for Unity package, so you don't need to install a separate Party plugin.

Party provides the following features:

- **Game networking**: Create or join a Party network and send data messages between players.
- **Voice and text chat**: Add voice over IP (VoIP) and text chat between players.
- **Cross-play and cross-talk**: Connect players on Windows PCs and XBOX consoles in the same network and chat session.
- **Party Cognitive Services**: Add real-time text chat translation, voice chat transcription, voice chat translation, and text-to-speech synthesis to support accessibility.

The Party component includes:

- The `PlayFabMultiplayerManager` class and prefab, which provide a simplified C# API for Party networks, players, chat, and data messages.
- A C# interop layer that wraps the native Party library.
- Native Party binaries for Windows and XBOX, which the package resolves from your installed GDK.

> [!NOTE]
> Despite its name, `PlayFabMultiplayerManager` is the Party API and is in the `PlayFab.Party` namespace. Lobby and Matchmaking use the `PlayFabMultiplayer` class.

#### Add Party to your scene

1. Enable Party for your title. For more information, see [Enabling PlayFab Party](../../multiplayer/networking/enable-party.md).
2. Sign in a player and keep the `PFPlayerEntity` that sign-in returns.
3. Add the **PlayFabMultiplayerManager** prefab to your scene.
4. Get the manager with `PlayFabMultiplayerManager.Get()`, and subscribe to the events that your game needs.
5. Pass the player entity to `SetPlayer`.
6. Create a network with `CreateAndJoinNetwork`, or join an existing network with `JoinNetwork` and its network ID.
7. Send chat and data messages, and then call `LeaveNetwork` when the session ends.

The following example creates a Party network for a signed-in player:

```csharp
using PlayFab;
using PlayFab.Party;
using UnityEngine;

public class PartyHost : MonoBehaviour
{
    // Call this method after sign-in with the returned player entity.
    public void StartParty(PFPlayerEntity playerEntity)
    {
        PlayFabMultiplayerManager manager = PlayFabMultiplayerManager.Get();
        if (manager == null)
        {
            Debug.LogError("Add the PlayFabMultiplayerManager prefab to the scene.");
            return;
        }

        manager.OnError += OnPartyError;
        manager.OnNetworkJoined += OnNetworkJoined;
        manager.SetPlayer(playerEntity);
        manager.CreateAndJoinNetwork();
    }

    private void OnNetworkJoined(object sender, string networkId)
    {
        // Share the network ID with other players, for example through a lobby.
        Debug.Log($"Joined Party network: {networkId}");
    }

    private void OnPartyError(object sender, PlayFabMultiplayerManagerErrorArgs args)
    {
        Debug.LogError($"Party error 0x{args.Code:X8}: {args.Message}");
    }
}
```

Other players need the network ID to join. To share the network ID through a lobby, see [Integrate Party with Lobby using Multiplayer SDK](../../multiplayer/networking/party-lobby-integration.md).

Party networking and voice chat are included at no extra cost for eligible XBOX ecosystem developers through [Foundation Mode](../../get-started/foundation-benefits.md). Party Cognitive Services and other services might have an extra cost. For details, see [Billing for PlayFab Party](../../pricing/Meters/meters.md#party).

### Lobby and Matchmaking

PlayFab Lobby and PlayFab Matchmaking help players find each other and form groups before a game session starts. Both services are part of the PlayFab for Unity package, so you don't need to install a separate Multiplayer plugin.

Lobby and Matchmaking provide the following features:

- **Lobby**: Create, join, and find lobbies, and update lobby and member properties.
- **Matchmaking**: Create or join matchmaking tickets, and get match details when PlayFab finds a match.
- **Cross-play**: Group and match players on Windows PCs and XBOX consoles.

The Lobby and Matchmaking component includes:

- The `PlayFabMultiplayer` static class, which provides the C# API and events for lobby and matchmaking operations.
- The `PlayfabMultiplayerEventProcessor` component, which initializes Multiplayer and processes lobby and matchmaking state changes every frame. In v1, this was a prefab. In v2, you add the component to a GameObject.
- A C# interop layer that wraps the native PlayFab Multiplayer library.
- Native Multiplayer binaries for Windows and XBOX, which the package resolves from your installed GDK.

The Lobby and Matchmaking API is event driven. Each operation starts when you call a method and finishes when the matching event fires. Subscribe to events before you call the method.

| Task | Method | Event |
| --- | --- | --- |
| Create and join a lobby | `CreateAndJoinLobby` | `OnLobbyCreateAndJoinCompleted` |
| Join a lobby with a connection string | `JoinLobby` | `OnLobbyJoinCompleted` |
| Find lobbies | `FindLobbies` | `OnLobbyFindLobbiesCompleted` |
| Create a matchmaking ticket | `CreateMatchmakingTicket` | `OnMatchmakingTicketStatusChanged`, `OnMatchmakingTicketCompleted` |
| Join a matchmaking ticket that another player created | `JoinMatchmakingTicketFromId` | `OnMatchmakingTicketStatusChanged`, `OnMatchmakingTicketCompleted` |

#### Add Lobby and Matchmaking to your scene

1. If you use matchmaking, configure a matchmaking queue for your title. For more information, see [Configuring matchmaking queues](../../multiplayer/matchmaking/config-queues.md).
2. Sign in a player and keep the `PFPlayerEntity` that sign-in returns.
3. Add the `PlayfabMultiplayerEventProcessor` component to a GameObject in your scene.
4. In the **Inspector**, set the component's `PlayFabTitleID` field to your title ID.
5. Subscribe to the `PlayFabMultiplayer` events that your game needs.
6. Call lobby and matchmaking methods, such as `CreateAndJoinLobby`.
7. Leave the lobby when the session ends. When the event processor is destroyed, it uninitializes Multiplayer.

The following example creates a public lobby and logs its connection string:

```csharp
using PlayFab;
using PlayFab.Multiplayer;
using UnityEngine;

public class LobbyHost : MonoBehaviour
{
    // Call this method after sign-in with the returned player entity.
    public void CreateLobby(PFPlayerEntity playerEntity)
    {
        PlayFabMultiplayer.OnLobbyCreateAndJoinCompleted += OnLobbyCreateAndJoinCompleted;

        var createConfig = new LobbyCreateConfiguration
        {
            MaxMemberCount = 8,
            OwnerMigrationPolicy = LobbyOwnerMigrationPolicy.Automatic,
            AccessPolicy = LobbyAccessPolicy.Public
        };

        PlayFabMultiplayer.CreateAndJoinLobby(playerEntity, createConfig, new LobbyJoinConfiguration());
    }

    private void OnLobbyCreateAndJoinCompleted(Lobby lobby, int result)
    {
        if (LobbyError.SUCCEEDED(result))
        {
            // Other players pass this connection string to JoinLobby.
            Debug.Log($"Lobby created: {lobby.ConnectionString}");
        }
        else
        {
            Debug.LogError($"Lobby creation failed: 0x{result:X8}");
        }
    }
}
```

For matchmaking, a ticket's status changes as players join and PlayFab searches for a match. When a ticket includes other players to match with, its status is `WaitingForPlayers` until those players join with `JoinMatchmakingTicketFromId`. The status then changes to `WaitingForMatch`. When PlayFab finds a match, `OnMatchmakingTicketCompleted` fires, and you can call `GetMatchDetails` on the ticket.

For more information about these services, see [PlayFab Lobby overview](../../multiplayer/lobby/index.md), [Matchmaking](../../multiplayer/matchmaking/index.md), and [Use lobby and matchmaking together](../../multiplayer/lobby/lobby-and-matchmaking.md).

## Getting started

Setup, installation, prerequisites, sample scenes, and troubleshooting information are available in the GitHub repository:

**[PlayFab Unity SDK on GitHub](https://github.com/PlayFab/PlayFabSDK_Unity)**

## Related resources

- [PlayFab Unified SDK overview](../unified-sdk/overview.md)
- [v1 PlayFab Unity3D SDK](../unity3d/index.md)
- [v1 PlayFab Multiplayer for Unity plugin](../../multiplayer/lobby/lobby-matchmaking-sdks/multiplayer-unity-overview.md)
- [v1 PlayFab Party for Unity plugin](../../multiplayer/networking/party-unity-overview.md)
