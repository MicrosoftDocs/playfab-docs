---
title: How to use player publisher data to grant a reward for playing multiple titles
author: DanBehrendt
description: Tutorial that describes how to create and use player publisher data.
ms.author: joanlee
ms.date: 10/26/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, publisher data
ms.localizationpriority: medium
---

# How to use player publisher data to grant a reward for playing multiple titles

Rewards usually involve *other* systems outside of player data, so this example demonstrates awarding virtual currency for the sake of simplicity.

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- A player must sign into *both* titles using the same credentials. One approach is to use **Recoverable Credentials**, as described in our [Login Basics and Best Practices](../authentication/login/login-basics-best-practices.md) tutorial. To add a **Recoverable** login to an anonymous account, see our [Account Linking](../authentication/login/quickstart.md) tutorial.
- This example requires a working knowledge of [CloudScript](../automation/cloudscript/writing-custom-cloudscript.md):
  - Our example demonstrates basic data security to avoid player cheating. One could likewise use the server API on a custom game server, if the title makes use of them.
- Rewards triggered through PlayFab require usage of the appropriate PlayFab features. PlayFab Rewards can be in the form of [**Virtual Currency**](../economy/tutorials/currencies.md), [**Inventory Items**](player-inventory.md), [**Custom Player Data**](quickstart.md), [**Statistics**](using-player-statistics.md), etc. Distributing rewards outside of PlayFab systems is an advanced topic, and is not covered in this tutorial.

We also recommended that developers use good error handling on all server API calls made from CloudScript.

## Each game reports a login to publisher data

Each game needs to report that a login occurred. For simplicity, our example only provides *one* reward for each title, for each other publisher title played.

Feel free to expand on the idea with counters, timestamps, or other mechanisms to provide progressive or sequential rewards.

The following CloudScript would need to be present in *every* game in your studio.

```javascript
// CloudScript/Javascript

var PUBLISHER_USED_TITLES_KEY = "playedTitleIds";
handlers.TrackTitleUsage = function () {
    // Get the User Publisher Data for this player, and convert it into our expected format
    var getRequest = { Keys: [PUBLISHER_USED_TITLES_KEY], PlayFabId: currentPlayerId };
    var getResult = server.GetUserPublisherInternalData(getRequest);
    var playedTitlesList = JSON.parse(getResult.Data[PUBLISHER_USED_TITLES_KEY].Value); // format is arbitrary, but this example assumes Array<string>
    if (!playedTitlesList)
        playedTitlesList = [];
    // Check if we've played this title already
    var alreadyPlayed = false;
    for (var i = 0; i < playedTitlesList.length; i++)
        alreadyPlayed = alreadyPlayed || playedTitlesList[i] === script.titleId;
    if (alreadyPlayed)
        return; // Nothing to do
    // Update the list of played titles, and re-save
    playedTitlesList.push(script.titleId);
    var setRequest = { PlayFabId: currentPlayerId, Data: { PUBLISHER_USED_TITLES_KEY: JSON.stringify(playedTitlesList) } };
    server.UpdateUserPublisherInternalData(setRequest);
}
```

In particular, this example demonstrates using:

- server.[GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserpublisherinternaldata)
- server.[UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata).

## Each game checks for redeemable rewards

After you are tracking which titles are played, you need to track and grant the rewards. This CloudScript function will check for and grant available rewards, based on having played other titles.

```javascript
// CloudScript/Javascript

var PUBLISHER_REDEEMED_TITLES_KEY = "redeemedTitleIds";
var MY_CROSS_TITLE_REWARDS = { "AU": 10 };
handlers.CheckCrossTitleRewards = function () {
    // Get the publisher data concerning cross-title rewards for this player
    var getRequest = { Keys: [PUBLISHER_USED_TITLES_KEY, PUBLISHER_REDEEMED_TITLES_KEY], PlayFabId: currentPlayerId };
    var getResult = server.GetUserPublisherInternalData(getRequest);
    var redeemedTitleRewards = JSON.parse(getResult.Data[PUBLISHER_REDEEMED_TITLES_KEY].Value); // format is arbitrary, but this example assumes { [key: string]: Array<string> }
    if (!redeemedTitleRewards)
        redeemedTitleRewards = {};
    var playedTitlesList = JSON.parse(getResult.Data[PUBLISHER_USED_TITLES_KEY].Value); // format is arbitrary, but this example assumes Array<string>
    if (!playedTitlesList)
        playedTitlesList = [];

    // Determine which titles are un-redeemed
    var unredeemedTitleIds = [];
    for (var i = 0; i < playedTitlesList.length; i++) {
        if (!redeemedTitleRewards.hasOwnProperty(playedTitlesList[i]) && playedTitlesList[i] !== script.titleId)
            unredeemedTitleIds.push(playedTitlesList[i]);
    }
    if (unredeemedTitleIds.length === 0)
        return null; // Nothing to redeem

    // Give the cross title rewards
    var multiplier = unredeemedTitleIds.length;
    var actualRewards = {}; // MY_CROSS_TITLE_REWARDS is a global constant, so don't modify it or you'll mess up future calls
    // Please note that the number of API calls that may be made from CloudScript, as well as the total available processing time is limited,
    // and so the number of rewards should be as small as possible (only one VC, in this case)
    for (var eachKey in MY_CROSS_TITLE_REWARDS) {
        actualRewards[eachKey] = MY_CROSS_TITLE_REWARDS[eachKey] * multiplier;
        server.AddUserVirtualCurrency({ PlayFabId: currentPlayerId, VirtualCurrency: eachKey, Amount: MY_CROSS_TITLE_REWARDS[eachKey] }); // Can only add 1 VC at a time
    }

    // Save the Publisher data indicating rewards are claimed
    redeemedTitleRewards[script.titleId] = playedTitlesList;
    var setRequest = { PlayFabId: currentPlayerId, Data: { PUBLISHER_REDEEMED_TITLES_KEY: JSON.stringify(redeemedTitleRewards) } };
    server.UpdateUserPublisherInternalData(setRequest);

    // Tell the client the reward
    return actualRewards;
};
```

> [!NOTE]
> This particular example demonstrates the use of server.[GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserpublisherinternaldata) (requesting multiple keys), server.[UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata), and server.[AddUserVirtualCurrency](xref:titleid.playfabapi.com.server.playeritemmanagement.adduservirtualcurrency).

The code blocks represent these steps:

- Fetching the data from PlayFab, and parsing it into local data structures (calling [GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserpublisherinternaldata)).
- Examining the data and search for un-rewarded title IDs.
- Granting the rewards (calling [AddUserVirtualCurrency](xref:titleid.playfabapi.com.server.playeritemmanagement.adduservirtualcurrency)).
- Updating the claimed rewards (calling [UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata)).
- Making the rewarded amount available to the client (via return statement from CloudScript).

## Conclusion

Player publisher data and player data are structurally identical.

Player data should be *title-specific*, while player publisher data should *only* contain information relevant across all of your titles.

## See also

[Simple In-Game Cross Promotion](https://github.com/PlayFab/PlayFab-Samples/tree/master/Recipes/SimpleCrossPromotion): Reward players participating in more than one of your games.
