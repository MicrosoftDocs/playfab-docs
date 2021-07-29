---
title: PlayFab Roadmap
author: thomasgu
description: PlayFab Roadmap
ms.author: thomg
ms.date: 04/09/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---


# Azure PlayFab roadmap

_Last Update: 07/30/2021_

Below are the latest roadmap updates for PlayFab. As always, we welcome your feedback. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums. And as always, thank you for your continued support!

>[!Note]
> We’re committed to being more open about our roadmap so that you can count on PlayFab to support your games in development and operation, but the realities of software development may shift or change the features and/or the timing that are in this roadmap update. While this roadmap reflects our aspirations, future facing features and timelines are subject to change.
> We love hearing from game creators that are using PlayFab for their current or in development titles, so if you see something on this roadmap that is critical to your success or that you want more information on please let us know!.

## What’s New (since our last update in April):

We’ve made several updates in PlayFab Multiplayer Services and in GameManager over the last quarter that we want to call out:

- To help you estimate your PlayFab Multiplayer Services usage and costs, we now have an [MPS calculator](https://playfab.com/mps-calculator/) available to help you estimate your monthly charges. This works much like the [Party cost estimator](https://playfab.com/party-calculator/) and is available from our [main pricing page](https://playfab.com/pricing/).
- Multiplayer Servers new build page has a number of new features, including UI for enabling process based servers, adding or deleting existing game server assets, enabling read-only assets and enabling streaming asset downloads.
- The Game Manager experience for PlayFab Multiplayer Servers (MPS) was updated to clarify free usage scenarios in evaluation mode. If you want to know more about the free usage tier please refer to our [Billing for PlayFab Multiplayer Servers 2.0](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/billing-for-thunderhead) documentation.
- We revamped and updated our quick-start documentation for MPS in Game Manager. Check out the [getting started documentation](https://docs.microsoft.com/gaming/playfab/features/multiplayer/mpintro) under PlayFab Multiplayer. 

- Greatly expanded our PlayFab Multiplayer Servers (MPS) regional footprint in the [US and Asia](https://blog.playfab.com/blog/azure-playfab-multiplayer-servers-adds-new-regions-in-asia-and-us-to-reduce-player-latency-and-give-multiplayer-games-even-more-choice)
- Added support for [AMD SKUs](https://blog.playfab.com/blog/azure-playfab-multiplayer-servers-includes-free-monthly-amd-vms-usage-evaluation) to provide a better price/performance ratio for multiplayer optimized virtual machines
- New API endpoints for self-servicing quota requests and updating service build names. For details, see the [API documentation](/rest/api/playfab/multiplayer/multiplayerserver) 

Over the last year we migrated PlayStream (our gaming event pipeline) to a modernized cloud native architecture with fully managed Azure Services. Now, PlayStream is powered by [Azure Kubernetes Service](https://azure.microsoft.com/services/kubernetes-service/), [Event Hubs](https://azure.microsoft.com/services/event-hubs/) and [Cosmos DB](https://azure.microsoft.com/services/cosmos-db/). Modernizing our architecture isn’t the usual thing we hype on our roadmap, but in this case, it’s allowing us to bring key savings and increased reliability to you, our customers. You can read more about our journey in this article: [PlayFab’s PlayStream now powered by Azure](https://blog.playfab.com/blog/playfabs-playstream-bids-farewell-to-aws-now-powered-by-azure).

We added a few new tutorials to Game Manager:
- Wrapping GSDK support for Linux (see [documentation](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/create-your-first-server) and [GitHub repo](https://github.com/PlayFab/MpsSamples/tree/master/MpsAllocatorSample)
- Test runner utility for easy calls to MPS APIs (see [documentation](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/mps-allocator-sample) and [GitHub repo](https://github.com/PlayFab/MpsSamples/tree/master/MpsAllocatorSample))

We’ve been working on a few community events;  [Game Stack Live](https://developer.microsoft.com/games/events/game-stack-live/) was in April and we recorded and made available on demand all of our PlayFab specific talks:
- Using PlayFab Party to Integrate Networking and Voice Into Your Game: https://www.youtube.com/watch?v=z40-nBJsc74
- Case Study: How Minecraft Ported Realms to Azure: https://www.youtube.com/watch?v=BnQUfat6x1Q
- PlayFab Multiplayer Hosted Servers part 1: Multiplayer Servers Quick Start: https://www.youtube.com/watch?v=kj2TcMlvWgk 
- PlayFab Multiplayer Hosted Servers part 2: Foundations for Scaling Game Server Resources: https://www.youtube.com/watch?v=Jj5kVCUmvlY 
- Case Study: How Flight Sim Built a Cloud-native Living World Thanks to Azure: https://www.youtube.com/watch?v=da_7LGxWKMM

Our newest addition to the suite of PlayFab Party inclusiveness features is [Party Text Moderation](https://docs.microsoft.com/gaming/playfab/features/multiplayer/networking/concepts-text-moderation)! With moderation, you can significantly reduce bullying and toxicity in your gaming community and increase average playtime and player retention. Turning on Party Text Moderation only requires one line of code! 

## What's In-Progress
Here are some of our active areas of development. The following list is a peek into our PlayFab roadmap, identifying the most significant features we are currently working on. While not comprehensive, this list is intended to provide visibility into our key investments. Note that while these features and dates are plan of record at time of posting, availability is subject to change.

Today we have a few major services in preview:
1. **Azure Functions Integration** – This is a replacement to our current cloudscript solution. [CloudScript using Azure Functions](../features/automation/cloudscript-af/index.md) brings support for [new languages](/azure/azure-functions/supported-languages) (including C#) as well as local debugging in Visual Studio and Visual Studio Code. Azure Functions is in Public Preview.
1. **User Generated Content (UGC)** – After feedback with private preview customers, we are working on cleaning up and preparing our Economy v2 APIs for Public Preview, starting with UGC. UGC is slated for Public Preview very soon (September).
1.	**PlayFab Matchmaking** – This is available in [Public Preview](../features/multiplayer/matchmaking/index.md) right now, and is designed to help you better match players together based on stats and player attributes. Check it out today!
1.	**Event Sampling** - Is now available in private preview, allowing you to finely control PlayStream and telemetry ingestion for more granular control and cost savings. If you are interested in looking more closely at Event Sampling, please reach out to your account manager, or contact us at myplayfabam@microsoft.com 

PlayFab provides updates and new features in the form of preview programs to give you the opportunity to evaluate them before they become part of our standard service or offering. If you're interested to join our preview programs, contact your account manager or email us at myplayfabam@microsoft.com. Our preview terms of use is modelled after [Azure Preview Terms of Use](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

## What's On-Deck

- PlayFab Matchmaking - We are working on adding real time notifications to avoid polling the ticket status as well as integration with a new Lobby feature, targeting private preview later this year.
- Lobby – A new feature that allows for temporary grouping of players for the purpose of orchestrating multiplayer experiences, including searching for available lobbies to join. It includes member properties, as well as lobby and search properties to use for gameplay coordination. Targeting private preview later this year.
- Leaderboards v2 – We mentioned last update that, although Leaderboards v2 is in private preview with select customers, we chose to prioritize other more critical feature areas based on feedback near term. We still plan to re-engage in the development of Stats & Leaderboards v2 in early 2022.
- Economy V2 - The rest of the Economy v2 - including player inventories and wallets, receipt validation on the most popular marketplaces, bundles, stores, and more - are targeted to release into public preview Spring 2022.
- Segmentation – As we continue to support segments, we will be making it easier to define segments comprising fixed list of players. 
- Experimentation – As we continue to establish Experiments as the service to validate and roll-out your game experiences, we will be working to introduce flexibility on scorecard generation using your compute account and preferred cadence, along with giving the control of raw scorecard data in your choice of data store.
- BYO Data Storage –  We will be introducing the ability to write Playstream and telemetry events to your own storage account.

Thank you to all our amazing game creators building with PlayFab today. None of this would be possible without you. Please keep the feedback coming! 
