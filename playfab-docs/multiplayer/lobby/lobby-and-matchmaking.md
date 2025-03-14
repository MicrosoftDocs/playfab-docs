---
title: Use lobby and matchmaking together
author: joannaleecy
description: Learn how to use Lobby and Matchmaking to implement a multiplayer game scenario.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, types
ms.localizationpriority: medium
---

# Use Lobby and Matchmaking Together
 

When designing multiplayer games, matchmaking and lobbies are often used together to help people form groups to play together. 

PlayFab Lobby and PlayFab Matchmaking helps you implement a wide variety of multiplayer scenarios.

This article describes the relationship between these two services and illustrates how they can be used together to implement a [game scenario](#example-scenario) specified below.

## Understand the relationship between Lobby and Matchmaking

Lobby and Matchmaking work seamlessly together to create cohesive multiplayer matchmaking experience for your title. 

* Matchmaking gathers a set of players together looking to participate in a game session.
* After matchmaking has identified a set of players, Lobby provides them a communication medium to coordinate joining a game session together.
    * Common scenarios for lobby include sharing game server connection information, sharing client IPs for peer-to-peer games, and sharing player configurations.

### Arranged lobbies

Titles can use "Arranged Lobbies" to support easily creating lobbies for your players which have been grouped together via matchmaking.

After the matchmaking ticket has successfully matched a group of players, the matchmaking ticket will contain a __lobbyArrangementString__. Each player can then pass the arrangement string to __PFMultiplayerJoinArrangedLobby__ to join the same lobby.

## Example Scenario

A player wants to play with other people. The player starts a multiplayer game, invites friends, and waits for others to join.

### Design specifications

* The game is open for everyone to join. 
* The initial set of players is populated via matchmaking.
* The lobby owner is able to invite friends to join.
* When the required number of players are met, all players in the lobby receive a message asking if they're ready to start the game. They have one minute to respond. The game starts after all the players confirmed that they're ready to start game. 
* If players in the lobby did not confirm their ready-to-play status, the lobby owner can remove them as inactive players and use matchmaking to find new players to quickly replace them.
* When any player gets disconnected unexpectedly during the game, the title should find a new replacement for the dropped player through matchmaking using server backfill.
* When the game ends, all players return to the lobby. Players are awarded team achievements equally. They have the option to either stay to start another game together or leave the lobby.

### Implementation

This section describes how to use Matchmaking and Lobby to implement the above [design specifications](#design-specifications).

* [Create a matchmade lobby](#create-a-matchmade-lobby)
* [Send invites to friends](#send-invites-to-friends)
* [Allow people to find and join game](#allow-people-to-find-and-join-game)
* [Notify players to start game](#notify-players-to-start-game)
* [Remove and replace inactive players](#remove-and-replace-inactive-players)
* [Handle a finished game](#handle-a-finished-game)

### Create a matchmade lobby

Create a public lobby for a group of matchmade players.

* Each player creates a matchmaking ticket with their specified matchmaking attributes.
    * To learn more, see [Specify ticket attributes](../matchmaking/ticket-attributes.md).
* All created tickets are added to a matchmaking queue be matched with one another. 
    * Tickets are matched based on rules.
    * Rules can be defined in the matchmaking queue configuration.
    * To learn more, see [Configure matchmaking queues](../matchmaking/config-queues.md).
* After matchmaking, each player joins the matchmade lobby via the matchmaking ticket's __lobbyArrangementString__.
    * When joining the arranged lobby, specify that the lobby's __accessPolicy__ is __Public__ to make the lobby open.
    * See [Arranged lobbies](#arranged-lobbies) for more information.
* The first player to join the arranged lobby becomes the owner for the lobby.
* The lobby properties can be used to specify which game map a game session intends to use.
    * For more information, see [Lobby properties](lobby-properties.md).
* Use search properties to enable players to find this lobby and game session among all of the active lobbies in your title.
    * For more information, see [Search properties](define-search-keywords.md).

### Send invites to friends

Allow the lobby owner to select friends and send invites.

* Get lobby owner's friends list
* Display game UI to allow lobby owner to select friends to invite
* Send in-game invites to selected friends.
    * For more information, see [Lobby invites](lobby-invites.md).

### Allow people to find and join game

Setup the lobby's search properties to allow other players to find it

* Display all lobbies in your game UI. Your title should also provide a way to accept player's search terms.
* Use __PFMultiplayerFindLobbies__ using the player's search parameters to return a list of lobbies that match the criteria.
* After a player selects to join a game, use __PFMultiplayerJoinLobby__ to add the player to the game.

### Notify players to start game 

Inform all players in the lobby that game is ready to start

* When the required number of players are in the lobby, display game UI to get players to confirm that they're ready to start play.
* Allow the lobby owner to view these confirmation responses.

### Remove and replace inactive players 

Lobby owner has the ability to remove inactive or disconnected players and initiate matchmaking to fill up the remaining spots

* If a player has discoonected or did not respond within the given set duration (one minute), use __PFLobbyForceRemoveMember__ to remove the player.
* The lobby owner will use __CreateServerBackfillTicket__ to create a matchmaking ticket. Tickets created using this API are given priority during searching. This is to minimize gameplay disruption. To learn more, see [Using server backfill tickets](../matchmaking/backfill-tickets.md).
* After joining the backfill lobby, the game's lobby owner can share the original lobby's connection string with the new backfill players and they can join the original lobby.
* Extend the game start time when appropriate.

### Handle a finished game

After the game has finished, all players return to the lobby screen to complete the game session.

* Lobbies are transient so any data from the lobby which should be persisted should be retained by each player at this point.
    * For example, some game scenarios may benefit from processing data stored in the member properties and turning that data into player achievements.
* Players who want to continue playing with the same group will stay in the lobby.
* Players who want to stop playing with the same group will leave the lobby with __PFLobbyLeave__ and restart the process with a new matchmaking group.

## See also

* [Create a lobby](create-a-lobby.md)
* [Lobby invites](lobby-invites.md)
* [Search properties](define-search-keywords.md)
* [Lobby properties](lobby-properties.md)
* [Using server backfill tickets in Matchmaking](../matchmaking/backfill-tickets.md)
