---
title: PlayFab Roadmap
author: thomasgu
description: PlayFab Roadmap
ms.author: thomg
ms.date: 11/15/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---


# Azure PlayFab roadmap

_Last Update: 15 November 2021_

Happy November! Below are the latest roadmap updates for PlayFab. 

We’re committed to being more open about our roadmap so you can make informed planning decisions when integrating with PlayFab. Although this update reflects our current planning, software development roadmap may shift unexpectedly. So features and timelines listed here may still change.

As always, we love hearing from you&mdash;whether you're using PlayFab currently or in development titles. If you see something on this roadmap that's critical to your success or want more information, let us know. PlayFab forum has a [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section that allows you to post, comment, and vote on ideas from our community. 

Addressing issues also remains a high priority for us. If you find issues, file them at [Bugs](https://community.playfab.com/spaces/23/index.html). Thank you for your continued support!

## What’s new 

Find out what's new since our last update in August 2021.

#### User Generated Content (UGC)

Azure PlayFab User Generated Content (UGC) service is now in [Public Preview](https://developer.microsoft.com/games/blog/announcing-azure-playfab-user-generated-content/) after a long Beta period. It's designed to help you jumpstart a creator community within your game, empowering your player base to create, share, and discover content. As the tech powering titles like Minecraft and Microsoft Flight Simulator, UGC has been one of our most highly anticipated services. We want to thank all our private preview partners for all their incredible feedback and patience. We’re thrilled to finally open this solution to the entire PlayFab community.   

To learn more, see [UGC developer documentation](https://docs.microsoft.com/gaming/playfab/features/commerce/ugc/). If you have any feedback, share your thoughts on [PlayFab forums](https://community.playfab.com) or PlayFab channel of our [Game Stack Discord](https://discord.com/invite/gamestack). 

#### Multiplayer Servers

There have also been several updates to Azure PlayFab Multiplayer Servers (MPS).   

- [Unreal Plugin](https://github.com/PlayFab/gsdk/tree/master/UnrealPlugin) updates 
- New Unreal sample and a tutorial: [UnrealThirdPersonMP](https://github.com/PlayFab/MpsSamples/tree/master/UnrealThirdPersonMP)
- New MPS builds overview page and documentation: [Builds overview page](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/build-overview)
- Published a developer tool kit (preview) that enables you to run Linux game servers on a Kubernetes cluster using [PlayFab Game Server SDK (GSDK)](https://github.com/PlayFab/gsdk). For more information, see [Multiplayer Servers on Kubernetes](https://github.com/playfab/thundernetes). 
- A redesigned server page that supports a server lookup facility to query active game servers by server ID, session ID, or connected players. Returned servers allow easy access to VM level metrics, remote connections, archived logs and server allocations/shutdowns. To access the updated server pages, select the servers tab from any game server build. 

We specifically want to call out and thank Stefan Krismann (stkrwork) who contributed to the [Unreal plugin](https://github.com/PlayFab/gsdk/tree/master/UnrealPlugin) work. This helped us move the plugin into preview. 

The latest version of our Multiplayer Servers has been in production for some time. We're now in the process of sunsetting our older legacy Servers. To read more about the process and transition, see [PlayFab sunsetting legacy Multiplayer Servers](https://blog.playfab.com/blog/playfab-sunsetting-legacy-multiplayer-servers)   

#### Perforce cloud deployment tool on Azure

If you are using Perforce and Azure, we have released a new click-to-start solution Perforce cloud deployment tool for Game Creators. To learn more, see [Perforce development tools and services available on Azure](https://blog.playfab.com/blog/perforce-development-tools-and-services-available-on-azure). 

## What's in-progress

Here are some of our active areas of development. The following list is a peek into our PlayFab roadmap, identifying the most significant features we are currently working on. While not comprehensive, this list is intended to provide visibility into our key investments. Features and dates are plan of record at time of posting, availability is subject to change. 

Today we have a few major services in preview:
1. **CloudScript using Azure Functions releasing out of preview** – [CloudScript Functions](https://docs.microsoft.com/gaming/playfab/features/automation/cloudscript-af/) brings support for [new languages](https://docs.microsoft.com/azure/azure-functions/supported-languages) (including C#). It also supports local debugging in Visual Studio and Visual Studio Code. CloudScript Functions is exiting preview for a full release soon.
1. **PlayFab Matchmaking** is available in [Public Preview](../features/multiplayer/matchmaking/index.md) right now. It's designed to help you better match players together based on stats and player attributes. Check it out today!
1. **Event Sampling** is now available in private preview. It allows more granular control of PlayStream and data ingestion for more cost savings. If you are interested in looking more closely at Event Sampling, reach out to your account manager, or contact us at myplayfabam@microsoft.com.

PlayFab provides updates and new features in the form of preview programs to give you the opportunity to evaluate them before they become part of our standard service or offering. If you're interested to join our preview programs, contact your account manager or email us at myplayfabam@microsoft.com. Our preview terms of use are modeled after [Azure Preview Terms of Use](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

## What's on-deck

- Bring Your Own (BYO) Data Storage: We'll be introducing the ability to write PlayStream and telemetry events to your own storage account. 
- PlayFab Matchmaking - We are working on adding real-time notifications to avoid polling the ticket status and integration with a new Lobby feature. This is in private preview now targeting public preview in the first part of 2022.
- Lobby: A new feature that allows for temporary grouping of players to orchestrate multiplayer experiences, including searching for available lobbies to join. It includes member properties, and lobby and search properties to use for gameplay coordination. Targeting private preview later this year. Lobby is in private preview now and targeting public preview in the first part of 2022.
- Leaderboards v2: Leaderboards v2 is still in private preview with select customers. We still plan to prioritize more critical feature areas based on feedback in near term. The current plan is that we'll re-engage the development of Stats & Leaderboards v2 in early 2022. 
- Economy V2: The rest of the Economy v2 is targeting public preview in March 2022. This includes player inventories and wallets, receipt validation on the most popular marketplaces, bundles, stores, and more. 
- Segmentation: As we continue to support segments, we'll be making it easier to define segments using a fixed list of players. 

Finally, PlayFab Leadership is hosting a series of ‘Outside-In’ sessions where we have customers come meet with our team to help us understand your needs and goals. If you're interested in participating, reach out to us at PFOutsideInRequest@microsoft.com  

Thank you to all our amazing game creators building with PlayFab today. None of this would be possible without you. Keep the feedback coming! 
