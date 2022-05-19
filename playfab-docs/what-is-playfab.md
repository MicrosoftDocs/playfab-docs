---
title: What is PlayFab?
author:  sebgrink
description: PlayFab is a complete backend platform for live games with managed game services, real-time analytics, and LiveOps.
ms.author: sebgrink
ms.date: 03/23/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, multiplayer, authentication, leaderboards, liveops
ms.localizationpriority: medium
---

# What is PlayFab?

PlayFab is a complete backend platform for live games with managed game services, real-time analytics, and LiveOps. PlayFab enables you to boost your revenue and increase player engagement while cutting costs. This topic provides a high-level overview of the PlayFab features.

PlayFab's backend services reduce the barriers to launching games. To studios large and small, the services offer cost-effective development solutions that scale with the games and help the studios engage, retain, and monetize players. The services also enable developers to use the intelligent cloud to build and operate games, analyze gaming data, and improve overall gaming experiences. 

The PlayFab platform is a natural complement to [Azure for game development](https://azure.microsoft.com/en-us/solutions/gaming/#overview). With locations in 42 regions worldwide, Azure provides world-class server infrastructure and allows creators to focus on building great games with best-available global reach<!--Please clarify "best-available global reach"-->. For gamers, this leads to better experiences and to a higher degree of innovation achieved faster.

With PlayFab, you can instantly scale dedicated multiplayer servers that deliver low latency and high reliability for real-time gameplay<!--This is all that's left of the original list. Can we move this sentence to a paragraph above?-->.

To use PlayFab features, you must sign up for a [PlayFab account](https://developer.playfab.com/en-us/sign-up).

PlayFab provides the following services:

## Multiplayer Services

### Cross-Network Identity and Data

**Player Authentication**: Start with frictionless authentication, and let players link accounts to roam across Windows, Xbox, Steam, PSN, Nintendo, Facebook, iOS, Android, and other platforms.

**Player Data Management**: Share player information and game state across devices.

**Matchmaking**: To help players find opponents, use the proven capabilities of Smart Match on any platform.

### Multiplayer Servers

**Dedicated Servers**: Deliver low-latency, real-time gameplay for any platform.

**24/7 Monitoring and DDoS Protection**: Protect <!--games, gamers, both?-->against DDoS attacks and other incidents.

**Global Reach with Microsoft Azure**: Get closer to players on a cloud, with more global regions than offered by any other provider.

**Control Costs**: Dynamically scale server cores in response to demand.

### Chat

**Party**: Connect players through low-latency peer-to-peer communication.

**Text and Voice Chat**: Facilitate accessible voice chat, transcription, and translation.

**Accessibility**: Use automated speech-to-text transcription and voice synthesis to make communication simple for everyone.

**Real-Time Translation**: Break down global barriers, and grow player concurrency by translating voice and text chat between more than 30 different languages.

**Encryption**: Ensure that communications between players are secure.

### Leaderboards and Statistics

**Tournaments and Leaderboards**: Facilitate permanent or time-limited competitions amongst friends or strangers.

**Scheduling**: Reset leaderboards on a schedule, and archive standings so players can view past results.

**Prizes**: Reward players according to their actions and leaderboard ranks.

## LiveOps

### Engagement and Retention

**Game Manager Web Portal**: Provide<!--added this  verb for consistency with the other items on this list--> a shared space (with roles and access permissions) where studio members can build, configure, and operate your game.

**Daily Reports**: Evaluate your game's performance through the lens of the top metrics used across the industry and pre-calculated for you daily.

**Player Profiles**: Track players across authentication services and platforms.

**Customization**: Use server-hosted player data and logic to build custom game mechanics.

**Achievement Systems**: Use the rule engine and custom player events to build a powerful system of achievements.

**Real-Time Segmentation**: Act immediately on targeted groups of players.

**Player Communication**: Talk to your community through push notifications, emails, and message-of-the-day pop-ups.

### Content Management

**Title Data**: Manage your game configuration remotely.

**Item Catalog**: Configure your catalog of items available for in-app granting or purchase, and update it at any time.

### A/B Testing

**Player Buckets**: Run experiments with randomly assigned groups of players.

### Monetization

**Stores and Sales**: Target player segments with personalized store offers, and support payments with Xbox, Steam, Google, PayPal, and more.

**Virtual Economy**: Mint promotional coupons and virtual currencies with support for <!--"mint... with support for" is not completely clear-->setting initial balances and optional auto-recharge.

**User Generated Content**: Empower players to create, upload, and search for moderated content.

**Drop Tables**: Craft attractive bundles for first-time or regular users, and stimulate demand with item scarcity.

**Fraud Prevention**: Use server-side validation of receipts to make sure purchases are genuine, before they are completed.

### Automation

**CloudScript**: Build lightweight logic processing when you want server authority without a dedicated server.

**Task Scheduling**: Set up pre-defined actions to manage anything from prices and events to messaging lapsed players.

## Data and Analytics

### Real-Time Analytics

**PlayStream**: Monitor a unified real-time stream (and historical archive) of every event fired by your game.

**Real-Time Rules Engine**: Set up powerful actions and triggers that respond to PlayStream events.

**Real-Time Segmentation**: Use data properties to bucket players into segments and to trigger actions as the players enter or exit those segments.

**Event Filter and Search**: Zoom in on a time slice to analyze players, events, and error conditions in detail.

**Reports**: Review summaries of your game's daily and monthly performance, with automatic reports emailed daily and on-demand.

### Data Management

**Insights**: Gather all event and processed data into a single title database in the cloud.

**Event Archiving**: Schedule event exports to a pre-existing Azure Blob Storage or Amazon S3 data warehouse.

### Compliance

**GDPR**: PlayFab is committed to providing (1) features that help you be GDPR compliant and (2) the hooks you need to allow players to review and delete their data.

**COPPA**: As with GDPR, PlayFab features are designed to give developers a clear path to COPPA compliance.

## SDKs

SDKs are available for most popular engines and platforms.

### Supported Languages

* [Android Studio (Java)](sdks/androidstudio/index.md)
* [C\#](sdks/c-sharp/index.md)
* [Java](sdks/java/index.md)
* [Objective-C (iOS)](sdks/objective-c/index.md)
* [PlayFab CPP (C++)](sdks/playfab-cpp/index.md)

### Frameworks

* [Cocos2D](sdks/cocos2d-x/index.md)
* [Phaser.io (JavaScript)](sdks/phaser/index.md)

### Game Engines

* [Lua](sdks/lua/index.md)
* [Unity3D](sdks/unity3d/index.md)
* [Unreal Engine (Blueprints & C++)](sdks/unreal/index.md)

### Scripting

* [ActionScript](sdks/actionscript/index.md)
* [JavaScript](sdks/javascript/index.md)
* [NodeJS](sdks/nodejs/index.md)
* [PHP](sdks/php/index.md)
* [Python](sdks/python/index.md)

## Support

**Documentation**: Get started quickly, with tutorials, samples, and comprehensive reference documentation.

**Forums**: Learn from experts, and share your knowledge in the community forums.

**Slack**: Join channels for ongoing conversations with other developers and for direct communication with PlayFab Developer Success.

**Real-Time Service Health**: Visit status.playfab.com for current and historical information on service health.

**Tickets**: Get enterprise-level ticketed support.

**24/7 Emergency Escalations**: Get around-the-clock assistance on immediate-priority issues.
