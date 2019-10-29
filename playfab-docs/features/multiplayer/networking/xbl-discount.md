---
title: Multiplayer experiences in Xbox Live games
author: v-thopra
description: Learn how to leverage PlayFab multiplayer in Xbox Live games.
ms.author: v-thopra
ms.date: 02/27/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, xbox live, party
ms.localizationpriority: medium
---

# Multiplayer subsidy and FAQ for Xbox Live managed partners

This page provides pricing information and guidance for [Xbox Live managed partners](https://docs.microsoft.com/en-us/gaming/xbox-live/get-started/setup-partner-center/setup-partner-center-id-partners) interested in using PlayFab services to accomplish multiplayer scenarios across PC, Mobile, and Xbox One.

PlayFab and Xbox Live have partnered so game developers can power Xbox Live multiplayer activity with several PlayFab services for free. This includes [PlayFab Matchmaking](../../multiplayer/matchmaking/index.md) and [PlayFab Party](../../multiplayer/networking/index.md). If you would like to take advantage of this program we recommend the following multiplayer design:

1. Use the [Xbox Live SDK](https://docs.microsoft.com/gaming/xbox-live) to interface with Xbox Live social capabilities like 
Activity, Profile Cards, and game invites.
2. Use [Xbox Live SmartMatch](https://docs.microsoft.com/en-us/gaming/xbox-live/multiplayer/multiplayer-manager/play-multiplayer-with-matchmaking) or  [PlayFab Matchmaking](../../multiplayer/matchmaking/index.md) to match players.
3. Use [PlayFab Party](../../multiplayer/networking/index.md) to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, Sony PlayStation, etc. for those platforms, and comply with any platform policies governing multiplayer and cross-network activity.

Microsoft's desire is for game studios to be able to deploy interoperable matchmaking, networking, and chat infrastructure and enable safe interactivity between players across platforms. Usage associated with Xbox Live logged-in players (using `LoginWithXbox()`) and complying with [Xbox Live Integration Policies](https://aka.ms/XboxLivePolicy) will be zero-rated.

## What limits are there to Xbox Live free usage of PlayFab Party or Matchmaking?
There are reasonable limits enforced by the PlayFab terms of service (e.g. unnecessary usage that threatens the reliability of the service will be rate-limited). **The other limit is translation.** Translation functionality is not included in the free program, and usage of translation functionality will require upgrading your studio to a paid tier.

There are not any other limits to the free program, It is intended to be used for very large games with millions of Party minutes or Matchmaking tickets per month without any cost to you.

## Does this program apply only to Xbox console?
No. This discount program applies to any platform where you can sign in with Xbox Live, including PC, iOS, and Android.

## PlayFab Matchmaking and PlayFab Party are labeled as preview services. Can I use these services in production?
Yes. These services are already used by several games in production and are supported 24/7 by PlayFab. We are using the preview phase to grow our customer base methodically, improve usability, and action customer feedback. 

## How do I ensure my usage of PlayFab Party is compliant with Xbox Live Integration policies?
PlayFab Party is always compliant with Xbox Live network security requirements, and uses appropriately updated DTLS ciphers and complex keys. 

To facilitate using Party with Xbox Live and ensure communication behavior is compliant and respects player privacy and mute settings, there is an Xbox Live plug-in for Party. [Please check out the Xbox Live Party plug-in topic for more information.](https://review.docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/networking/party-xbox-live-guide?branch=pr-en-us-912)

## I am not currently a PlayFab customer but want to take advantage of the Xbox Live subsidy. How do I get started?

1. Make a PlayFab developer account at https://developer.playfab.com
2. Create PlayFab titles for your project. These do not need to be linked in any way to your Partner Center titles.
3. Enable Matchmaking and Party in their respective pages in Game Manager. Because we are controlling access to Party during the preview, you will need an access code from your Microsoft developer partner manager. 
4. Download [Party SDK](https://docs.microsoft.com/en-us/gaming/playfab/features/multiplayer/networking/) or [PlayFab REST SDKs](https://docs.microsoft.com/en-us/gaming/playfab/index#pivot=documentation&panel=sdks).

## Do I need to upgrade my studio tier to Pro or Enterprise to make use of the subsidy?
No. You can access PlayFab Party and Matchmaking at unlimited scale, for free, as part of the indie tier, as long as the originating player used the `LoginWithXbox()` API to access PlayFab services. 

## What if I want to use PlayFab services other than Party or Matchmaking?
If you want to use other PlayFab services beyond the indie tier limits, you will need to upgrade your studio account. You can do this self-serve through the Game Manager portal or by working with your Microsoft developer account manager.

## What if a PlayFab Party has a mix of Xbox Live and non-Xbox Live players?
The consumption meters used to bill PlayFab Party are player-oriented: player network-minutes, player voice-minutes, network egress etc. Xbox Live players will not increment these meters and effectively be zero rated. **Other usage will be billed normally.** [See PlayFab Party pricing for more information.](../../multiplayer/networking/pricing.md)
