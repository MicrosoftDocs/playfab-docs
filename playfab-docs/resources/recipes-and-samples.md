---
title: Recipes and samples
author: v-thopra
description: Code samples for PlayFab features and technologies.
ms.author: v-thopra
ms.date: 02/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, recipes, samples, how-to, development
ms.localizationpriority: medium
---

# PlayFab Recipes and Samples

Here you can find links to recipes and samples that you can download and run to gain a better understanding of how to use PlayFab features in code.

## Recipes

This collection of examples shows familiar patterns and mechanics implemented using PlayFab. 

### Player Retention 

  * [Daily Prize Wheel](https://github.com/PlayFab/PlayFab-Samples/tree/master/Recipes/PrizeWheel) -  Give players a randomized gift every day based on the values on a "Prize Wheel".
  * [Progressive Reward System](https://github.com/PlayFab/PlayFab-Samples/tree/master/Recipes/ProgressiveRewards) - Players that sign in consecutively over several days are granted an item depending on how long their login streak is.

### User Acquisition

  * [Referral Code Bonus](https://github.com/PlayFab/PlayFab-Samples/tree/master/Recipes/ReferralCodes) - Generate and send codes to friends that can be redeemed to to unlock a bonus for both the referrer and the referee.
  * [Cross-Promotional Rewards](https://github.com/PlayFab/PlayFab-Samples/tree/master/Recipes/SimpleCrossPromotion) - Reward players participating in more than one of your games.

### Monetization

  * [Regenerating Currency Mechanic](https://github.com/PlayFab/PlayFab-Samples/tree/master/Recipes/RegeneratingCurrency) - A play-limiting mechanic (similar to Candy Crush lives) that slowly refills to a maximum over time.



## Samples

These samples provide complete code samples that demonstrate various PlayFab features.

|Sample Name| Platforms| Engine| Description | Demonstrated Capabilities|
|-|-|-|-|-|
|[PlayFabCommerce](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/Android/PlayFabCommerce) | Android | Android Studio| This sample uses Android's in-app billing API and PlayFab client API to demonstrate an in-app store that exchanges real money for virtual items in PlayFab Economy.| <ul><li>Login</li><li>In app purchases</li></ul> |
|[PlayFabSignIn](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/Unity/PlayFabSignIn) | iOS, Android, PC | Unity | This sample demonstrates a simple PlayFab sign in flow. You may log in with an email/password, create an account or log in as a guest. Sign in info may be remembered across executions of the sample. | <ul><li>Login</li></ul> |
|[PlayFabEventsUnity](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/Unity/PlayFabEventsUnity) | Android, iOS, PC | Unity |This sample demonstrates sending events from within a Unity title. The sample covers player events, title events and character events. | <ul><li>Events</li></ul> |
|[PlayFabLeaderboardsUnity](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/Unity/PlayFabLeaderboardsUnity) | Android, iOS, PC | Unity | This sample demonstrates reading and writing from/to leaderboards from within a Unity title. The sample covers lowest score/best time, high score and cumulative score leaderboards. | <ul><li>Leaderboards</li></ul> |
|[SpaceRumble](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/Unity/SpaceRumble) | Android, iOS, PC | Unity | This sample demonstrates a simple single-player mobile game. | <ul><li>User accounts</li><li>User title data</li><li>Title data</li><li>Events that trigger CloudScript</li><li>Leaderboards</li></ul> |
|[ThunderRumble](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/Win32/ThunderRumble) | PC, Xbox | C++ DirectX Native | This sample demonstrates scalable cloud dedicated server functionality using the PlayFab Multiplayer Servers technology to build a complete end-to-end game experience. | <ul><li>Login</li><li>Matchmaking</li><li>Multiplayer Servers</li></ul> |

