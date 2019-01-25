---
title: Using Player Publisher Data
author: v-thopra
description: Tutorial that describes how to create and use player publisher data.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, publisher data
ms.localizationpriority: medium
---

# Using player publisher data

## Player Data vs Player Publisher Data
[Player Data](quickstart.md) is information about a player, specific to a game title. It should be used for title-specific information, such as saving your player's position in a dungeon, or other game-specific data.

Player publisher data is data associated with the player account, as opposed to the player account *plus* the title. It is used to save information about a player relevant to all titles in your studio (which may also contain title-specific information, for purposes of cross-title rewards).

All titles within a studio in PlayFab share a publisher ID by default, and that ID defines this relationship. Player accounts exist at the publisher layer, and are shared across all titles with the same publisher ID (and then additionally have distinct player data per title).

If you need to have titles in a studio that have different publisher IDs, or titles in different studios that share the same publisher ID, you can open a ticket in the [PlayFab community forums](https://community.playfab.com/) and our **Developer Success** team will help you out.

> [!NOTE]
> Please don't confuse player publisher data with [Publisher Data](../../config/titledata/using-publisher-data.md) which is Key/Value Pair data shared by all titles (it is *not* per-player).

Player publisher data usage is nearly identical to player data usage. They are *both* dictionaries mapping a string to a **JSON** blob (or other arbitrary string value).

Our example in this tutorial, [Grant a reward for playing multiple titles](#grant-a-reward-for-playing-multiple-titles), will demonstrate saving **JSON** blobs, and focus on a targeted example of why you might use player publisher data.

## Grant a reward for playing multiple titles

Rewards usually involve *other* systems outside of player data, so this example demonstrates awarding virtual currency for the sake of simplicity.

### Requirements

- A player must sign into *both* titles using the same credentials. One approach is to use *Recoverable Credentials*, as described in our [Login Basics and Best Practices](../../authentication/platform-specific-authentication/login-basics-best-practices.md) tutorial. To add a *Recoverable* login to an anonymous account, see our [Account Linking](../../authentication/linking-unlinking/quickstart.md) quickstart.
- This example requires a working knowledge of [CloudScript](../../automation/cloudscript/writing-custom-cloudscript.md):
  - Our example demonstrates basic data security to avoid player cheating. One could likewise use the server **API** on a custom game server, if the title makes use of them.
- Rewards triggered through PlayFab require usage of the appropriate PlayFab features. PlayFab Rewards can be in the form of [**Virtual Currency**](../../commerce/economy/currencies.md), [**Inventory Items**](player-inventory.md), [**Custom Player Data**](quickstart.md), [**Statistics**](using-player-statistics.md), etc. Distributing rewards outside of PlayFab systems is an advanced topic, and will not be covered in this tutorial.
- It's also recommended that developers use good error handling on all server **API** calls made from **CloudScript**. This is another advanced topic, which we will cover in a separate tutorial we'll be posting shortly.

### Step 1: Each game reports a login to publisher data

Each game needs to report that a login occurred. For simplicity, our example only provides *one* reward for each title, for each other publisher title played.

Feel free to expand on the idea with counters, timestamps, or other mechanisms to provide progressive or sequential rewards.

The following **CloudScript** would need to be present in *every* game in your studio.

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

### Step 2: Each game checks for redeemable rewards

Once you are tracking which titles are played, you need to track and grant the rewards. This **CloudScript** function will check for and grant available rewards, based on having played other titles.

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
- Making the rewarded amount available to the client (via return statement from **CloudScript**).

## Conclusion

Player publisher data and player data are structurally identical.

Player data should be title-specific, while player publisher data should *only* contain information relevant across all of your titles.
