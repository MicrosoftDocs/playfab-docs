---
title: Multiplayer experiences in Xbox Live games
author: joannaleecy
description: Xbox Live Free Program FAQ
ms.author: joanlee
ms.date: 02/27/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, xbox live, party
ms.localizationpriority: medium
---

# Xbox Live Free Program FAQ

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
