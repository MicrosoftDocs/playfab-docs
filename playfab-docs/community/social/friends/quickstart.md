---
title: Friends lists
author: joannaleecy
description: Tutorial that describes how to create and use friends lists.
ms.author: joanlee
ms.date: 10/26/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, friends lists
ms.localizationpriority: medium
---

# Friends lists

Friends lists are a great feature for improving your players' ability to socialize. They're easy to work with, and can make leaderboards more engaging for your users.

## Prerequisites

### SDK: Unity

- The title ID is set in the `PlayFabSharedSettings` object.
- The project can successfully log in a user.
- The title has at least two registered users.

## About friends

Any player in your title may be friends with any other player in your title. Notably, friendship on PlayFab is a one-way street.

If **Albert** adds **Bob** as a friend, there is *no* approval process for **Bob**.  In fact, **Bob** may be unaware.

**Bob** must separately add **Albert** for the friendship to be *mutual*. If you wish to have reciprocity rules, it is your title's responsibility to enforce these conditions with a custom game server or CloudScript logic, if necessary.

In the event that a player has linked their Steam, Facebook, or Xbox Live account, their platform-specific friends can also be displayed, if those friends also play your title.

## Making friends
The example code uses the functions `DisplayFriends()`, and `DisplayError(string error)` as a proxy of your app's UI. You paste these into your editor to get it to work without any extra effort - or replace the calls with your own code.

```csharp
void DisplayFriends(List<FriendInfo> friendsCache) { friendsCache.ForEach(f => Debug.Log(f.FriendPlayFabId)); }
void DisplayPlayFabError(PlayFabError error) { Debug.Log(error.GenerateErrorReport()); }
void DisplayError(string error) { Debug.LogError(error); }
```

1. Once a player logs in, they can access the UI for friends. The functionality usually includes adding, removing, and displaying friends, at a minimum.
2. To get the player's current friends list, use the [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist) API call.

```csharp
List<FriendInfo> _friends = null;

void GetFriends() {
    PlayFabClientAPI.GetFriendsList(new GetFriendsListRequest {
        IncludeSteamFriends = false,
        IncludeFacebookFriends = false,
        XboxToken = null
    }, result => {
        _friends = result.Friends;
        DisplayFriends(_friends); // triggers your UI
    }, DisplayPlayFabError);
}
```

The [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist) result contains a parameter friends which is a list of [FriendInfo](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist#friendinfo) objects.

3. To add a friend to the player's friend list, use the [AddFriend](xref:titleid.playfabapi.com.client.friendlistmanagement.addfriend) API call.

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

4. To remove a player from a player's friends list, use the [RemoveFriend](xref:titleid.playfabapi.com.client.friendlistmanagement.removefriend) API call.

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

## Going further

There are other things you can do with friends besides adding, removing, and displaying.

### Tagging friends

The [FriendInfo](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist#friendinfo) object, retrieved from [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist), includes a list of tags for the friend. When updating the list, you would want to add and remove from this list, and include it in the API call (as shown below).

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

You can use tags to inform matchmaking (for example, the player doesn't like playing with friends tagged **2tuff** at hard difficulty), implement friend groups - or just use them to store any metadata associated with a relationship that you need.

An important note is that PlayFab currently does not index these tags in any way. [GetFriendsList](xref:titleid.playfabapi.com.client.friendlistmanagement.getfriendslist) can't filter based on them, so that must be done locally.

Keep this in mind when considering any performance implications resulting from this system.
