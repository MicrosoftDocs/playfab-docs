---
title: Friends Lists
author: v-thopra
description: Tutorial that describes how to create and use friends lists.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, social, friends lists
ms.localizationpriority: medium
---

# Friends Lists

**Friends Lists** are a great feature for improving your **Player's** ability to socialize. They're simple to work with, and can make **Leaderboards** more engaging for your users.

## Prerequisites

**SDK: Unity**

- The **Title ID** is set in the **PlayFabSharedSettings** object.
- The project can successfully log in a **User**.
- The **Title** has at least two registered **Users**.

## About Friends

Any **Player** in your **Title** may be friends with any other **Player** in your **Title**. Notably, friendship on **PlayFab** is a one-way street.

If **Albert** adds **Bob** as a **Friend**, there is *no* approval process for **Bob**, and **Bob** may be unaware.

**Bob** must separately add **Albert** for the friendship to be *mutual*. If you wish to have **Reciprocity Rules**, it is your **Title's** responsibility to enforce these conditions with a custom game server or **CloudScript** logic, if necessary.

In the event that a **Player** has linked their **Steam** or **Facebook** account, their platform-specific **Friends** can also be displayed, if those **Friends** also play your **Title**.

## Making friends

The example code will be using the functions `DisplayFriends()` and `DisplayError(string error)` as a proxy of your app's **UI**. You can paste these into your editor to get it to work without any extra effort, or replace the calls with your own code.

```csharp
void DisplayFriends(List<FriendInfo> friendsCache) { friendsCache.ForEach(f => Debug.Log(f.FriendPlayFabId)); }
void DisplayPlayFabError(PlayFabError error) { Debug.Log(error.GenerateErrorReport()); }
void DisplayError(string error) { Debug.LogError(error); }
```

1. Once a **Player** has logged in, they can access your **UI** for **Friends**. The functionality probably includes **adding**, **removing**, and **displaying friends**, at a minimum.
2. To get the **Player's** current **Friends** list, use the [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist) **API** call.

```csharp
List<FriendInfo> _friends = null;

void GetFriends() {
    PlayFabClientAPI.GetFriendsList(new GetFriendsListRequest {
        IncludeSteamFriends = false,
        IncludeFacebookFriends = false
    }, result => {
        _friends = result.Friends;
        DisplayFriends(_friends); // triggers your UI
    }, DisplayPlayFabError);
}
```

The [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist) result contains a parameter **Friends** which is a list of [FriendInfo](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.FriendInfo) objects.

3. To add a **Friend** to the **Player's Friends** list, use the [AddFriend](xref:titleid.playfabapi.com.client.friendlistmanagement.addfriend) **API** call.

```csharp
enum FriendIdType { PlayFabId, Username, Email, DisplayName };

void AddFriend(FriendIdType idType, string friendId) {
    var request = new AddFriendRequest();
    switch (idType) {
        case FriendIdType.PlayFabId:
            request.FriendPlayFabId = friendId;
            break;
        case FriendIdType.Username:
            request.FriendUsername = friendId;
            break;
        case FriendIdType.Email:
            request.FriendEmail = friendId;
            break;
        case FriendIdType.DisplayName:
            request.FriendTitleDisplayName = friendId;
            break;
    }
    // Execute request and update friends when we are done
    PlayFabClientAPI.AddFriend(request, result => {
        Debug.Log("Friend added successfully!");
    }, DisplayPlayFabError);
}
```

4. To remove a **Player** from a **Player's Friends** list, use the [RemoveFriend](xref:titleid.playfabapi.com.client.friendlistmanagement.removefriend) **API** call.

```csharp
// unlike AddFriend, RemoveFriend only takes a PlayFab ID
// you can get this from the FriendInfo object under FriendPlayFabId
void RemoveFriend(FriendInfo friendInfo) {
    PlayFabClientAPI.RemoveFriend(new RemoveFriendRequest {
        FriendPlayFabId = friendInfo.FriendPlayFabId
    }, result => {
        _friends.Remove(friendInfo);
    }, DisplayPlayFabError);
}
```

## Going Further

There are other things you can do with **Friends** besides **adding**, **removing**, and **displaying**.

### Tagging Friends

The [FriendInfo](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.FriendInfo) object, retrieved from [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist), includes a list of tags for the **Friend**. When updating the list, you would want to add and remove from this list and include it in the **API** call, as follows:

```csharp
// this REPLACES the list of tags on the server
// for updates, make sure this includes the original tag list
void SetFriendTags(FriendInfo friend, List<string> newTags)
{
    // update the tags with the edited list
    PlayFabClientAPI.SetFriendTags(new SetFriendTagsRequest
    {
        FriendPlayFabId = friend.FriendPlayFabId,
        Tags = newTags
    }, tagresult => {
        // Make sure to save new tags locally. That way you do not have to hard-update friendlist
        friend.Tags = newTags;
    }, DisplayPlayFabError);
}
```

You can use tags to inform matchmaking, (for example, the **Player** doesn't like playing with **Friends** tagged **2tuff** at hard difficulty) implement "**Friend Groups**, or just use them to store any metadata associated with a relationship that you need.

> [!NOTE]
> **PlayFab** currently does not index these tags in any way. [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist) can't filter based on them, so that must be done locally. Keep this in mind when considering any performance implications resulting from this system.

### Friend Leaderboards

**Friend**-specific **APIs** mirror the standard [GetLeaderboard](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboard) and [GetLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboardaroundplayer) **API** calls, but restrict the **Player** pool to the **Player's Friends** list. For more information, refer to our tutorials about [Tournaments and Leaderboards](../tournaments-leaderboards/tutorials.md).

Of note is that the [GetFriendLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getfriendleaderboardaroundplayer) **API** does not base the center of the **Leaderboard** around the currently logged in **Player** - it can be *any* **PlayFab ID** supplied with the request.

You can use this to allow **Player** to look up any **Friend** location on the **Leaderboard**, regardless of their distance from each other.
