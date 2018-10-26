---
title: Friends Lists
author: v-thopra
description: Tutorial that describes how to create and use friends lists.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: gaming
ms.technology: playfab
keywords: playfab
ms.localizationpriority: medium
---

# Friends Lists

Friends lists are a great feature for improving your players' ability to socialize. They're simple to work with and can make leaderboards more engaging for your users.

## Prerequisites

SDK: Unity

- The title ID is set in the PlayFabSharedSettings object.
- The project can successfully log in a user.
- The title has at least two registered users.

## About Friends

Any player in your title may be friends with any other player in your title. Notably, friendship on PlayFab is a one-way street. If Albert adds Bob as a friend, there is no approval process for Bob, and Bob may be unaware. Bob must separately add Albert for the friendship to be mutual. If you wish to have reciprocity rules, it is your title's responsibility to enforce these conditions with a custom game server or CloudScript logic, if necessary.

In the event that a player has linked their Steam or Facebook account, their platform specific friends can also be displayed, if those friends also play your title.

## Making friends

The example code will be using the functions `DisplayFriends()` and `DisplayError(string error)` as a proxy of your app's UI. You can paste these into your editor to get it to work without any extra effort, or replace the calls with your own code.

```csharp
void DisplayFriends(List<FriendInfo> friendsCache) { friendsCache.ForEach(f => Debug.Log(f.FriendPlayFabId)); }
void DisplayPlayFabError(PlayFabError error) { Debug.Log(error.GenerateErrorReport()); }
void DisplayError(string error) { Debug.LogError(error); }
```

1. Once a player has logged in, they can access your UI for friends. The functionality probably includes adding, removing, and displaying friends, at a minimum.
2. To get the player's current friends list, use the [GetFriendsList](https://api.playfab.com/documentation/Client/method/GetFriendsList) API call.

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

The [GetFriendsList](https://api.playfab.com/documentation/client/method/GetFriendsList) result contains a parameter "Friends" which is a list of [FriendInfo](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.FriendInfo) objects.

3. To add a friend to the player's friends list, use the [AddFriend](https://api.playfab.com/documentation/Client/method/AddFriend) API call.

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

4. To remove a player from a player's friends list, use the [RemoveFriend](https://api.playfab.com/documentation/Client/method/RemoveFriend) API call.

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

There are other things you can do with friends besides adding, removing, and displaying.

### Tagging Friends

The [FriendInfo](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.FriendInfo) object, retrieved from [GetFriendsList](https://api.playfab.com/documentation/Client/method/GetFriendsList), includes a list of tags for the friend. When updating the list, you would want to add and remove from this list and include it in the API call, as follows:

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

You can use tags to inform matchmaking, (for example, the player doesn't like playing with friends tagged "2tuff" at hard difficulty) implement "friend groups," or just use them to store any metadata associated with a relationship that you need.

An important note is that PlayFab currently does not index these tags in any way. [GetFriendsList](https://api.playfab.com/documentation/Client/method/GetFriendsList) can't filter based on them, so that must be done locally. Keep this in mind when considering any performance implications resulting from this system.

### Friend Leaderboards

Friend specific APIs mirror the standard [GetLeaderboard](https://api.playfab.com/documentation/Client/method/GetLeaderboard) and [GetLeaderboardAroundPlayer](https://api.playfab.com/documentation/Client/method/GetLeaderboardAroundPlayer) API calls, but restrict the player pool to the player's friends list. For more information, refer to our tutorials about [Tournaments and Leaderboards](../tournaments-leaderboards/tutorials.md).

Of note is that the [GetFriendLeaderboardAroundPlayer](https://api.playfab.com/documentation/Client/method/GetFriendLeaderboardAroundPlayer) API does not base the center of the leaderboard around the currently logged in player: it can be any PlayFab ID supplied with the request. You can use this to allow players to look up any friend's location on the leaderboard, regardless of their distance from each other.
