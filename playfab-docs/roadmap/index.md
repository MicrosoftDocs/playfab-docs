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

_Last Update: 4/08/2021_

Hello everyone! It's been a while since our last roadmap update. Like many of you, our team has been busy adapting to the reality of distributed development. That said, we want to let you know what’s coming and when for Azure PlayFab to help you plan more effectively. Going forward, we plan to release roadmap details on a quarterly basis. Our next update will be in July 2021.

This is our latest set of updates.  As always, we welcome your feedback. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums. Thank you for your continued support.

>[!Note]
> While this roadmap reflects our aspirations, future facing features and timelines are subject to change without notice.

## Recently shipped features

These are key features we shipped since our last update in April 2020.

#### PlayFab pricing policies

- Rolled out a new and revamped pricing plan&mdash;[Usage Based Pricing](https://blog.playfab.com/blog/usage-based-pricing-update-transition-period-extended-through-october-31-2020)
- New pay-as-you-go plan with [no monthly minimums](https://blog.playfab.com/blog/new-playfab-pricing-plan-with-no-monthly-minimums)
- Increased player minimum in [developer mode](https://blog.playfab.com/blog/development-mode-player-limit-increased-to-100k-players). It is now up to 100k players

#### PlayFab Multiplayer Servers (MPS)

- Greatly expanded our PlayFab Multiplayer Servers (MPS) regional footprint in the [US and Asia](https://blog.playfab.com/blog/azure-playfab-multiplayer-servers-adds-new-regions-in-asia-and-us-to-reduce-player-latency-and-give-multiplayer-games-even-more-choice)
- Added support for [AMD SKUs](https://blog.playfab.com/blog/azure-playfab-multiplayer-servers-includes-free-monthly-amd-vms-usage-evaluation) to provide a better price/performance ratio for multiplayer optimized virtual machines
- New API endpoints for self-servicing quota requests and updating service build names. For details, see the [API documentation](/rest/api/playfab/multiplayer/multiplayerserver) 


#### PlayFab Party

These features were launched in Fall 2020.

- Shipped Unity plugin for Party in multiple platforms. It is Generally Available on Xbox (GDK), Windows, Nintendo Switch, PlayStation 4/5, iOS, and Android
- Shipped Unreal plugin for Party in Xbox (GDK) and Windows
- [Lowered the price of PlayFab Party](https://blog.playfab.com/blog/starting-today-save-up-to-90-using-playfab-party), helping teams save up to 90% on game voice chat and data data communications. Note that the service is [free when using the Xbox network](../features/multiplayer/networking/xbl-discount.yml)


#### PlayFab Experiments

Launched [PlayFab Experiments](https://blog.playfab.com/blog/announcing-playfabs-experimentation-all-new-for-trustworthy-experiments) as replacement to the existing A/B Tests preview feature.

We’ve continued to iterate on this feature adding:

- [Exclusion groups](../features/analytics/experiments/exclusion-groups.md) to prevent interaction effects on your experiments
- Ability to run [multiple concurrent](https://blog.playfab.com/blog/prevent-interaction-effects-with-exclusion-groups-and-run-multiple-concurrent-experiments) experiments
- Title data now has a primary configuration and [title data overrides](https://blog.playfab.com/blog/experiment-on-title-data-with-overrides-and-reimagined-design) to help you quickly manage your game experiments
- Released the [Segmentation CRUD APIs](https://blog.playfab.com/blog/introducing-segmentation-apis-build-games-that-target-with-playfab-segment) for titles integrating their own solutions for creating targeted player groups 

#### PlayFab Insights

We added the following functionalities for [PlayFab Insights](https://www.youtube.com/watch?v=4akVBx2gmU0).

- Enabled Insight features in Free Accounts and in Development Mode
- Implemented Event Sampling and [custom data retention](https://blog.playfab.com/blog/custom-data-retention-with-playfab-insights) 
- Launched [Data Explorer](../features/insights/data-explorer/quickstart.md) into Public Preview  

## In-progress features and active development areas

The following list is a peek into our PlayFab roadmap, identifying the most significant features we are currently working on. While not comprehensive, this list is intended to provide visibility into our key investments. Note that while these features and dates are plan of record at time of posting, availability is subject to change.

Today we have 4 major services in preview:
1. **Azure Functions Integration** – This is a replacement to our current cloudscript solution. [CloudScript using Azure Functions](../features/automation/cloudscript-af/index.md) brings support for [new languages](/azure/azure-functions/supported-languages) (including C#) as well as local debugging in Visual Studio and Visual Studio Code. Azure Functions is in Public Preview.
1. **User Generated Content (UGC) and Economy v2** – After receiving feedback from private preview customers, we are cleaning up and preparing our Economy v2 APIs for Public Preview. Public Preview for UGC is expected to start in July. The rest of the Economy v2 APIs are targeted to release into Public Preview by early 2022.
1.	**PlayFab Matchmaking** – This is available in [Public Preview](../features/multiplayer/matchmaking/index.md) right now.  While you can check it out today, note that we are actively developing supporting services including a real-time notification solution to avoid polling as well as a lobby/session service to better manage your multiplayer state. Check out PlayFab Matchmaking today and reach out if you are interested in learning more about our upcoming multiplayer services which are targeting private preview later this year.
1. **Leaderboards v2** - This is in private preview with select customers. While this service remains an integral part of our roadmap, we have chosen to prioritize other more critical feature areas based on feedback and plan to re-engage the development of Leaderboards v2 in Fall 2021.

PlayFab provides updates and new features in the form of preview programs to give you the opportunity to evaluate them before they become part of our standard service or offering. If you're interested to join our preview programs, contact your account manager or email us at myplayfabam@microsoft.com. Our preview terms of use is modelled after [Azure Preview Terms of Use](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

Thank you to all our amazing game creators building with PlayFab today. None of this would be possible without you. Please keep the feedback coming! 
