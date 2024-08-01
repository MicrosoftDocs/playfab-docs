---
title: PlayFab Online Subsystem (OSS) Dedicated Server Setup
description: Guidance on how to set up Dedicated Servers for your project.
author: SahilAshar
ms.author: saashar
ms.date: 02/15/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, ue4, ue5, middleware
---

# Quickstart Guide: Dedicated Server Setup with the PlayFab Online Subsystem

This guide is to help you prepare your PlayFab Online Subsystem (OSS) integrated game, and validate it in dedicated server scenarios. This guide focuses on validation with locally hosted dedicated servers.

PlayFab OSS defaults to using PlayFab Party Sockets for communication in player-hosted scenarios. However, in server-hosted scenarios, PlayFab Party Sockets will fail to connect, and the game will need to explicitly call `ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)` in order to communicate to the server.

PlayFab OSS recognizes when a client is connecting to a dedicated server and falls back to using the native `PLATFORM_SOCKETSUBSYSTEM` for client to server communication.

## Prerequisites
- A game that has integrated [PlayFab Online Subsystem](party-unreal-engine-oss-overview.md) and is able to create client-hosted scenarios.
- A "client" PC you can use as a connecting client for your game.
- A "server" PC you can use as a hosting server for your game.
  - A second PC is recommended, but you can use the same one, a virtual machine instance, or a Docker instance if you'd prefer. This quickstart guide walks you through setup with a second PC.
  - Ensure that the IP address of your second PC is network-accessible from your first PC.

## Setup

### Dedicated Server Setup for Unreal Engine (UE) 5
The UE 5 [Dedicated Server Guide](https://docs.unrealengine.com/5.3/en-US/setting-up-dedicated-servers-in-unreal-engine/) walks you through how to package your game as a dedicated server, using UE's Lyra Game as the primary example.

### Dedicated Server Setup for Unreal Engine (UE) 4
The UE 4 [Dedicated Server Guide](https://docs.unrealengine.com/4.27/en-US/InteractiveExperiences/Networking/HowTo/DedicatedServers/) walks you through how to package your game as a dedicated server, using UE's Shooter Game as the primary example.

### Additional Setup
- Once you configure your game's `<Game>Server.Target.cs`, ensure you're able to generate binaries for your game's `WindowsClient` and `WindowsServer` flavors.
- Move your `<Game>Server.exe` binary from `Binaries/Win64/` to anywhere on your second PC.

## Connection

### Deploying the Server
1. Open a terminal on the second PC in the directory where `<Game>Server.exe` is located.
```ps
PS  C:\WindowsServer\ >
```

2. Launch your dedicated server.
```ps
PS  C:\WindowsServer\ > .\<Game>Server.exe <map> -log –NOSTEAM
```
- The `-NOSTEAM` arg disables the default OSS for the game (OSS PlayFab in this case) and replaces it with `OnlineSubsystemNull`.
- The `-log` arg opens a separate window to display the contents of the logs in real time.
- For more info on UE's CLI arguments, visit [Unreal Engine's Command Line Arguments](https://docs.unrealengine.com/4.27/en-US/ProductionPipelines/CommandLineArguments/) documentation.

A separate window will appear with UE logs confirming that a server spawned. Ensure that the logs contain these lines:
```log
LogOnline: Warning: PLAYFAB: PlayFab API disabled!
LogOnline: Display: PLAYFAB: OnlineSubsystemPlayFab::Shutdown()
LogOnline: Verbose: PLAYFAB: FOnlineSubsystemPlayFab::CleanUpPlayFab PartyInitialized 0, LobbyInitialized 0
LogOnline: Verbose: PLAYFAB: FOnlineSubsystemPlayFab::UnregisterNetworkInitCallbacks
```
These logs indicate that OSS PlayFab is correctly disabled on the dedicated server.

### Connecting the Client
1. Open a terminal on the first PC in the directory where `<Game>Client.exe` is located.
```ps
PS  C:\WindowsClient\ >
```

2. Launch your game client.
```ps
PS C:\WindowsClient\ > .\<Game>Client.exe <ipaddress_of_server_machine>:7777 -log
```
- The default port of a dedicated server is usually 7777. If you run into connection errors, ensure that the server is deploying on the correct port, or change your connection command to match that port.

A game client will appear and connect to the game started on the server. You should see logs in the dedicated server's log window indicating that a client joined.



