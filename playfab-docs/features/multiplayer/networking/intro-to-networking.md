---
title: Introduction to PlayFab Multiplayer Networking and Chat
author: v-thopra
description: Introduces the concepts and APIs for PlayFab networking.
ms.author: v-thopra
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
ms.localizationpriority: medium
---

# Introduction to PlayFab Multiplayer Communication Fabric

PlayFab Multiplayer Communication Fabric is a set of libraries and services for easily adding multiplayer real-time networking and chat communication to your game. 

Multiplayer games are typically one of two designs: authoritative and non-authoritative. Authoritative games have a central authority for game state, this may be a player device or [a cloud-hosted dedicated server](http://aka.ms/PlayFabCompute). Non-authoritative designs require player devices to synchronize game state cooperatively over a peer-to-peer network.

COFA networks are an ideal, secure, low-latency transport for non-authoritative designs and authoritative designs where a cloud-hosted dedicated server is not desired. COFA is also well-suited to add voice and text communication to non-gameplay social experiences your app may provide (e.g. an in-game squad experience, or post-game lobbies).

COFA utilizes Azure Cognitive Services to transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide. Typical usage of COFA voice chat [is billed on a per-minute basis](pricing.md), and up to 10% of those voice minutes can leverage transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access player setting.

COFA can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience. 

## Concepts

COFA is oriented around a few key concepts:

- `Network` - A logical representation of a set of interconnected devices participating in a particular multiplayer experience, as well as basic state describing that collection. 
- `Endpoint` - A facility associated with a device that can recieve data from other devices and is the source for sending data to other devices.
- `Network_state_change` - A structure representing a notification to the local device regarding an asynchronous change in some aspect of the network.
- `StartProcessingStateChanges` and `FinishProcessingStateChanges` - The pair of methods called by the app every UI frame to perform asynchronous operations, to retrieve results to be handled in the form of state_change structures, and then to free the associated resources when finished.

At a very high level, the game application uses the PlayFab networking library to configure a set of users signed-in on the local device to be moved into a PlayFab network. The app calls `StartProcessingStateChanges()` and `FinishProcessingStateChanges()` every UI frame. As app instances on remote devices add their users into a network, every participating instance is provided state_change updates describing the local and remote devices joining that  network. When a player stops participating in the  network (gracefully or due to network connectivity problems), state_change updates are provided to all app instances indicating the user and associated endpoints have  left.

As opposed to a client-server model, a PlayFab network is logically a fully-connected mesh of peer devices. As described in the section of this document, any player can send directly to any other through the API. 

## Features

|-|Run-time management|Networking|
|-|-|-|
|Available Now| - Create a network descriptor<br>Join network via descriptor | - Create endpoints for sending/receiving data<br> - Reliable and unreliable send options <br> - Message colescing and queue flushing  | 
|Coming Soon| - Xbox Live authentication <br> - Steam authentication <br> Add/remove users to access control list <br> - Modify joinability policy | - Coordinate host state with the authority object<br> - Encryption|


|-|Chat|Performance|Service administration|
|-|-|-|-|
|Available Now| - Activate voice chat <br> - Interrogate audio device <br> - Per-user mute/unmute controls  | - All async processing conveniently handled via state changes <br> - Custom memory allocator  |
|Coming Soon| - Text Chat <br> - Speech to Text transcription<br>| - Hardware chat acceleration (Xbox)| - Region configuration via Game Manager|
