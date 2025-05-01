---
title: Linux getting started
author: kdearnley
description: Linux supplement for PlayFab Party quickstart
ms.author: joanlee
ms.date: 08/01/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, party, sdk, sample
ms.localizationpriority: medium
---

# Linux getting started

This document lists the basic prerequisites and requirements necessary to integrate PlayFab Party into your Linux applications. After completing the platform specific steps, see the [Quickstart for PlayFab Party](quickstart.md) to finish getting started with PlayFab Party.

## Prerequisites

Before you start this tutorial, ensure that the following prerequisites are met:

1. Create a [PlayFab developer account](https://developer.playfab.com/).
2. Create a PlayFab Title and [enable the PlayFab Party feature for the title](enable-party.md) in Game Manager.
3. You have access to the [PlayFab Party platforms repository](https://github.com/PlayFab/PlayFabParty).
## Including the required libraries and header files
Include [Party headers](https://github.com/PlayFab/PlayFabParty/tree/master/include)

After downloading the release package for linux, you'll need to link the libparty.so file from the [PlayFab Party distribution repository](https://github.com/PlayFab/PlayFabParty/releases).

Libparty for Linux compiles libssl and libcurl directly into the library to help cope with the OpenSSL and Curl version disparity between distributions.  

> [!NOTE]
> The SSL libs are built from [Open SSL version 1.1.1b](https://github.com/openssl/openssl/tree/OpenSSL_1_1_1-stable). Use an OpenSSL version that is 1.1.1b or higher.


In addition to those headers and lib files, you need the headers and lib files for PlayFab SDK and any other platform-specific dependencies your app needs. 

## Platform dependencies

PlayFab Party for Linux relies on [Pulse Audio](https://www.freedesktop.org/wiki/Software/PulseAudio/), an open source software, for both rendering and capturing streamed audio between network participants.

To compile and link PlayFab Party, your development environment requires the installation of your distributions Pulse Audio development headers and client libraries. Link your application against the appropriate Pulse Audio libraries.

For Ubuntu, install "libpulse-dev" via the apt package manager.
For Manjaro, install "pulseaudio" via the pacman package manager.

Target devices also require the Pulse Audio client libraries to be installed.

## WSL Compatibility

PlayFab Party for Linux isn't intended to run on the Windows Subsystem for Linux (WSL). Run on a dedicated Linux machine to take advantage of all Party features.

## Next steps

Refer to [Quickstart for PlayFab Party](quickstart.md) to finish getting started with PlayFab Party.
