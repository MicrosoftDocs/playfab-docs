---
author: thboard
title: Lobby and Matchmaking real-time Notifications
description: Conceptual overview for Match and Lobby notifications
ms.author: thboard
ms.topic: conceptual
ms.service: azure-playfab
ms.date: 03/14/2022
---

# Lobby and Matchmaking real-time notifications

## Overview

The Matchmaking and Lobby features have built in support for real-time
notifications. Notifying players of changes to Matchmaking or Lobby has never
been easier, as the work to handle notifications is done for you. New APIs will
allow connected clients to subscribe for notifications of Lobby and Matchmaking
changes. With this addition, you'll no longer need to poll for changes to
matches or lobbies. 

The SDK has been designed to simplify your work. The SDK manages calls between 
game clients or servers and PlayFab Lobby and Matchmaking services. It handles 
the delivery of notifications from those services to connected clients in real 
time. Real-time notifications have cross-platform support, and will work 
anywhere PlayFab supplies a SDK. Matchmaking and Lobby can be used separately or
together, and real-time notifications will work in either case. There's no
support for real-time notifications without the SDK at this time.
Real-time notifications aren't available as a solution for stand-alone or
general use.

## How do real-time notifications work 

Each client maintains a single WebSocket to receive real-time notifications.
When there are updates to Matchmaking or Lobby resources in the cloud, the
SDK will forward notifications in real-time to all connected clients
subscribed to those resources. 

When a client connects to receive real-time notifications, they'll open a new
WebSocket connection to receive notifications and listen for change events. When
a client creates a lobby, joins a lobby, starts listening for invitations, or
creates a Matchmaking ticket, the connected client will subscribe to a Lobby or
Matchmaking resource to listen for changes. The client will be notified when
there's an update on the resource topic they’ve subscribed to. For example, if a
client has subscribed to a Lobby resource, they may be notified on change events
like Player A or B has joined or left a Lobby. Matchmaking and Lobby
documentation describe in more detail the operations that will power
notifications. 

The WebSocket connection that enables real-time notifications is also used for
detecting client connectivity. This client connectivity status is used by the
Lobby service to power lobby ownership management. 

## Shared connection support

Matchmaking and Lobby notifications have support to share a single WebSocket
connection, which may be useful if you’re creating a title with couch co-op.
Today, up to eight local users may share the WebSocket connection, and local
players can be added or removed to that shared connection. Multiple users
sharing the same connection can subscribe to topics to get notifications for
Matchmaking or Lobby events for those topics. 

## Using the SDK

The SDK simplifies your work for cross-network and cross-platform play by
handling real-time notifications for you. Notifications are sent to clients on
receiving invites, joining and updating lobbies, finding matches, and more. The
SDK enables cross-platform play and real-time notifications on any
platform that PlayFab offers SDK support. Sending notifications to clients is
automatic, and the developer doesn't have to do any work to enable
notifications. 
