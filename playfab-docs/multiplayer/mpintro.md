---
title: Multiplayer with PlayFab
author: joannaleecy
description: Learn how PlayFab services can be used for multiplayer.
ms.author: jenelleb
ms.date: 03/04/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer
ms.localizationpriority: medium
---

# Multiplayer with PlayFab

Multiplayer is a great addition to many titles, and PlayFab provides several services focused on multiplayer scenarios:

|Service|Description|
|--|--|
|[Lobby](./lobby/index.md)| Create lobbies for coordinating gameplay among groups pre-game or post matchmaking|
|[Matchmaking](./matchmaking/index.md)| Deploy custom matchmaking rules to group players quickly|
|[Party](./networking/index.md)|Connect players with networking and accessible in-game chat|
|[Servers](./servers/index.md)|Dynamically scale custom multiplayer servers in Azure |

While titles can use all of these services in combination, they can be used independently as well, and this is quite common. For example titles might use PlayFab matchmaking but allocate servers from an alternative multiplayer server hosting solution. Or games might use PlayFab multiplayer servers for hosting, but use their own matchmaking system to bring players together.

Increasingly games are building *cross-network* experiences with players engaging each other from different identity domains (for example, Xbox Live players interacting with Steam players interacting with custom identity systems). PlayFab's services were designed to support cross-progression and cross-network play.

## Example multiplayer scenarios

PlayFab is designed to support a variety of multiplayer modes. Below is a list of modes that might be integrated in a single, fairly sophisticated title. In this section we will briefly suggest how to implement these experiences using PlayFab services.

|Game Mode | Max # of Players | Matchmaking | Backfill | Invite friends | Unsolicited join-in-progress | Chat | Server Model|
|--|--|--|--|--|--|--|--|--|
|**Single-player campaign** | 1 | No | No | No | No | No | No |
|**Cooperative campaign** | 4 | No | No | **Yes** | **Yes** | **Yes** | P2P |
|**In-Game parties**  | 8 | No | No | **Yes** | **Yes** | **Yes** | P2P |
|**Casual small sessions**  | 8 | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | P2P |
|**Casual large sessions**  | 32 | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | Cloud Server |
|**Competitive small sessions** | 8 | **Yes** | No | **Yes** | No | **Yes** | Cloud Server |
|**Competitive large sessions** | 32 | **Yes** | No | **Yes** | No | **Yes** | Cloud Server |

### In-game parties and unsolicited join-in-progress

Players often want to control who they play with, preferentially selecting friends or like-minded players. PlayFab Lobby is a designed to facilitate runtime grouping of players, with built-in access controls for discoverability and joinability. Players can search for and join whichever open lobby meets their needs, whether they're looking to join a friend or play a specific game mode. 

Players can also be members of multiple Lobbies at the same time. This allows you to create flexible player groupings such as allowing three friends to remain grouped as they matchmake with others over several matches. 

With built-in [real-time messages](lobby/lobby-and-matchmaking-real-time-messages.md), members of a Lobby can receive real-time messages when changes occur such as members joining or leaving, or data being written to the Lobby. The same real-time message mechanism can be used for cross-platform invites, allowing players to listen for an invite whether or not they are a member of a Lobby. Platforms may provide built-in invitation and presence systems that launch toasts and have other beneficial experiences (join in progress from the player profile card) that you should consider integrating if applicable.

While you can use Lobby for signaling and other limited data-sharing, PlayFab Party is best suited for real-time data transfer and chat. PlayFab Lobby can be used to share PlayFab Party network descriptors or PlayFab multiplayer server session details to the group's data storage. This sharing of session information can allow players to join a friend's session unsolicited. If you are using non-PlayFab services for real-time networking or game hosting, those systems typically have identifying information that you can similarly signal between players using Lobby.

- [Learn more about Lobby](./lobby/index.md)
- [Learn more about Party](./networking/index.md)

### Matchmaking and backfill

Players may want to play with new people they don't know, and balanced anonymous matchmaking experiences are core to many multiplayer games. PlayFab Matchmaking is designed to get players together quickly using rules you customize.

When a player or group of players want to play together, one player creates a matchmaking ticket for themselves or the entire group. PlayFab Matchmaking allows users to be submitted to matchmaking together as a team, with a join flow that ensures that all players in the group consent to match together. The service also allows for backfill tickets, which can be used to replace players who leave mid-game. Join in progress and backfill capabilities are helpful mechanisms to keep casual game sessions as full as possible.

[Use Lobby and Matchmaking Together](lobby/lobby-and-matchmaking.md) for runtime grouping and signalling amongst matched players. PlayFab Matchmaking is integrated with PlayFab Multiplayer Servers to simplify server allocations for completed tickets and improve match security. Also PlayFab Matchmaking tickets fire PlayStream events that can trigger CloudScript, this can help integrate matchmaking with your own multiplayer systems.

- [Learn more about Matchmaking](./matchmaking/index.md)

### Chat

In addition to network transport for game data, PlayFab Party includes real-time voice and text chat features to quickly add player communications to any session-based game. PlayFab Party enables a player's presence in multiple networks simultaneously, with customized muting rules for each network. This provides flexibility to implement channels and complex chat relationships.

Party utilizes Azure Cognitive Services to transcribe player voice chat and synthesize text as speech. This functionality has several uses, but was primarily designed as an accessibility aide. Party not only transcribes player chat, but also translates chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities make for a more engaging multiplayer experience.

- [Learn more about Party](./networking/index.md)

### Game hosting

Real-time multiplayer games typically select a specific player device to host game state (also known as "peer to peer") or use a dedicated multiplayer server. If hosting a game on a player device, PlayFab Party is an ideal low-latency device-to-device networking system to synchronize this game state across the session's participants.

It is difficult to scale peer to peer games when the device count grows. While PlayFab Party provides network encryption and uses relays to protect player IP addresses, having a device operate as host still opens avenues for cheating.

PlayFab Multiplayer Servers provides simple and efficient scaling of multiplayer across Azure's global cloud. Using a small server, for example loading 10 sessions of 10 players each on a F2v2 Linux virtual machine, can efficiently and dramatically simplify your multiplayer design and improve its reliability compared to a P2P implementation. Sophisticated multiplayer computation can be achieved by setting a server's build configuration to allocate more Azure resources to a session, perhaps using 8 or more cores for a 200 player experience.

- [Learn more about Party](./networking/index.md)
- [Learn more about Multiplayer Servers](./servers/index.md)

## See Also 

- Track and share to player rankings with [Leaderboards](../community/leaderboards/index.md)
- Use [Groups](../community/associations/groups/index.md) to keep track of player groups over long durations. 
- Use [CloudScript](../live-service-management/service-gateway/automation/cloudscript/index.md) to react to player activity in real time with flexible cloud-based code
