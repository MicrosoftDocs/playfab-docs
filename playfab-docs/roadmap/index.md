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
_Last Update: 4/23/2020_

We hope you're all staying safe! With 2020 comes a modern vision of our services that we’re working hard to deliver. 

As always, we want your feedback. The [Feature Requests](https://community.playfab.com/spaces/24/index.html?sort=votes) section of our forum allows you to post, comment, and vote on ideas from our community. Addressing issues also remains a high priority so please continue to share your findings in the [Bugs](https://community.playfab.com/spaces/23/index.html) section of our forums.

Please note that while this roadmap reflects our aspirations, features and timelines are subject to change without notice.

***

## **Coming Next:**

**_General availability of improved Leaderboards_**

This service is available today in previews. As we further incorporate your feedback, we will make this generally available to all PlayFab users. 

**_Monetization and User Generated Content_**

These services will begin to move from private to public preview in the first half of 2020. Monetization provides redemption, wallet and inventory capabilities while UGC provides a highly scalable catalog plus content moderation, ratings and reviews. These services are used to power the Minecraft Marketplace and the Mixer Sparks system supporting millions of transactions and the consumption of user generated content at scale. The LiveOps Masterclass with Minecraft [video](https://www.youtube.com/watch?v=L7VoxGb1oYw) gives a good overview.

***

## **Available Now:**

**_Release notes on PlayFab GitHib Repo_**

We have created a new public [GitHub repository](https://github.com/PlayFab/PlayFab) for PlayFab where we communicate service [releases notes](https://github.com/PlayFab/PlayFab/releases) and product updates. You can read more about this on our [blog](https://blog.playfab.com/blog/release-notes-on-playfab-github-repo).

**_Rewarded Ads_**

Announcing our newest LiveOps feature: Rewarded Ads. Now you can grant rewards to your players for watching in-game video ads from any third-party ad provider. Read the full announcement on our [blog](https://blog.playfab.com/blog/announcing-rewarded-ads).

**_Insights (Public Preview)_**

We’re proud to announce that our new completely managed data solution PlayFab Insights is now available in Public Preview. 

This new stand-alone service includes its own pricing currency and an improved data environment with advanced ingestion, export, customization and data retention features. Our goal is to provide petabyte-scale-analytics out-of-the-box. All together this creates a story of ingestion, access, control and reporting that is far beyond what we have offered in the past.

Insights allows you to choose how long you retain data and how much power you want behind your queries; as well as opening up multiple new ways to access data including connecting popular visualization platforms.

A [video overview](https://www.youtube.com/watch?v=4akVBx2gmU0) and full [reference documentation](https://docs.microsoft.com/gaming/playfab/features/insights/insights/) are available.

**_Insights Management Commands_**

Insights now has a series of [management commands](https://docs.microsoft.com/gaming/playfab/features/insights/explorer/management-commands) that allow you to gain a better understanding of your data environment.

**_General availability of Multiplayer Servers and Party_**

These services are now available to all PlayFab users! Read more about this announcment on our [blog](https://blog.playfab.com/blog/level-up-with-azure-playfab).

**_Billing details page for Multiplayer Servers and Party_**

These pages let you view costs for each day.

**_PlayFab in China_**

PlayFab is licensed to a local operator in China to provide PlayFab Multiplayer Servers in the China region. Customers can onboard by contacting business@playfab.cn.

**_PlayFab at Game Stack Live_**

We posted a number of technical talks as part of [Game Stack Live](https://developer.microsoft.com/en-us/games/blog/playfab-at-game-stack-live/). 

**_General availability of Multiplayer Servers and Party_**

These services are now generally available to all PlayFab users. 

**_Billing details page for Multiplayer Servers and Party_**

These pages let you view costs for each day.

**_The PlayFab Guide to LiveOps_**

The third edition of our LiveOps guidebook is now available! [Download](https://aka.ms/LiveOpsGuide) your copy today and read about how LiveOps can help you build games with healthy communities.

**_PlayFab Experiments_**

Our new and more advanced framework for A/B tests and other experiments is now available!

We posted a detailed overview on our [blog](https://blog.playfab.com/blog/announcing-playfabs-experimentation-all-new-for-trustworthy-experiments).

**_CloudScript with Azure Functions_**

[CloudScript using Azure Functions](https://docs.microsoft.com/gaming/playfab/features/automation/cloudscript-af/) brings support for [new languages](https://docs.microsoft.com/azure/azure-functions/supported-languages) (including C#) as well as local debugging in Visual Studio and Visual Studio Code. 
PlayFab asynchronously waits for these functions to complete, allowing them to run for extended periods of time. Find out more in this [video](https://youtu.be/apQbkDn1lNo).

**_PlayFab Visual Studio Extension_**

The PlayFab Extension is now available in the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=PlayFab.playfab-explorer). In addition, the extension is open source with code available in [GitHub](https://github.com/PlayFab/vscode-playfab-explorer). We continue to iterate on the PlayFab Extension and you are welcome to add features and improvements along with us.

More information is available on on our [blog](https://blog.playfab.com/blog/announcing-the-open-source-playfab-visual-studio-code-extension).

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
