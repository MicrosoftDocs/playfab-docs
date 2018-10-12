# Push Notification basics

Push notifications give you a channel to send an immediate, customized, message to your player’s home screen. Using PlayFab's push feature, you may send unlimited push notifications to any number of devices completely free of charge. As a general guideline, always tell players up front how you will be using the push notification service. Explaining how your game rewards or communicates via push notification can be the difference in building community engagement versus driving players away.

![Android device - Notifications screen](../media/tutorials/android-notifications-screen.png)  

A screenshot from an Android device's Notifications area showing a push notification.

## The Push Notification system

Push notifications are possible due to a delicate linkage of three major systems:

1. The vendor-specific channel ( Google, Apple, etc )
2. The player’s OS / device (Android, iOS, etc)
3. Cross-platform message routing (PlayFab via Amazon Simple Notification Service (SNS))

If any of these systems are unlinked, clients will stop getting notifications. It is fairly simple to accidentally change one of the three systems and thereby break the link. Furthermore, it is difficult to know at any individual point in the flow if all of the systems are configured properly.

## The PlayFab push routing system

Every PlayFab title can enable one Google (GCM) and one Apple Push (APNS, APNS_SANDBOX) notification channel at a given time. This can be configured one of two ways:

1. Using the UI in Game Manager under **Settings -> Push Notifications**.
2. Using the PlayFab Admin API - [SetupPushNotification](https://api.playfab.com/documentation/Admin/method/SetupPushNotification).

For more detailed setup information, read these tutorials:

- [Push notifications for Android](push-notifications-for-android.md)
- [Push notifications for iOS](push-notifications-for-ios.md)

## Push messages in-game

This step will vary based on the development engine / platform; however, the easiest way to receive push notifications is using a Unity project with our SDK and the Firebase Cloud Messaging (FCM) plugin for Android, or just Unity for iOS.

- **Receiving push on Android** - requires a plugin, the best supported plugin is the native FCM plugin
- **Receiving push on iOS** - does not require a plugin for basic push messages

Please see the FCM Documentation for instructions on how to set up the [FCM Unity plugin](https://firebase.google.com/docs/cloud-messaging/unity/client), or push on [Android Studio](https://firebase.google.com/docs/cloud-messaging/android/client).

## Testing the setup

After configuring your title and client, you can test your configuration using the PlayFab Server API - [SendPushNotification](http://api.playfab.com/documentation/Server/method/SendPushNotification). This API allows you to send as many push notifications as needed at no extra cost. You can use PlayFab's Cloud Script service as a quick and secure server API environment. From there, push notifications can be sent as needed. To use this method to test your configuration, upload or append the code in the following example to your title’s Cloud Script.

### Example

Consider the following scenario: players in your title may access a Leaderboard based on "Rank" statistics. Each player may pay 1 CH currency and challenge another player who is up to 5 positions away from the current player.

First, consider a virtual currency as shown in the following screenshot (see the [Currencies](https://api.playfab.com/docs/tutorials/landing-commerce/currencies) tutorial for information on how to define a virtual currency):

![PlayFab Economy - Currencies - New Currency](../media/tutorials/playfab-new-currency.png)

Now, consider the following Statistics defined for each player (see the [Accessing archived tournament results](https://api.playfab.com/docs/tutorials/landing-tournaments/result-archive) tutorial for information on how to generate a test leaderboard):

![PlayFab player Statistics - Rank](../media/tutorials/playfab-statistics-player-rank.png)  

Once you've set up these prerequisites, you can set up a push-notification challenge system:

The following client code will call the Cloud Script "ChallengePlayer":

```csharp
public void ChallengeRandomClosePlayer(string currentPlayerId) {
    PlayFabClientAPI.GetLeaderboardAroundPlayer(new GetLeaderboardAroundPlayerRequest() {
        MaxResultsCount = 10,
        StatisticName = "Rank",
        PlayFabId = currentPlayerId,
    }, result => OnLeaderboardLoaded(result,currentPlayerId),OnPlayFabError);
}

private void OnLeaderboardLoaded(GetLeaderboardAroundPlayerResult leaderboard, string currentPlayerId) {
    var index = (int)(UnityEngine.Random.value * (leaderboard.Leaderboard.Count-1));
    if (leaderboard.Leaderboard[index].PlayFabId == currentPlayerId)
        index = (index + 1) % leaderboard.Leaderboard.Count;
    var targetId = leaderboard.Leaderboard[index].PlayFabId;

    PlayFabClientAPI.ExecuteCloudScript(new ExecuteCloudScriptRequest() {
        FunctionName = "ChallengePlayer",
        FunctionParameter = new Dictionary<string, object>() {
            { "TargetId", targetId }
        }
    }, null, OnPlayFabError);
}

public void OnPlayFabError(PlayFabError obj) {
    Debug.Log(obj.GenerateErrorReport());
}
```

The "ChallengePlayer" Cloud Script code will handle the request, validate leaderboard state, and send the challenge push-notification to the target:

```csharp
handlers.ChallengePlayer = function (args) {
    var targetId = args.TargetId;
    var leaderboard = server.GetLeaderboardAroundUser({
        MaxResultsCount : 10,
        PlayFabId : currentPlayerId,
        StatisticName : "Rank"
    });

    for(var i = 0; i < leaderboard.Leaderboard.length; i++) {
        var target = leaderboard.Leaderboard[i];
        if(target.PlayFabId !== targetId) continue;

        // subtract virtual currency from current player
        server.SubtractUserVirtualCurrency({
            VirtualCurrency : "CH",
            PlayFabId : currentPlayerId,
            Amount : 1
        });

        // get current player profile
        var profile = server.GetPlayerProfile({
            PlayFabId : currentPlayerId
        }).PlayerProfile;

        // try to send push notification
        try {
            server.SendPushNotification({
                Recipient : targetId,
                Package : {
                    Message : `${profile.DisplayName} challenges you for a battle!`,
                    Title: "You have been challenged",
                }
            });
        } catch (ex) {
            // Target player has not registered for Push Notifications
        }
        return;
    }
}
```

## Push Notification Best Practices

This is an awesome power. When abused, however, it can drive away users and cause them to not only opt out of future notifications but to leave a game entirely. If used judiciously, though, push notifications can be one of your best tools for building and maintaining your game's community.

Push notifications are a fire and forget message protocol, similar in vein to UDP. There is no guarantee that your players will receive, open, or engage with your message. With that caveat, it is a good practice to use messages as bonus content rather than as a critical part of your gameplay loop.

For iOS platforms, apps are given a one-time dialog prompt from the OS allowing the user to determine the status of push notifications. After the user has made their initial selection, this setting will persist until:

- The app is updated or reinstalled.
- The user makes changes to the settings from their phone’s settings menu.

For Android apps, notifications are enabled by default and can be turned on and off at will from the client. It is a good practice, however, to re-initialize your notification listeners with every session.

## Resources

The following resources provide additional information about the topics in this tutorial.

- [Firebase Unity SDK](https://firebase.google.com/docs/unity/setup): All-in-one FCM solution for Unity. This SDK, among all other features, allows you to receive and process push notifications sent via FCM.
- [Push It Real Good: How to Get Players to Say Yes to Push Notifications](https://blog.playfab.com/blog/push-it-real-good-how-get-players-say-yes-push-notifications/): This blog post details additional strategies and techniques for using push notifications.
- [Push Notifications](https://blog.playfab.com/blog/push-sep-17): This blog post describes the most recent upgrade in push functionality and switching to FCM as the primary plugin for Android.
- [Execute PlayFab API via Postman](https://api.playfab.com/docs/tutorials/execute-playfab-api-via-postman): This tutorial shows you how to test our APIs using Postman.
