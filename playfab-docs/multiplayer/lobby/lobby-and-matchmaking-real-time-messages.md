---
author: thboard
title: Lobby and Matchmaking real-time messages
description: Conceptual overview for Match and Lobby messages
ms.author: thboard
ms.topic: article
ms.service: azure-playfab
ms.date: 03/14/2022
---

# Lobby and Matchmaking real-time messages

## Overview

The Matchmaking and Lobby features have built in support for real-time
messages. Sending messages to players about changes to Matchmaking or Lobby has never
been easier, as the work to handle messages is done for you in the [PlayFab Lobby and Matchmaking SDK](lobby-matchmaking-sdks/lobby-matchmaking-sdks.md). New APIs will
allow connected clients to subscribe for messages about Lobby and Matchmaking
changes. With this addition, you'll no longer need to poll for changes to
matches or lobbies. 

The SDK has been designed to simplify your work. The SDK manages calls between 
game clients or servers and PlayFab Lobby and Matchmaking services. It handles 
the delivery of messages from those services to connected clients in real 
time. Real-time messages have cross-platform support, and will work 
anywhere PlayFab supplies a SDK. Matchmaking and Lobby can be used separately or
together, and real-time messages will work in either case. There's no
support for real-time messages without the SDK at this time.
Real-time messages aren't available as a solution for stand-alone or
general use.

## How do real-time messages work 

Each client maintains a single WebSocket to receive real-time messages.
When there are updates to Matchmaking or Lobby resources in the cloud, the
SDK will forward messages in real-time to all connected clients
subscribed to those resources. 

When a client connects to receive real-time messages, they'll open a new
WebSocket connection to receive messages and listen for change events. When
a client creates a lobby, joins a lobby, starts listening for invitations, or
creates a Matchmaking ticket, the connected client will subscribe to a Lobby or
Matchmaking resource to listen for changes. The client will be notified when
there's an update on the resource topic they’ve subscribed to. For example, if a
client has subscribed to a Lobby resource, they may be notified on change events
like Player A or B has joined or left a Lobby. Matchmaking and Lobby
documentation describe in more detail the operations that will power
messages. 

The WebSocket connection that enables real-time messages is also used for
detecting client connectivity. This client connectivity status is used by the
Lobby service to power lobby ownership management. 

## Shared connection support

Matchmaking and Lobby messages have support to share a single WebSocket
connection, which may be useful if you’re creating a title with couch co-op.
Today, up to eight local users may share the WebSocket connection, and local
players can be added or removed to that shared connection. Multiple users
sharing the same connection can subscribe to topics to get messages for
Matchmaking or Lobby events for those topics. 

## Using the SDK

The SDK simplifies your work for cross-network and cross-platform play by
handling real-time messages for you. Messages are sent to clients on
receiving invites, joining and updating lobbies, finding matches, and more. The
SDK enables cross-platform play and real-time messages on any
platform that PlayFab offers SDK support. Sending messages to clients is
automatic, and the developer doesn't have to do any work to enable
messages. 
