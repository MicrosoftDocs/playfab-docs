---
title: Multiplayer experiences in Xbox Live games
author: v-thopra
description: Xbox Live discount and FAQ
ms.author: v-thopra
ms.date: 02/27/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, xbox live, party
ms.localizationpriority: medium
---

# Xbox Live discount and FAQ

This page describes billing behavior and answers common questions for [Xbox Live managed partners](https://docs.microsoft.com/gaming/xbox-live/get-started/setup-partner-center/setup-partner-center-id-partners) interested in using PlayFab services to power multiplayer scenarios. 

You can power Xbox Live multiplayer activity with several PlayFab services **for free.** This includes [PlayFab Matchmaking](../../multiplayer/matchmaking/index.md) and [PlayFab Party](../../multiplayer/networking/index.md). If you would like to take advantage of this program we recommend the following multiplayer design:

1. Use the [Xbox Live SDK](https://docs.microsoft.com/gaming/xbox-live) to interface with Xbox Live social capabilities like 
Activity, Profile Cards, and game invites. If you are building a cross-network game, you may want to use the equivalent social APIs from Steam, Nintendo, Sony, etc. for those platforms, and will need to comply with any applicable policies governing multiplayer and cross-network activity.
2. Use [Xbox Live SmartMatch](https://docs.microsoft.com/gaming/xbox-live/multiplayer/multiplayer-manager/play-multiplayer-with-matchmaking) or  [PlayFab Matchmaking](../../multiplayer/matchmaking/index.md) to match players.
3. Use [PlayFab Party](../../multiplayer/networking/index.md) to connect players for device-to-device networking or chat.

Free Xbox Live activity for Party and Matchmaking is tracked by examining the PlayFab log-in API used by the player device. If `LoginWithXbox()` is used, and the game complies with [Xbox Live Integration Policies](https://aka.ms/XboxLivePolicy), that player activity will be zero-rated and free.  

One of Microsoft's objectives is to help game studios deploy interoperable cross-network multiplayer infrastructure that enables safe and secure interactivity between players no matter where they play. Many platforms provide free networking and chat services that are tied to a specific player identity system, and as a result cross-network games typically necessitate building custom back-end services or using paid middleware. This free program brings together the benefits of Xbox Live free services with the flexibility of PlayFab's identity agnostic stack. 

If you are interested in cross-network scenarios or more advanced multiplayer designs, several other PlayFab services may be useful, especially [Multiplayer Servers](../servers/index.md), [Entity Groups](../../data/playerdata/index.md), [in-game Commerce](https://docs.microsoft.com/en-us/gaming/playfab/index#pivot=documentation&panel=commerce), and [Automation](https://docs.microsoft.com/en-us/gaming/playfab/index#pivot=documentation&panel=automation). 

## What limits are there to Xbox Live free usage of PlayFab Party or Matchmaking?
There is no limit on the number of match tickets, concurrent Party networks, total Party networks, or any other scale limitation. This free program is intended to support very large titles without any unexpected charges. 

The only API that is not covered from this free program are Party's translation functionality. Usage of real-time translation is restricted and will require upgrading your studio account to a paid tier.

## Does this program apply only to Xbox consoles?
No. This free program applies to any platform where you can sign in with Xbox Live, including PC, iOS, and Android.

## I am not currently a PlayFab customer but want to take advantage of these free services. How do I get started?
1. Make a PlayFab developer account at https://developer.playfab.com
2. Create PlayFab titles for your project. These do not need to be linked in any way to your Partner Center titles.
3. Enable Matchmaking and Party in their respective pages in Game Manager. Because we are controlling access to Party during the preview, you will need an access code from your Microsoft developer partner manager.
4. Download [Party SDK](https://docs.microsoft.com/gaming/playfab/features/multiplayer/networking/) or [PlayFab REST SDKs](https://docs.microsoft.com/gaming/playfab/index#pivot=documentation&panel=sdks).


## Do I need to upgrade my studio tier to Pro or Enterprise to make use of the free program?
No. You can access PlayFab Party and Matchmaking at unlimited scale, for free, as part of the free PlayFab essentials tier, as long as the originating player uses the `LoginWithXbox()` API to access these services. 

## What if I want to use PlayFab services other than Party or Matchmaking?
Using other PlayFab services beyond the free tier limits is blocked and requires upgrading the studio account. You can do this upgrade self-serve through the Game Manager portal or by engaging your Microsoft developer partner manager.

## What if a PlayFab Party has a mix of Xbox Live and non-Xbox Live players? What do I pay for?
The consumption meters used to bill PlayFab Party are player-oriented: player network-minutes, player voice-minutes, network egress etc. Xbox Live players will not increment these meters and effectively be zero rated. 

Usage from other identity providers or custom ids will be billed normally; check out the [PlayFab Party pricing topic](../../multiplayer/networking/pricing.md) to see how standard Party activity is metered.

## PlayFab Matchmaking and PlayFab Party are labeled as preview services. Can I use these services in production?
Yes. These services are being used by several games in production and are supported 24/7 by PlayFab. We are using the preview phase to improve usability and act on customer feedback. 

All Xbox Live managed partners are approved for the preview, and can get a preview access code from your Microsoft developer partner manager. PlayFab customers in the Indie, Pro, and Enterprise tiers can access the Matchmaking and Party previews automatically through Game Manager.

## How do I ensure my usage of PlayFab Party is compliant with Xbox Live Integration policies?
PlayFab Party is intrinsically compliant with Xbox Live network security requirements, as it uses appropriately modern DTLS ciphers and complex keys. 

There is an Xbox Live plug-in for Party that simplifies Xbox Live sign-in and automatically applies chat muting to comply with Xbox Live requirements and ensure player mutes/blocks are respected. [Check out the Xbox Live Party plug-in topic for more information.](./party-xbox-live-guide.md)
