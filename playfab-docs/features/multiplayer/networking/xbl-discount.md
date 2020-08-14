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

This page summarizes key usage and billing information for [Xbox Live managed partners](https://docs.microsoft.com/gaming/xbox-live/get-started/setup-partner-center/setup-partner-center-id-partners) interested in using PlayFab services to power multiplayer scenarios. [PlayFab Party](../../multiplayer/networking/index.md) can be used for **free** to connect Xbox Live players together.  Additionally, you can use [PlayFab Matchmaking](../../multiplayer/matchmaking/index.md) to bring players together across platforms. If you would like to take advantage of this program we recommend the following multiplayer design:

1. Use the [Xbox Live SDK](https://docs.microsoft.com/gaming/xbox-live) to interface with Xbox Live social capabilities like
Activity, Profile Cards, and game invites. If you are building a cross-network game, you may want to use the equivalent social APIs from Steam, Nintendo, Sony, etc. for those platforms, and will need to comply with any applicable policies governing multiplayer and cross-network activity.
2. Use [Xbox Live SmartMatch](https://docs.microsoft.com/gaming/xbox-live/multiplayer/multiplayer-manager/play-multiplayer-with-matchmaking) or  [PlayFab Matchmaking](../../multiplayer/matchmaking/index.md) to match players.
3. Use [PlayFab Party](../../multiplayer/networking/index.md) to connect players for device-to-device networking or chat.

One of Microsoft's objectives is to help game studios deploy interoperable cross-network multiplayer infrastructure that enables safe and secure interactivity between players no matter where they play. Many platforms provide free networking and chat services that are tied to a specific player identity system, and as a result cross-network games typically necessitate building custom back-end services or using paid middleware. 

Free Xbox Live activity for Party and Matchmaking is tracked by examining the PlayFab log-in API used by the player device. If `LoginWithXbox()` is used, and the game complies with [Xbox Live Integration Policies](https://aka.ms/XboxLivePolicy), that player activity will be zero-rated and free. This free program brings together the benefits of Xbox Live free services with the flexibility of PlayFab's identity agnostic stack.

If you are interested in cross-network scenarios or more advanced multiplayer designs, several other PlayFab services may be useful, especially [Multiplayer Servers](../servers/index.md), [Entity Groups](../../data/playerdata/index.md), [in-game Commerce](https://docs.microsoft.com/gaming/playfab/index#pivot=documentation&panel=commerce), and [Automation](https://docs.microsoft.com/gaming/playfab/index#pivot=documentation&panel=automation).

##  PlayFab's pricing plans
The typical on-boarding steps for Xbox Live managed partners are:

1. Make a PlayFab developer account at https://developer.playfab.com
2. Create PlayFab titles for your project. There is no technical link between the title you’ve established in Partner Center and the PlayFab title. Unless you're already paying for PlayFab, new titles should be in *Development* mode which does not require a payment instrument.
3. Enable Matchmaking and Party in their respective pages in Game Manager.
4. Download and integrate the [Party SDK](https://docs.microsoft.com/gaming/playfab/features/multiplayer/networking/) or [PlayFab REST SDKs](https://docs.microsoft.com/gaming/playfab/index#pivot=documentation&panel=sdks).
5. In order to remove the 10k player limit, please contact your Microsoft Account Representative or upgrade your PlayFab account to the *Production* mode. 

There are three pricing tiers:

1. *Development.* This is PlayFab's default developer environment enabling access to most PlayFab services for free. There is a limit of 100,000 unique player accounts per title.
1. *Production.* This is PlayFab's standard production environment that enables access to all PlayFab services. This mode requires a payment instrument or an enterprise agreement. Production lets you use PlayFab cross-platform and access premium services like Multiplayer Servers, while still enjoying zero-rating of Xbox Live Party & Matchmaking activity. You can upgrade to this tier self-service within Game Manager.
1. *Essentials.* This is a special production environment that allows unlimited free usage of PlayFab Party and Matchmaking, but limited to Xbox Live associated players. This mode does not require a payment instrument, and can be enabled by engaging your Microsoft developer partner manager. Activity sourced outside of the Xbox Live ecosystem (e.g. OpenID) is limited to 100,000 unique player accounts, similar to the Development cap. Essentials lets you get the most of Party and Matchmaking within the Xbox ecosystem, assured that you won't be billed for any activity.

## Frequently asked questions (FAQ)

### What limits are there to Xbox Live free usage of PlayFab Party or Matchmaking?
In Development, overall usage of PlayFab including Party and Matchmaking is restricted to 100,000 unique player accounts. In both Production and Essentials, there is no limit on the number of match tickets, concurrent Party networks, total Party networks, or any other consumption limitation.

### Does this program apply only to Xbox consoles?
No. This free program applies to any platform where players sign in with Xbox Live, including PC, iOS, and Android.

### PlayFab Matchmaking is labeled as a preview service. Can I use matchmaking in production?
Yes. Matchmaking is being used by several games in production and are supported 24/7 by PlayFab. We are using the preview phase to improve usability and act on customer feedback.

### How do I ensure my usage of PlayFab Party is compliant with Xbox Live Integration policies?
Party is intrinsically compliant with Xbox Live network security requirements, as it uses appropriately modern DTLS ciphers and complex keys.

There is an Xbox Live plug-in for Party that simplifies Xbox Live sign-in and automatically applies chat muting to comply with Xbox Live requirements and ensure player mutes/blocks are respected. [Check out the Xbox Live Party plug-in topic for more information.](./party-xbox-live-guide.md)

### What if a Party has a mix of Xbox Live and non-Xbox Live players? What do I pay for?
The consumption meters used to bill Party are player-oriented: player network-minutes, player voice-minutes, network egress etc. Xbox Live players will not increment these meters and effectively be zero rated. PlayFab tracks this using the `LoginWithXbox` API so please use this API to enjoy the Xbox Live program.

Usage from other identity providers or custom ids will be billed normally; check out the [PlayFab Party pricing topic](../../multiplayer/networking/pricing.md) to see how standard Party activity is metered and zero-rating applied.
