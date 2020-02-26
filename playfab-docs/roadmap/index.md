---
title: PlayFab Roadmap
author: sebgrink
description: PlayFab Roadmap
ms.author: sebgrink
ms.date: 01/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---

# PlayFab Roadmap
_Last Update: 2/20/2020_

PlayFab is gearing up for an exciting decade! With 2020 comes a modern vision of our services that we’re working hard to deliver. 

As always, we want your feedback. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums.

Please note that while this roadmap reflects our aspirations, features and timelines are subject to change without notice.

***

## **Coming Soon:**

**_PlayFab in China_**

PlayFab is on track to launch in China in early 2020 in partnership with a local operator. The initial roll out is focused on dedicated multiplayer servers.

**_General availability of Multiplayer Servers and Party_**

These services are available today as previews. As we further incorporate your feedback, we will make these generally available to all PlayFab users. 

**_Server Tags_**

This addition to [Multiplayer Servers](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/) will simplify the management of server allocation. It’s especially geared towards build-to-build upgrades and reducing the chance of any player interruption as you update your multiplayer servers.

**_Billing details page for Multiplayer Servers and Party_**

These pages will allow you to view costs for each day.

**_Updated Multiplayer Server UX_**

We’re working on management experiences for Linux builds and additional graphs for smarter administration. 

***

## **Coming Later:**

**_General availability of improved Leaderboards_**

This service is available today in previews. As we further incorporate your feedback, we will make this generally available to all PlayFab users. 

**_PlayFab Experiments_**

This will provide a more advanced framework for A/B tests and other experiments.

**_Insights_**

The initial release of a new stand-alone PlayFab Insights service will give you significantly more control over your data, analytics system and environment. Our goal is to provide petabyte-scale publisher-level analytics out-of-the-box. Insights will not only allow you to choose how long you retain data and how much power you want behind your queries; it will also open up multiple new ways to access data including connecting popular visualization platforms or your favorite SQL IDE. 

**_Monetization and User Generated Content_**

These services will begin to move from private to public preview in the first half of 2020. Monetization provides redemption, wallet and inventory capabilities while UGC provides a highly scalable catalog plus content moderation, ratings and reviews. These services are used to power the Minecraft Marketplace and the Mixer Sparks system supporting millions of transactions and the consumption of user generated content at scale. 

***

## **Available Now:**

**_CloudScript with Azure Functions_**

[CloudScript using Azure Functions](https://docs.microsoft.com/gaming/playfab/features/automation/cloudscript-af/) brings support for [new languages](https://docs.microsoft.com/azure/azure-functions/supported-languages) (including C#) as well as local debugging in Visual Studio and Visual Studio Code. 
PlayFab asynchronously waits for these functions to complete, allowing them to run for extended periods of time.  You can watch a demo [here](https://youtu.be/apQbkDn1lNo).

**_PlayFab Visual Studio Extension_**

The PlayFab Visual Studio Code Extension will roll out soon with a GitHub open source repository for community involvement.

**_Insights Management Commands_**

Insights now has a series of [management commands](https://docs.microsoft.com/gaming/playfab/features/insights/explorer/management-commands) that allow you to gain a better understanding of your data environment.

**_Azure Active Directory Authentication_**

Now you can “Sign in with Microsoft” at the bottom of the PlayFab developer login page thanks to Azure Active Directory authentication. This enables one-click access to PlayFab from Partner Center, Azure Portal and other Microsoft portals. When adding users to an existing account, be sure to set the correct authentication provider as specified in the [documentation](https://docs.microsoft.com/gaming/playfab/features/authentication/aad-authentication/).

**_Multiplayer Servers in South Africa_**

New Dv2 virtual machines allow for improved latency and experiences for this rapidly expanding market.

**_Matchmaking_**

[Matchmaking](https://docs.microsoft.com/gaming/playfab/features/multiplayer/matchmaking/) is publicly available and includes support for back-filled tickets, allowing you to re-fill open slots if players leave mid-game.

**_Party_**

[Party](https://docs.microsoft.com/gaming/playfab/features/multiplayer/networking/) accessibility and translation services are in Private Preview in 20+ languages, making it easier for players to communicate with each other. 

Party C++ SDKs are available for more platforms, including PC, Xbox, iOS, Android, Nintendo Switch and Sony PlayStation, so you can connect players with low-latency networking and chat anywhere. 

**_Game Center Authentication_**

PlayFab now supports securely authenticating players on iOS devices using their Game Center credentials. 

**_Push Template APIs_**

New APIs for Push Notifications enable you to Delete, Create, Save, and Send Push Notification Templates.

**_PlayFab Explorer_**

[PlayFab Explorer](https://docs.microsoft.com/gaming/playfab/features/insights/explorer/) is an integrated Game Manager experience that allows direct data access to events for ad hoc queries. 
We’ve modernized the user experience, given you more flexibility, and improved usability. This new style is inspired by the [Fluent design language](https://www.microsoft.com/design/fluent/#/) adopted across Microsoft. 

**_Improved Onboarding_**

For any feature you are not currently using Game Manager now provides notes on prerequisites and links to the quick start guide.

**_Demo Game_**

[Vanguard Outrider](https://www.vanguardoutrider.com/) is a demo game we built to help you test PlayFab. It's an online clicker looter shooter. You can use this to try out store segmentation, change title data, and see examples of CloudScript.

**_Azure Enterprise Billing_**

We are now able to bill Azure enterprise agreements, so if you are already using an Azure service you can use similar credits and billing instruments with PlayFab.

**_Contact Support via Game Manager_**

We now offer the ability to contact PlayFab Support (including urgent support requests) directly within Game Manager.
