---
title: PubSub quickstart
author: MarcoWilliamsPF
description: Describes the PubSub feature of PlayFab, which lets you publish information between clients and services.
ms.author: mawillia
ms.date: 12/21/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, pubsub
ms.localizationpriority: medium
---

# PlayFab PubSub

## Overview

PlayFab PubSub is a flexible system for pushing information in real time between services and clients. Events are relayed via a persistent connection between PlayFab and game clients, allowing clients to subscribe to topics and be notified of events remotely. PubSub is integrated natively with [PlayStream](https://api.playfab.com/playstream) events, extending PlayFab's server-side event-driven model to clients.

![Diagram of data flowing through the PubSub feature to clients](images/pubsub-overview.png)

## Uses of PubSub

Game clients can use PlayFab PubSub to receive all sorts of events, including standard built-in events like `entity_logged_in` or custom events you can define like `player_won_match`. This can be used in a variety of scenarios. For example:

- Populating a player's friends list with presence information
- Sending in-game text chat messages
- Displaying a game invite or friend request notification
- Syncing state changes between a game and its companion app
- Notifying a player that an opponent has made a move in a turn-based game

PlayFab features are also built with standard PubSub events in mind. The first example of this is the new PlayFab [Matchmaking preview](https://blog.playfab.com/blog/matchmaking-preview), which leverages PubSub to inform clients of updates to the status of their matchmaking tickets, such as when a match is found. This allows clients to avoid constantly polling the service for updates while ensuring they are informed of matches as soon as they happen.

## Key concepts

- ***Event*** - Each message sent or received via PubSub is called an event. 
- ***Topic*** - PubSub events are addressed based on Topics. A Topic is made up of three components:
  - ***event namespace***
  - ***event name***
  - ***target entity***  
  Each published event has a specified topic and clients specify the topic they are interested in with each subscription. 
- ***Event Namespace*** - The namespace representing the category of an event. Standard PlayFab events reside under the `com.playfab` namespace. Custom events fall under the `com.playfab.events` namespace.
- ***Event Name*** - The specific type of event.
- ***Target Entity*** - The target entity component of a topic indicates what entity the event is about. It may or may not be the entity which is sending and/or receiving the event.

## Example

Imagine you want to add a feature to your game which pops up a notification whenever one of a player's friends logs in. This can be done by leveraging the built-in `com.playfab.entity_logged_in` PlayStream event. At a high level, you can set up this functionality in just a few steps:

1. Use the [policy manager](pubsub-policies.md) to configure a policy which allows a player's friends to subscribe to their `com.playfab.entity_logged_in` events (Event Namespace = `com.playfab`, Event Name = `entity_logged_in`, Target Entity = `Player`).

1. Add code to your client to retrieve a player's friends list after login and subscribe to `com.playfab.entity_logged_in` for each friend on the list. With each subscription, pass in a reference to the handler function which will be executed when this event is received.

1. Implement the specified event handler function with code which pops up the notification. 
 
> [!NOTE]
> This example uses a built-in event, but a similar process can be used for custom events. The only addition would be that custom events need to be sent from your code at the appropriate time by using the `WriteEvents` API. 

## Links

- [PubSub API Reference](pubsub-reference.md)
- [Creating PubSub Policies](pubsub-policies.md)
- [PubSub Unity Quickstart](quickstart-unity.md)