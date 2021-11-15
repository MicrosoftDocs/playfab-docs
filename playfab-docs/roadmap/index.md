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

_Last Update: 11/15/2021_

Happy November! Below are the latest roadmap updates for PlayFab. As always, we welcome your feedback. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums. And as always, thank you for your continued support!

We’re committed to being more open about our roadmap so that you can count on PlayFab to support your games in development and operation, but the realities of software development may shift or change the features and/or the timing that are in this roadmap update. While this update reflects our current planning, features and timelines may change. 

We also love hearing from game creators that are using PlayFab for their current or in development titles, so if you see something on this roadmap that is critical to your success or that you want more information on please let us know!

## What’s New (since our last update in August):

We shipped our User Generated Content Service (UGC for short) into [Public Preview](https://developer.microsoft.com/games/blog/announcing-azure-playfab-user-generated-content/). Long in Beta, UGC is designed to help you jumpstart a creator community within your game, empowering your player base to create, share, and discover content. As the tech powering titles like Minecraft and Microsoft Flight Simulator, Azure PlayFab UGC has been one of our most highly anticipated services. We want to thank the incredible feedback from all our extremely patient private preview partners, and we’re thrilled to finally open this solution to the entire PlayFab community.   

You can read more about UGC here: [https://docs.microsoft.com/gaming/playfab/features/commerce/ugc/](https://docs.microsoft.com/gaming/playfab/features/commerce/ugc/) and if you have any feedback please make sure to share your thoughts and issues with us on the PlayFab channel of our [Game Stack Discord](https://discord.com/invite/gamestack). 

There have also been several updates to Multi-Player Services, including:   

- Updates to our [Unreal Plugin](https://github.com/PlayFab/gsdk/tree/master/UnrealPlugin)  
- There is a new Unreal sample and a tutorial on utilizing the GSDK: [https://github.com/PlayFab/MpsSamples/tree/master/UnrealThirdPersonMP](https://github.com/PlayFab/MpsSamples/tree/master/UnrealThirdPersonMP)
- We have updated our documentation around MPS builds overview: [https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/build-overview](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/build-overview)
- We published a preview of a developer tool kit that enables you to run Linux game servers that use the [PlayFab Game Server SDK (GSDK)](https://github.com/PlayFab/gsdk) on a Kubernetes cluster.  Visit https://github.com/playfab/thundernetes for more information. 
- A redesigned server page supports a server lookup facility to query active game servers by server ID, session ID or connected players.  Returned servers allow easy access to VM level metrics, remote connections, archived logs and server allocations or shutdowns.  To access the updated server pages, select the servers tab from any game server build. 

We specifically want to call out thanks to Stefan Krismann (stkrwork) who helped contribute to putting the unreal plugin into preview: https://github.com/PlayFab/gsdk/tree/master/UnrealPlugin  

The latest version of our Multiplayer Servers has been in production for some time, and so we are in the process of sunsetting our older legacy Servers – you can read more about the process and transition here: https://blog.playfab.com/blog/playfab-sunsetting-legacy-multiplayer-servers   

Finally - if you are using Perforce and Azure you should take a close look at the tools that have been released for Game Creators: https://blog.playfab.com/blog/perforce-development-tools-and-services-available-on-azure   

## What's In-Progress

Here are some of our active areas of development. The following list is a peek into our PlayFab roadmap, identifying the most significant features we are currently working on. While not comprehensive, this list is intended to provide visibility into our key investments. Note that while these features and dates are plan of record at time of posting, availability is subject to change. 

Today we have a few major services in preview:
1. **CloudScript using Azure Functions releasing out of preview** – [CloudScript Functions](https://docs.microsoft.com/gaming/playfab/features/automation/cloudscript-af/) brings support for [new languages](https://docs.microsoft.com/azure/azure-functions/supported-languages) (including C#) as well as local debugging in Visual Studio and Visual Studio Code. CloudScript Functions is exiting preview for a full release soon.
1. **User Generated Content (UGC)** – After feedback with private preview customers, we are working on cleaning up and preparing our Economy v2 APIs for Public Preview, starting with UGC. UGC is slated for Public Preview very soon (September).
1. **PlayFab Matchmaking** – This is available in [Public Preview](../features/multiplayer/matchmaking/index.md) right now, and is designed to help you better match players together based on stats and player attributes. Check it out today!
1. **Event Sampling** - Is now available in private preview, allowing you to finely control PlayStream and telemetry ingestion for more granular control and cost savings. If you are interested in looking more closely at Event Sampling, please reach out to your account manager, or contact us at myplayfabam@microsoft.com 

PlayFab provides updates and new features in the form of preview programs to give you the opportunity to evaluate them before they become part of our standard service or offering. If you're interested to join our preview programs, contact your account manager or email us at myplayfabam@microsoft.com. Our preview terms of use is modelled after [Azure Preview Terms of Use](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

## What's On-Deck

- BYO Data Storage – We will be introducing the ability to write PlayStream and telemetry events to your own storage account. 
- PlayFab Matchmaking - We are working on adding real time notifications to avoid polling the ticket status as well as integration with a new Lobby feature, targeting private preview later this year. 
- Lobby – A new feature that allows for temporary grouping of players for the purpose of orchestrating multiplayer experiences, including searching for available lobbies to join. It includes member properties, as well as lobby and search properties to use for gameplay coordination. Targeting private preview later this year. 
- Leaderboards v2 – We mentioned last update that, although Leaderboards v2 is in private preview with select customers, we chose to prioritize other more critical feature areas based on feedback near term. We still plan to re-engage in the development of Stats & Leaderboards v2 in early 2022. 
- Economy V2 - The rest of the Economy v2 - including player inventories and wallets, receipt validation on the most popular marketplaces, bundles, stores, and more - are targeted to release into public preview Spring 2022. 
- Segmentation – As we continue to support segments, we will be making it easier to define segments comprising fixed list of players. 

Finally, PlayFab Leadership is hosting a series of ‘Outside-In’ sessions where we have customers come meet with our team to help us understand your needs and goals. If you are interested in participating, please reach out to us at :PFOutsideInRequest@microsoft.com  

Thank you to all our amazing game creators building with PlayFab today. None of this would be possible without you. Please keep the feedback coming! 
