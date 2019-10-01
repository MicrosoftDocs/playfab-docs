---
title: Multiplayer with PlayFab
author: v-thopra
description: Learn how PlayFab services can be used for multiplayer.
ms.author: v-thopra
ms.date: 03/04/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer
ms.localizationpriority: medium
---

# Multiplayer with PlayFab

Multiplayer can be a great addition to many titles, and PlayFab provides several services focused on multiplayer scenarios:

- **Leaderboards** - Track and respond to player activity with statistics and leaderboards.
- **Entity Groups** - Create permanent or temporary groups of players and signal activity.
- **Matchmaking** - Deploy custom matchmaking rules to group players quickly.
- **Party** - Connect players with networking and accessible in-game chat.
- **Servers** - Dynamically scale custom multiplayer servers in Azure.

Leaderboards, Entity Groups, and Matchmaking are production services offered in PlayFab Essentials, our core services package, without any additional cost.

Servers is a production service, which costs extra (see [Multiplayer Server billing](./servers/billing-for-thunderhead.md)). Party is a pre-production service still being finalized. It is offered with very limited quota, and is free (for the time being). It will become a premium service when production support is enabled later this year.

While titles can use all of these services in combination, they can be used independently as well, and this is quite common. For example titles might use PlayFab matchmaking but allocate servers from an alternative multiplayer server hosting solution. Or games might use PlayFab multiplayer servers for hosting, but use their own matchmaking system to bring players together.

Increasingly games are building "cross-network" experiences, with players engaging each other from different identity domains (e.g. Xbox Live players interacting with Steam players interacting with custom identity systems). PlayFab's services were designed to support cross-progression and cross-network play.

|Service|Production Readiness|Billing|
|--|--|--|
|[Leaderboards](../social/tournaments-leaderboards/using-resettable-statistics-and-leaderboards.md)|Production|Included in PlayFab essentials|
|[Entity Groups](../data/playerdata/index.md)|Production |Included in PlayFab essentials|
|[Matchmaking](./matchmaking/index.md)|Production |Included in PlayFab essentials|
|[Party](./networking/index.md)|Pre-production|Premium Service - Free during private preview|
|[Servers](./servers/index.md)|Production |Premium Service|

## Example multiplayer scenarios
PlayFab is designed to support a variety of multiplayer modes. Below is an list of modes that might be integrated in a single, fairly sophisticated title. In this section we will briefly suggest how to implement these experiences using PlayFab services.

|Game Mode | Max # of Players | Leaderboard | Matchmaking | Backfill | Invite friends | Unsolicited join-in-progress | Chat | Server Model|
|--|--|--|--|--|--|--|--|--|
|**Single-player campaign** | 1 | **Yes** | No | No | No | No | No | No |
|**Cooperative campaign** | 4 | **Yes** | No | No | **Yes** | **Yes** | **Yes** | P2P |
|**In-Game parties**  | 8 |  No | No | No | **Yes** | **Yes** | **Yes** | P2P |
|**Casual small sessions**  | 8 | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | P2P |
|**Casual large sessions**  | 32 | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | Cloud Server |
|**Competitive small sessions** | 8 | **Yes** | **Yes** | No | **Yes** | No | **Yes** | Cloud Server |
|**Competitive large sessions** | 32 | **Yes** | **Yes** | No | **Yes** | No | **Yes** | Cloud Server |

### Leaderboards and player data
In-game leaderboards can be used to:
1. Store player results to trigger in-game rewards and other gameplay behavior  
2. Store and rank player results as a matchmaking input
3. Create in-game ranking experiences, where users can browse the leaderboard and understand their comparative performance

Leaderboards can augment both single-player and multiplayer modes. For example a campaign leaderboard might track the number of special items collected by the player, while a multiplayer leaderboard might track player vs. player wins. PlayFab leaderboards is built to power these experiences, tracking a player statistic and ranking players using that statistic.

If player results do not need to be shared broadly with other players, player-associated PlayFab entity data may be better suited to store this data. A benefit of PlayFab's entity  system is the ability to track cross-network progression of player's activity and other data across multiple accounts. Changes to PlayFab leaderboards and data both fire PlayStream events which can trigger custom CloudScript. This allows for highly customizable responses to player activity in real-time.

Applicable services:
- [Learn more about Leaderboards](https://docs.microsoft.com/en-us/gaming/playfab/features/social/tournaments-leaderboards/)
- [Learn more about Entity data](https://docs.microsoft.com/en-us/gaming/playfab/features/data/playerdata/)
- [Learn more about CloudScript](https://docs.microsoft.com/en-us/gaming/playfab/features/automation/cloudscript/)

### In-game parties and unsolicited join-in-progress
Players often want to commiserate outside of proper gameplay and your title may support this through an in-game guild or party experience. PlayFab Entity groups and PlayFab Party are designed with these scenarios in mind.

You can make a PlayFab entity group for:
1. Players sharing status with their followers
2. Players creating guilds that are long-lived (months or days)
3. Players creating parties that are short-lived (hours or less)

PlayFab entity groups have built-in flows for controlling access and players requesting group access from the group's leaders. Groups can be associated with arbitrary file data, so you can allow players to share messages or post other persistent content to a shared space.

While you can use entity groups for signaling and other *slow* data-sharing, PlayFab Party is best suited for real-time data transfer and chat. A common usage of PlayFab entity groups will involve players storing PlayFab Party network descriptors or PlayFab multiplayer server session details to the group's data storage. This sharing of session information can allow players to join a friend's session unsolicited. If you are using non-PlayFab services for real-time communication or game hosting, those systems typically have identifying information that you can similarly signal between players using entity groups.

PlayFab entity groups does not have a push notification system for players to be notified of entity object changes and requires polling the service to keep updated. Platforms may provide built-in invitation and presence systems that launch toasts and have other beneficial experiences (join in progress from the player profile card) that you should consider integrating if applicable.

- [Learn more about Entity groups](https://docs.microsoft.com/en-us/gaming/playfab/features/social/groups/quickstart)
- [Learn more about Party](https://docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/networking/)

### Matchmaking and backfill
Players may want to play with new people they don't know, and balanced anonymous matchmaking experiences are core to many multiplayer games. PlayFab Matchmaking is designed to get players together quickly using rules you customize.

When a player or group of players want to play together, one player creates a matchmaking ticket for themselves or the entire group. PlayFab matchmaking allows users to be submitted to matchmaking together as a team, with a join flow that ensures that all players in the group consent to match together. The service also allows for backfill tickets, this can be useful to replace players who leave mid-game. Join in progress and backfill capabilities are helpful mechanisms to keep casual game sessions as full as possible.

PlayFab matchmaking is integrated with PlayFab multiplayer servers to simplify allocating servers for completed tickets and improve match security. Also PlayFab matchmaking tickets fire PlayStream events that can trigger CloudScript, this can help integrate matchmaking with your own multiplayer systems.

- [Learn more about Matchmaking](https://docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/matchmaking/)

### Chat
PlayFab Party be used to add real-time voice and text chat to social or gameplay experience for up to 32 players. Because players can be in multiple networks simultaneously, and within a network you can configure arbitrary muting rules, you have considerable flexibility to implement channels or other complex chat relationships.

Party utilizes Azure Cognitive Services to transcribe player voice chat and synthesize text as speech. This functionality has several uses, but was primarily designed as an accessibility aide. Party can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience.

- [Learn more about Party](https://docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/networking/)

### Game hosting
Real-time multiplayer games typically select a specific player device to host game state (aka "peer to peer") or use a dedicated multiplayer server. If hosting a game on a player device, PlayFab Party is an ideal low-latency device-to-device networking system to synchronize this game state across the session's participants.

It is difficult to scale peer to peer games when the device count grows. While PlayFab Party provides network encryption and uses relays to protect player IP addresses, having a player device operate as host simplifies the ability of that player to cheat. M

PlayFab multiplayer servers provides simple and efficient scaling of multiplayer in Azure. Using a small server, for example loading 10 sessions of 10 players each on a F2v2 Linux virtual machine, can efficiently and dramatically simplify your multiplayer design and improve it's reliability. Sophisticated multiplayer computation can be achieved by setting a server's build configuration to allocate more Azure resources to a session, perhaps using 8 or more cores for a 200 player experience.

- [Learn more about Party](https://docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/networking/)
- [Learn more about Multiplayer Servers](https://docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/servers/)
