---
title: PlayFab Roadmap
author: thomasgu
description: PlayFab Roadmap
ms.author: thomg
ms.date: 03/17/2023
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---


# Azure PlayFab roadmap

_Last Update: 28 October 2021_

While Microsoft will have a digital-only presence at GDC this year, our commitment to serving the game development community is as strong as ever. The PlayFab team has put together some exciting updates to share around our Multiplayer Services, Party, Experiments, Data Platform, and our User Generated Content (UGC) service. We have new demos, technical talks and documentation that will help you dive deep into each update. 

Make sure you visit our [GDC Page](https://developer.microsoft.com/games/events/gdc/) and we highly recommend you follow our Microsoft Game Dev twitter handle [Microsoft Game Dev](https://twitter.com/msftgamestack) for the latest news on game development.  

Before sharing our first roadmap update for 2022, this is a reminder that we welcome your feedback and would love to hear from you. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums. Thank you for your continued support! 

We also love hearing from game creators that are using PlayFab for their current or in-development titles, so if you see something on this roadmap that is critical to your success or that you want more information on, please let us know! 

PlayFab Leadership is still hosting our series of ‘Outside-In’ sessions where we have customers come meet with our team to help us understand your needs and goals. If you are interested in participating, please reach out to us at:PFOutsideInRequest@microsoft.com  

## What’s New With PlayFab:

- **Data Connections (formally Bring Your Own Storage):** We will be introducing the ability to write PlayStream and telemetry events to your own storage account. With the ability to export data from PlayFab to their own data storage of choice, customers will be able to take advantage of Azure services and will have full access and control over their data in terms of access, scale, latency, retention and privacy. Already in Private Preview, expect more news on this feature in the near future.
- **Matchmaking:** We are working on adding real time notifications to avoid polling the ticket status as well as integration with a new Lobby feature.  The updated client SDK for Matchmaking with real-time notifications is in private preview now with public preview targeting later this spring. 
- **Lobby:** A new feature that allows for temporary grouping of players for the purpose of orchestrating multiplayer experiences, including searching for available lobbies to join. It includes member properties, as well as lobby and search properties to use for gameplay coordination. Lobby is in private preview now with public preview targeting later this spring.
- **UGC into full release (GA) this quarter:** We also plan to move UGC out of public preview and into full release (GA) this quarter. In addition to various API tweaks and bug fixes, we’ve added Game Manager improvements and features to help developers better manage their User Generated Content catalog.

## What's On-Deck:

- **Leaderboards v2:** Leaderboards v2 remains in private preview for now.
- **Economy V2 Public Preview Coming Summer 2022!** Player inventories and wallets, receipt validation on the most popular marketplaces, bundles, stores, currencies and more.
- **Segmentation:** As we continue to support segments, we will be introducing a new API called ExportPlayersInSegment in a beta release as an enhancement to the existing GetPlayersInSegment API. Also, we will be making it easier to define segments comprising a fixed list of players.  

## What's Been Released (since our last update in October):

- **Cloudscript Functions are now fully available on Azure:** The new and improved Cloudscript Functions are now fully available and fully on Azure – read about [Cloudscript Using Azure Functions](https://blog.playfab.com/blog/announcing-cloudscript-using-azure-functions-is-now-ga) and follow our guide for [Getting Started](https://docs.microsoft.com/en-us/gaming/playfab/features/automation/cloudscript-af/quickstart) 
- **Event Sampling Private Preview:** Late last year we released Event Sampling into private preview. It allows for more granular control over both your PlayStream events and Data Ingestion. You can read about [Managing Your Events with Event Sampling](https://blog.playfab.com/blog/manage-events-with-sampling-on-azure-playfab) and if you want to get started you can follow the Quickstart Guide [Here](https://docs.microsoft.com/gaming/playfab/features/data/manage-events-with-sampling/)   
- **Unreal GSDK Plugin:** We have a new GSDK plugin that makes it easier to upload your Unreal build to MPS. See our announcement [Here](Https://blog.playfab.com/blog/new-unreal-gsdk-plugin-simplifies-azure-mps-deployment) - You can also check out our [Getting started documentation](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/server-sdks/unreal-gsdk/) 
- **New How To:** We published a new article on how to attach a profiler and debug your MPS Game Servers – [Read all about it!](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/attaching-a-profiler)
- **Auto Crash Dumps:** We’ve added the ability to enable automatic crash dumps on Windows container-based MPS Game Servers. Check out our documentation: [Crash Dump Collection](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/crash-dump-collection)
- **UGC SDK:** In November we released the updated SDK that supports our Azure PlayFab UGC Public Preview. You can read more about this new set of services [Here](https://blog.playfab.com/blog/announcing-azure-playfab-user-generated-content-public-preview/) and learn how to jumpstart a creator community within your game, empowering your player base to create, share, and discover User Generated Content. 

Finally, if your game is running on GameSparks and you’re looking for an alternative solution, our services are ready to use, regardless of what engine, platform, or store you currently integrate with. And if you are struggling with the path forward, our partners [Alice and Smith](https://www.xrserver.com/migrate) and [GameCloud](https://www.gamecloudnet.com/) are available to help you migrate. You can find more information at our [GameSparks to Azure PlayFab Migration](https://playfab.com/gamesparks-to-playfab/) page, or feel free to connect with us in our [Discord Server](https://discord.com/invite/gamestack) #migrate-to-playfab.

Thank you to all our amazing game creators building with PlayFab today. None of this would be possible without you. Keep the feedback coming! 
