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

# Using Player Publisher Data

## Player Data vs Player Publisher Data

[Player Data](player-data-quickstart.md) is information about a **Player**, specific to a game **Title**. Thus, it should be used for **Title**-specific information, such as saving your **Player's** position in a dungeon, or other game-specific data.

**Player Publisher Data** is data associated with the **Player** account, as opposed to the **Player** account **plus** the **Title**. It is used to save information about a **Player** relevant to all **Titles** in your **Studio** (which may also contain **Title**-specific information, for purposes of cross-**Title** rewards).

All **Titles** within a **Studio** in **PlayFab** share a **Publisher ID** by default, and that **ID** defines this relationship. **Player** accounts exist at the **Publisher** layer, and are shared across all **Titles** with the same **Publisher ID** (and then additionally have distinct **Player** Data per **Title**).

If you need to have **Titles** in a **Studio** that have different **Publisher IDs**, or **Titles** in different **Studios** that share the same **Publisher ID**, you can open a **Ticket** in the [PlayFab community forums](https://community.playfab.com/) and our **Developer Success** team will help you out.

> [!NOTE]
> Please don't confuse **Player Publisher Data** with [Publisher Data](../../config/titledata/using-publisher-data.md) which is **Key/Value Pair** data shared by all **Titles** (it is *not* per-**Player**).

**Player Publisher Data** usage is nearly identical to **Player Data** usage. They are *both* dictionaries mapping a string to a **JSON** blob (or other arbitrary string value).

Our example in this tutorial, [Grant a Reward for Playing Multiple Titles](#grant-a-reward-for-playing-multiple-titles), will demonstrate saving JSON blobs, and focus on a targeted example of why you might use Player Publisher Data.

## Grant a Reward for Playing Multiple Titles

**Rewards** usually involve *other* systems outside of **Player Dat**a, so this example demonstrates awarding **Virtual Currency** for the sake of simplicity.

### Requirements

- A **Player** must sign into *both* **Titles** using the same **Credentials**. One approach is to use **Recoverable Credentials**, as described in our [Login Basics and Best Practices](../../authentication/platform-specific-authentication/login-basics-best-practices.md) tutorial. To add a **Recoverable** login to an anonymous account, see our [Account Linking](../../authentication/linking-unlinking/account-linking-quickstart.md) Quickstart.
- This example requires a working knowledge of [CloudScript](../../automation/cloudscript/writing-custom-cloudscript.md):
  - Our example demonstrates basic data security to avoid **Player** cheating. One could likewise use the **Server API** on a custom game server, if the **Title** makes use of them.
- **Rewards** triggered through **PlayFab** require usage of the appropriate **PlayFab** features. **PlayFab Rewards** can be in the form of [**Virtual Currency**](../../commerce/economy/currencies.md), [**Inventory Items**](player-inventory.md), [**Custom Player Data**](player-data-quickstart.md), [**Statistics**](using-player-statistics.md), etc. Distributing **Rewards** outside of **PlayFab** systems is an advanced topic, and will not be covered in this tutorial.
- It's also recommended that developers use good error handling on all **Server API** calls made from **CloudScript**. This is another advanced topic, which we will cover in a separate tutorial we'll be posting shortly.

### Step 1: Each game reports a login to Publisher Data

Each game needs to report that a login occurred. For the sake of simplicity, our example only provides one reward per **Title**, for each other **Publisher Title** played.

Feel free to expand on the idea with **Counters**, **Timestamps**, or other mechanisms to provide progressive or sequential **Rewards**.

The **CloudScript** that is shown below would need to be present in **every** game in your studio.

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

> [!NOTE]
> This example, in particular,  demonstrates using server.[GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserpublisherinternaldata) and server.[UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata). 

### Step 2: Each game checks for redeemable Rewards

Once you are tracking which **Titles** are played, you need to track and grant the **Rewards**. This **CloudScript** function will check for and grant available **Rewards**, based on having played other **Titles**.

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
> This particular example demonstrates the use of server.[GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserpublisherinternaldata) (requesting multiple **Keys**), server.[UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata), and server.[AddUserVirtualCurrency](xref:titleid.playfabapi.com.server.playeritemmanagement.adduservirtualcurrency).

The code blocks represent these steps:

- Fetching the data from **PlayFab**, and parsing it into local data structures (calling [GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserpublisherinternaldata)).
- Examining the data and search for un-rewarded **Title IDs**.
- Granting the **Rewards** (calling [AddUserVirtualCurrency](xref:titleid.playfabapi.com.server.playeritemmanagement.adduservirtualcurrency)).
- Updating the claimed **Rewards** (calling [UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata)).
- Making the rewarded amount available to the **Client** (via return statement from **CloudScript**).

## Conclusion

**Player Publisher Data** and **Player Data** are structurally identical.

**Player Data** should be **Title**-specific, while **Player Publisher Data** should *only* contain information relevant across all of your **Titles**.
