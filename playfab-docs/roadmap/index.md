---
title: PlayFab Roadmap
author: thomasgu
description: PlayFab Roadmap
ms.author: thomg
ms.date: 03/17/2022
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---


# Azure PlayFab roadmap

_Last Update: 23 March 2022_

While Microsoft has a digital-only presence at GDC this year, our commitment to serving the game development community is as strong as ever. The PlayFab team has put together some exciting updates to share around our Multiplayer Services, Party, Experiments, Data Platform, and User Generated Content (UGC) services. We have new demos, technical talks and documentation that will help you dive deep into each update. 

Make sure you visit our [GDC Page](https://developer.microsoft.com/games/events/gdc/) and we highly recommend you follow our [Microsoft Game Dev](https://twitter.com/msftgamestack) twitter handle for the latest news on game development.  

Before sharing our first roadmap update for 2022, this is a reminder that we welcome your feedback and would love to hear from you. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums. Thank you for your continued support! 

We love hearing from game creators that are using PlayFab for their current or in-development titles. If you see something on this roadmap that is critical to your success or that you want more information on, let us know! 

PlayFab Leadership is still hosting our series of ‘Outside-In’ sessions where we have customers come meet with our team to help us understand your needs and goals. If you're interested in participating, reach out to us at: PFOutsideInRequest@microsoft.com

## What’s new

- **Data Connections (formally Bring Your Own Storage):** We're introducing the ability to write PlayStream and telemetry events to your own storage account. With the ability to export data from PlayFab to your own data storage of choice, you'll be able to take advantage of Azure services and have full control over your data in terms of access, scale, latency, retention and privacy. This feature enters Public Preview this week. You can read about the release in our blog here [Take control of data in your resources using Data Connections ](https://blog.playfab.com/blog/take-control-of-data-in-your-resources-using-data-connections)
- **Matchmaking:** We're adding real time notifications to avoid polling the ticket status and integration with a new Lobby feature. The updated client SDK for Matchmaking with real-time notifications is **now available to everyone in public preview**. Please take a look at our Matchmaking documentation [here](../features/multiplayer/matchmaking/index.md) and download the SDK today to try it out. Also take a look at our new ID@Azure program announced [here](https://developer.microsoft.com/games/blog/introducing-idatazure-your-journey-in-the-cloud-starts-today) where signing up has benefits including use of this new service at no cost for most games. 
- **Lobby:** A new feature that allows for temporary grouping of players for orchestrating multiplayer experiences, including searching for available lobbies to join. It includes member properties, as well as lobby and search properties to use for gameplay coordination. The new Lobby service with real-time notifications is **now available to everyone in public preview**. Please take a look at our Lobby documentation [here](../features/multiplayer/lobby/index.md) and download the SDK today to try it out. Also take a look at our new ID@Azure program announced [here](https://developer.microsoft.com/games/blog/introducing-idatazure-your-journey-in-the-cloud-starts-today) where signing up has benefits including use of this new service at no cost for most games.
- **UGC into full release (GA):** We've movied UGC out of public preview and into full release (GA). In addition to various API tweaks and bug fixes, we’ve added Game Manager improvements and features to help developers better manage their User Generated Content catalog. Read more about UGC here: [PlayFab User Generated Content](../features/commerce/ugc/index.md).

## What's on-deck

- **Leaderboards v2:** Leaderboards v2 remains in private preview for now.
- **Economy V2 Public Preview coming in third quarter of 2022!** Player inventories and wallets, receipt validation on the most popular marketplaces, bundles, stores, currencies and more.
- **Segmentation:** We'll be introducing a new API called __ExportPlayersInSegment__ into a beta release as an enhancement to the existing __GetPlayersInSegment__ API. Also, We'll be making it easier to define segments comprising a fixed list of players.  

## What's been released (since our last update in October)

- **CloudScript Functions is now fully available on Azure:** The new and improved CloudScript Functions is now fully available and fully on Azure. To learn more, see [Cloudscript Using Azure Functions](https://blog.playfab.com/blog/announcing-cloudscript-using-azure-functions-is-now-ga) blog post and [Getting Started](../features/automation/cloudscript-af/quickstart.md). 
- **Event Sampling Private Preview:** Late last year we released Event Sampling into private preview. It allows for more granular control over both your PlayStream events and Data Ingestion. To learn more, see [Managing Your Events with Event Sampling](https://blog.playfab.com/blog/manage-events-with-sampling-on-azure-playfab) blog post and [Manage Events quickstart](../features/data/manage-events-with-sampling/quickstart.md).
- **Unreal GSDK Plugin:** We have a new GSDK plugin that makes it easier to upload your Unreal build to Multiplayer Servers (MPS). To learn more, see [New Unreal GSDK Plugin simplifies Azure MPS deployment](https://blog.playfab.com/blog/new-unreal-gsdk-plugin-simplifies-azure-mps-deployment) blog post and [Getting started](../features/multiplayer/servers/server-sdks/unreal-gsdk/index.md).
- **New How-to:** We published a new article on how to attach a profiler and debug your MPS Game Servers. To get started, see [Attach a profiler](../features/multiplayer/servers/attaching-a-profiler.md).
- **Auto Crash Dumps:** We’ve added the ability to enable automatic crash dumps on Windows container-based MPS Game Servers. For documentation, see [Crash Dump Collection](../features/multiplayer/servers/crash-dump-collection.md).
- **UGC SDK:** In November we released the updated SDK that supports our Azure PlayFab UGC Public Preview. You can read more about this new set of services and learn how to jumpstart a creator community within your game. For the blog post announcement, see [Announcing Azure PlayFab User Generated Content (Public Preview)](https://blog.playfab.com/blog/announcing-azure-playfab-user-generated-content-public-preview/).
Finally, if your game is running on GameSparks and you’re looking for an alternative solution, our services are ready to use, regardless of what engine, platform, or store you currently have integrated with. If you are struggling with the path forward, our partners [Alice and Smith](https://www.xrserver.com/migrate) and [GameCloud](https://www.gamecloudnet.com/) are available to help you migrate. For more information, see [GameSparks to Azure PlayFab Migration](https://playfab.com/gamesparks-to-playfab/). To connect with us, find us on [Discord Server](https://aka.ms/msftgamedevdiscord) #migrate-to-playfab.

Thank you to all our amazing game creators building with PlayFab today. None of this would be possible without you. Keep the feedback coming! 
