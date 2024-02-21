---
title: PlayFab Online Subsystem (OSS) Dedicated Server Setup
description: Guidance on how to set up Dedicated Servers for your project.
author: SahilAshar
ms.author: saashar
ms.date: 02/15/2024
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, ue4, ue5, middleware
---

# Quickstart Guide: Dedicated Server Setup with OnlineSubsystem PlayFab

This guide is to help you set up and prepare your game to use dedicated servers alongside OnlineSubsystem (OSS) PlayFab.

## Prerequisites
- A version of your game has been previously set up and capable of default client to client communication and gameplay with OSS PlayFab.
- An "client" PC you can use as a connecting client for your game.
- A "server" PC you can use as a hosting server for your game.
  - A second PC is recommended, but you may use the same one, VM instance, or Docker instance if you'd prefer. This quickstart guide will walk you through setup with a second PC.

## Setup

### Dedicated Server Setup for Unreal Engine (UE) 5
The UE 5 [Dedicated Server Guide](https://docs.unrealengine.com/5.3/en-US/setting-up-dedicated-servers-in-unreal-engine/) walks you through how to package your game as a dedicated server, using UE's Lyra Game as the primary example.



