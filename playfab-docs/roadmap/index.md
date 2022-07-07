---
title: PlayFab Roadmap
author: thomasgu
description: PlayFab Roadmap
ms.author: thomg
ms.date: 06/30/2022
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---


# Azure PlayFab roadmap

_Last Update: 23 March 2022_

Before we jump into our latest roadmap update remember that we welcome your feedback. We love hearing from game creators that are using PlayFab for their current or in-development titles. If you see something on this roadmap that is critical to your success or that you want more information on, let us know. 

PlayFab Leadership also hosts our series of ‘Outside-In’ sessions where we have game studios meet with our team to help us understand your needs and goals. If you're interested in participating, reach out to us at: PFOutsideInRequest@microsoft.com

## What’s new

- **MATCHMAKING:**
In March we added integration with the new lobby feature and real-time notifications to reduce the need to poll. Now, after releasing new SDK binaries with important fixes, Matchmaking is in general availablility (GA). Customers who may have grabbed the earleir public preview SDK should download and use the latest [Lobby and Matchmaking SDKs](https://docs.microsoft.com/gaming/playfab/features/multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks). 

- **LOBBY:**
Lobby was released in March as a public preview, adding a highly requested feature to help integrate gameplay in matchmaking and friend multiplayer scenarios. The feature leaves public preview and is now generally available. In preparation for the general available release, we released new SDK binaries with important fixes. Customers who may have grabbed the public preview SDK should consider updating [here](https://docs.microsoft.com/gaming/playfab/features/multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks).

- **DATA CONNECTIONS:**
We launched [data connections to public preview](https://blog.playfab.com/blog/take-control-of-data-in-your-resources-using-data-connections) earlier this year, and this month we expanded the feature to allow export to your own Azure Data Explorer. You can read more about the feature [here](https://docs.microsoft.com/gaming/playfab/features/data/dataconnections/data-connection-adx). With this release, you'll be able to gain precise control of your cluster performance and cost through Data Explorer connections. As a result, Insights Management will be deprecated soon.  

- **PLAYER SEGMENTS:**
The GetPlayersInSegment API is on a path to eventually be deprecated and will be replaced by improved APIs: ExportPlayersInSegment and GetSegmentExport. These new APIs are available now. You can use them to create snapshots of all player profiles that match the segment definition, and to retrieve the index URLs of the downloadable files containing the player profile of a given segment. This tutorial walks you through how to use these new APIs: [Tutorial to export players in a Segment](https://docs.microsoft.com/gaming/playfab/features/analytics/segmentation/export-players-in-a-segment).

- **PLAYER CHURN PRIVATE PREVIEW:**
We're bringing Predictive Intelligence to the world of PlayFab! Player Churn Prediction is our first Azure ML based feature that will allow studios to predict churn scores for players. Directly integrated into Segmentation, you can take the appropriate mitigation to increase player retention and improve game content based on player insights. Reach out to us via PlayerChurn@Microsoft.com if you're interested in piloting this new feature.

- **GDC DEMOS, TALKS, AND TUTORIALS:**
A lot of content around how to use PlayFab has come out over the last few months, starting with GDC where we put together a slew of demos, talks, and documentation around our features, including:
  - [Multiplayer Services](https://developer.microsoft.com/games/events/gdc/nomanssky/) 
  - [Matchmaking, Party, and Lobby](https://youtu.be/pkkegRy94M0) 
  - [Experiments](https://developer.microsoft.com/games/events/gdc/nbaclash/) 
  - [Data Platform](https://developer.microsoft.com/games/events/gdc/forzahorizon5/)
  - [User Generated Content (UGC)](https://developer.microsoft.com/games/events/gdc/msflightsimulator/) 

  Make sure you visit our [GDC event page](https://developer.microsoft.com/games/events/gdc/) to learn how some of the world’s most creative development teams use PlayFab and other Microsoft technologies to power their games. 

- **THE ART OF LIVEOPS PODCAST SEASON THREE:** 
Season 3 of the Art of LiveOps podcast is now in full swing, with discussions from experts in the game industry including Probably Monsters, Rare, Microsoft, and Destiny. You can subscribe to this podcast on [SoundCloud](https://soundcloud.com/theartofliveops), [iTunes](https://podcasts.apple.com/podcast/the-art-of-liveops/id1475548986), [Spotify](https://open.spotify.com/show/1CWGHYnXqsXeivngmKqENq?si=iG9ccaipSbO7yxxdFsoXPw), [BuzzSprout](https://www.buzzsprout.com/489403), or wherever you listen to podcasts.

- **THE PLAYFAB VIDEO SERIES:** 
We also launched PlayFab’s Feature Video Series. These short videos introduce PlayFab’s key features and benefits. Each is hosted by an Engineer or Program Manager who works on the feature. You can find these videos here: [Azure PlayFab Feature Video Series](https://blog.playfab.com/blog/azure-playfab-feature-video-series). 

- **XFEST FOR EVERYONE:**
At Xfest we presented how you can use PlayFab to implement an end-to-end multiplayer experience, including matchmaking and lobby services with real-time notifications, networking, and voice chat. To watch the multiplayer presentation, see [Enabling Cross-Platform Play w/ Azure Playfab Matchmaking, Lobby, & Party Networking](https://www.youtube.com/watch?v=yez09HlqMvA&list=PLRs2lXTYCDQ3uPs2PBJoc69ET6LrM_EK5&index=5). For other public Xfest talks see [Xfest for Everyone](https://developer.microsoft.com/games/events/xfestforeveryone/).

## What's on-deck

- **LEADERBOARDS v2:** Leaderboards v2 remains in private preview for now.

- **ECONOMY V2:** Economy V2 Public Preview is coming in the third quarter of 2022! Player inventories and wallets, receipt validation on the most popular marketplaces, bundles, stores, currencies, and more. These updates take advantage of an optimized Azure backend design and improved task-oriented documentation with a focus on virtual economies and monetization. Stay tuned for more information about this release soon. These updated APIs will all interop with the new Catalog V2 that has been released along with [Azure Playfab UGC](https://docs.microsoft.com/gaming/playfab/features/commerce/ugc/)

Thank you for your continued support! The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums.
