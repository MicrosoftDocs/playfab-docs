---
title: Getting started with rewarded Ads.
author: williacj
description: Getting started with rewarded Ads guide.
ms.author: cjwill
ms.date: 01/31/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, ads, ad rewards
ms.localizationpriority: medium
---


# Setup a Placement

In the Ads tab, you’ll see the main dashboard for your ads first. Basic KPIs for your ads are shown here, along with a graph showing your recent ad events (they also show up in the PlayStream Debugger and Event History pages). At the top, click on Ad Placements.

Ad placements are the most fundamental part of the system. A single placement should be thought of as an “ad position”. That is, the type of ad that will be displayed (banner, video, etc.) and at what point in the game the player will see it (level interstitial, as a result of clicking on a “show me an ad”, etc.). Go ahead and name your placement whatever you like, and enter the Application ID and Advertising Unit type from your ad provider (if you’re not sure what to enter from your specific provider, let us know and we can work out the details with you).

Finally, you’ll need to add your specific rewards. For each possible reward for this placement, click on New Reward. Give your reward a name and enter any description text and asset package URL you want returned to the client when the specific reward is given. Then, under Actions, click Add Action. Just as you can with regular PlayStream actions, you can take a number different actions right now - running a Cloud Script handler, granting items, etc. Usually, you’ll be granting virtual currency or items here, but if you want to make use of the other action types, go right ahead - it’ll all be processed the same way it is for a normal PlayStream action trigger.

Once you have at least a couple of rewards defined, go ahead and set the odds on them, so that you have the random distribution set up how you like. If you’ve defined Segments for your title, you can also set overrides in the Segment Assignment tool below Rewards. So for example, if you have a certain group of players that you want to always get a specific reward, just set that segment to that reward in the assignment list. The segment assignments are in priority order, so the first segment that matches one for the current player is the one that will be used. For example, here’s an ad placement that provides bonus experience points 30% of the time, and a “key” item 70% of the time.

 ![Game Manager - Stores - Segment Overrides](media/ads-tab-in-game-manager.png)

Notice that there’s also a “gems” reward that’s set to 0%. If you look at the Segment Assignment in our example, you’ll see how we’re using this. Going in priority order, if the player is in the “High XP Players” group, the normal random selection is made. But if the player isn’t in that segment, but is in the “VIP players” segment, we grant that player the “gems” reward.

Finally, you have the option to limit the number of times the player can be rewarded for an ad. In our example, we limited this to 4 times per day, per player (daily resets on this counter occur at 00:00 UTC), but you could set it to a given number of times every hour or 2 hours as well, currently.

## Retrieving the Ad Placements

Once you have at least one ad placement defined, you can query for a list of available placements using Client/GetAdPlacements. Specifying an Identifier in the call will ensure that you only get information on the given placement. If you do want to filter to a specific placement, you can use either the name you defined for it (above), or the PlayFab-generated unique identifier for the placement (which you can see in the URL, in the example above). Otherwise, all available placements for which the player has a valid reward, including the reward for the player, the number of views currently remaining, and the time to reset the view limit will be returned as AdPlacementDetails.
Once you have selected an ad placement in the client code, make sure to save the PlacementId and RewardId. You’ll be using those for the next two stages.

## Reporting Ad Activity

As you use ads, your ad SDK should be reporting on their activity using Client/ReportAdActivityRequest. We define four activity states - “Opened”, “Closed”, “Start”, and “End”. These should line up to the relevant callbacks in your ad SDK, and should ideally be wired into the SDK directly. As part of pre-integrating ad mediation networks post-beta, we’ll be making this as simple as possible, but for this beta, you’ll need to set up these calls as part of setting up your calls into your chosen ad SDK.

## Rewarding Ad Activity

Once the ad has been completed successfully according to the ad SDK you’re using, you’ll finally call Client/RewardAdActivity to trigger the reward. This call requires the PlacementId and RewardId, and it first checks that the reward is valid, then processes it for the player. Any items are granted immediately, and the call then returns a complete set of changes made to the player by the Grant Item, Grant Virtual Currency, and Increment Player Statistic actions.

Finally, it’s important to note that the RewardId is not bound to the player as part of the call to GetAdPlacements. If it is called multiple times, the reward may change, based on the weightings you’ve provided, and the call to RewardAdActivity only requires that the reward be valid for the player - not that it was the last one returned from GetAdPlacements.
