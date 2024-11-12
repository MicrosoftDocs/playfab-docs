---
title: PlayFab Party API Usage Guides
description: How to use the PlayFab Party real-time chat and data communication API in common scenarios.
author: joannaleecy
ms.author: joanlee
ms.date: 08/16/2019
ms.topic: article
ROBOTS: NOINDEX,NOFOLLOW
ms.service: azure-playfab
keywords: playfab, multiplayer, networking
---

# PlayFab Party API Usage Guides

There are two main ways Party can help you: full chat + data transport and as chat sidecar. The following are walk-throughs of code for common scenarios for each usage.

* Leveraging PlayFab Party for data transport and chat
  * Summary.
    * When is this applicable compared to chat sidecar?
  * Scenarios **[TBD]**
* Augmenting your existing data transport with PlayFab Party chat
  * Summary.
    * When is this applicable compared to full transport?
  * Scenarios **[TBD]**
* Scenarios
  * Setup, cleanup, and processing updates
    * -A. Setting memory callbacks and applying thread affinity 
    * -B. Initialization
    * -C. Processing state changes
    * -D. Cleaning up
  * Basic connectivity
    * -E. Creating a local user and its chat control with default audio device
    * -F. Allocating a new network with default QoS and a prepopulated user list
    * -G1/2. Connecting to the new network with a chat control [and endpoint per local user, when using data transport pattern]
    * -H. Adding a user to the ACL, then getting, serializing, and (OOB) sharing, the network descriptor
    * -I. Deserializing a network descriptor
    * -J1/2. Connecting to the existing network with a chat control [and endpoint per local user, when using data transport pattern]
    * -K. Leaving the network
    * -L. Cleaning up
  * Basic communication
    * -M1. [Sending and receiving messages, when using data transport pattern]
    * -N. Enabling voice chat through setting remote chat control permissions
    * -O. Getting chat indicator for display
    * -P. Sending and receive text chat
    * -Q. Enabling speech-to-text transcription and receiving transcribed text
    * -R. Enumerating text-to-speech profiles and selecting one
    * -S. Synthesizing text as speech
    * -T. Muting audio and text
  * Specialized communication
    * -U1. [Creating multiple endpoints for multiple local users, or for separate sequence spaces, when using data transport pattern]
    * -V. Implementing chat for teams vs. global, push-to-talk, or unidirectional broadcast (e.g., announcers)
    * -W. Allocating a network using the best regions from multiple devices, or explicitly excluding regions
