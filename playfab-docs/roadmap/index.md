---
title: PlayFab Roadmap
author: thomg
description: PlayFab Roadmap
ms.author: thomg
ms.date: 04/09/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---

# PlayFab roadmap
_Last Update: 4/08/2021_

Hello everyone! It's been a while since our last roadmap update. Like many of you, our team has been busy adapting to the reality of distributed development. That said, we want to let you know what’s coming and when for Azure PlayFab to help you plan more effectively. Going forward, we plan to release roadmap details on a quarterly basis. Our next update will be in July 2021.

Here is the latest set of updates for Azure PlayFab.  As always, we welcome your feedback. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums. Thank you for your continued support!

>[!Note]
> While this roadmap reflects our aspirations, future facing features and timelines are subject to change without notice.

## **Recently Shipped (since our last update):**

We’ve made updates to our PlayFab pricing polies:
- [Usage Based Pricing](https://blog.playfab.com/blog/usage-based-pricing-update-transition-period-extended-through-october-31-2020) was rolled out as a new and revamped pricing plan
- Including a new pay-as-you-go plan with [no monthly minimums](https://blog.playfab.com/blog/new-playfab-pricing-plan-with-no-monthly-minimums)
- We increased the player minimum in [developer mode](https://blog.playfab.com/blog/development-mode-player-limit-increased-to-100k-players) (now up to 100k players) to help you develop faster 

Exciting updates to our PlayFab Multiplayer Services:
- We have greatly expanded our Multiplayer Services (MPS) regional footprint in the [US and Asia](https://blog.playfab.com/blog/azure-playfab-multiplayer-servers-adds-new-regions-in-asia-and-us-to-reduce-player-latency-and-give-multiplayer-games-even-more-choice)
- Added support for [AMD SKUs](https://blog.playfab.com/blog/azure-playfab-multiplayer-servers-includes-free-monthly-amd-vms-usage-evaluation) helping to provide a better price/performance ratio for multiplayer optimized virtual machines
- There are new API endpoints for self-servicing quota requests and updating service build names (see the [API documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver?view=playfab-rest) for more details)  

PlayFab Party launched in the fall of 2020:
- Party shipped its Unity plugin to multiple platforms (now Generally Available on Game Developer Kit (GDK), Windows, Nintendo Switch, PlayStation 4 & 5, iOS, and Android)
- Shipped its Unreal Engine 4 plugin to Game Developer Kit (GDK) and Windows.
- [Lowered the price of PlayFab Party](https://blog.playfab.com/blog/starting-today-save-up-to-90-using-playfab-party), helping teams save up to 90% on game voice chat and data comms - note that the service is already [free when using the Xbox network](https://docs.microsoft.com/gaming/playfab/features/multiplayer/networking/xbl-discount)

Launched [PlayFab Experiments](https://blog.playfab.com/blog/announcing-playfabs-experimentation-all-new-for-trustworthy-experiments) as an replacement to the existing A/B Tests preview feature. We’ve continued to iterate on the feature adding:
- [Exclusion groups](https://docs.microsoft.com/gaming/playfab/features/analytics/experiments/exclusion-groups) to prevent interaction effects on your experiments
- The ability to run [multiple concurrent](https://blog.playfab.com/blog/prevent-interaction-effects-with-exclusion-groups-and-run-multiple-concurrent-experiments) experiments
- Title data now has a primary configuration and [title data overrides](https://blog.playfab.com/blog/experiment-on-title-data-with-overrides-and-reimagined-design) to help you quickly manage your game experiments
- We also released the [Segmentation CRUD APIs](https://blog.playfab.com/blog/introducing-segmentation-apis-build-games-that-target-with-playfab-segment) for titles integrating their own solutions for creating targeted player groups 

[PlayFab Insights](https://www.youtube.com/watch?v=4akVBx2gmU0) has added the following functionality:
- Enabled Insight features in Free Accounts and in Development Mode
- Implemented Event Sampling and [custom data retention](https://blog.playfab.com/blog/custom-data-retention-with-playfab-insights) 
- Launched [Data Explorer](https://docs.microsoft.com/gaming/playfab/features/insights/data-explorer/quickstart) into Public Preview  

## **In Progress Features and active areas of Development** ##
The following list is a peek into our PlayFab roadmap, identifying the most significant features we are currently working on. While not comprehensive, this list is intended to provide visibility into our key investments. Note that, while these features and dates are plan of record at time of posting, availability is subject to change. 

Today we have 4 major services in preview:
1. **Azure Functions Integration** – This is a replacement to our current cloudscript solution. [CloudScript using Azure Functions](https://docs.microsoft.com/gaming/playfab/features/automation/cloudscript-af/) brings support for [new languages](https://docs.microsoft.com/azure/azure-functions/supported-languages) (including C#) as well as local debugging in Visual Studio and Visual Studio Code. Azure Functions is in Public Preview.
1. **User Generated Content (UGC) and Economy V2** – After receiving feedback from private preview customers we are cleaning up and preparing our Economy v2 APIs for Public Preview. Public Preview for UGC is expected to start in July. The rest of the Economy v2 APIs are targeted to release into public preview by early 2022.
1. **PlayFab Matchmaking** - This is available in [Public Preview](https://docs.microsoft.com/gaming/playfab/features/multiplayer/matchmaking/) right now. It is designed to help you match players together based on stats and player attributes. Check it out today! 
1. **Leaderboards v2** - This is in private preview with select customers. While this service remains an integral part of our roadmap, we have chosen to prioritize other more critical feature areas based on feedback and plan to re-engage development of Leaderboards v2 in the Fall of 2021.

PlayFab provides updates and new features in the form of preview programs to give Microsoft and customers the opportunity to evaluate and understand the new feature before it becomes part of our standard service or offering. If you are interested in looking more closely at our preview features, please reach out to your account manager, or contact us at myplayfabam@microsoft.com. Our preview Terms of Use are modelled after Azure’s [Preview Terms Of Use | Microsoft Azure](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fazure.microsoft.com%2Fen-us%2Fsupport%2Flegal%2Fpreview-supplemental-terms%2F&data=04%7C01%7Cthomg%40exchange.microsoft.com%7Caf621be543394c1ab8d208d8effb1b51%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637523209057958240%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=9YENlZ4%2FE%2BiDKBpmwNa9e2%2F%2FGVCNIdSKa49ZWx%2FQOGg%3D&reserved=0).

THANK YOU to all our amazing game creators building with PlayFab today. None of this would be possible without you. Please keep the feedback coming! 

