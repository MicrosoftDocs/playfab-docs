---
title: Linux getting started
author: kdearnley
description: Linux supplement for PlayFab Party quickstart
ms.author: joanlee
ms.date: 08/01/2022
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, networking, party, sdk, sample
ms.localizationpriority: medium
---

# Linux getting started

This document lists the basic prerequisites and requirements necessary to integrate PlayFab Party into your Linux applications. After completing the platform specific steps, see the [Quickstart for PlayFab Party](quickstart.md) to finish getting started with PlayFab Party.

## Prerequisites
Before you start this tutorial, ensure that the following prerequisites have been met:

1. You've created a [PlayFab developer account](https://developer.playfab.com/)
2. You've created a PlayFab Title and your title has been allow-listed for PlayFab Party
3. You have access to the [PlayFab Party platforms repository](https://github.com/PlayFab/PlayFabParty)
## Including the required libraries and header files

After downloading the release package for linux, you'll need to link the following library files from the [PlayFab Party distribution repository] (https://github.com/PlayFab/PlayFabParty/releases).

1. libparty.so

Libparty for Linux compiles libssl and libcurl directly into the library to help cope with the OpenSSL and Curl version disparity between distributions.  

> [!NOTE]
> The SSL libs are built from [Open SSL version 1.1.1b](https://github.com/openssl/openssl/tree/OpenSSL_1_1_1-stable). Use an OpenSSL version that is 1.1.1b or higher.


Header includes

[Party headers](https://github.com/PlayFab/PlayFabParty/tree/master/include)

In addition to the lib files and headers above, you'll also need the libs and headers for PlayFab SDK and any other platform-specific dependencies your app needs. 

## Platform dependencies

PlayFab Party for Linux relies on [Pulse Audio](https://www.freedesktop.org/wiki/Software/PulseAudio/), an open source software, for both rendering and capturing streamed audio between network participants.

To compile and link PlayFab Party, your development environment will require the installation of your distributions Pulse Audio development headers and client libraries.  Link your application against the appropriate Pulse Audio libraries.

For Ubuntu, install "libpulse-dev" via the apt package manager.
For Manjaro, install "pulseaudio" via the pacman package manager.

Target devices will also require the Pulse Audio client libraries to be installed.

## Next steps

Refer to [Quickstart for PlayFab Party](quickstart.md) to finish getting started with PlayFab Party.
