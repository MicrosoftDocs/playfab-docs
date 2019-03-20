---
title: PubSub Unity quickstart
author: MarcoWilliamsPF
description: Quickstart to using the PubSub feature with Unity.
ms.author: mawillia
ms.date: 12/21/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, pubsub, Unity
ms.localizationpriority: medium
---

# PubSub Unity quickstart

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

The purpose of this topic is to explain how to quickly get started with using the PubSub client for Unity. In this guide, we will show you step-by-step how to connect to the PubSub hub and subscribe to topics. Then we will show you how to receive your first message.

## Prerequisites

- **Unity 2018** - This package currently only works with Unity 2018 or later.

- **PlayFab SDK for Unity** - To use this package, you must be familiar with the PlayFab SDK and have it already installed. Please be sure to have the latest PlayFab SDK installed.

- **PlayFab Authentication** - To use this package, you must also be familiar with authenticating in PlayFab.

- **Unity .Net 4.X** - This package uses 4.x within Unity. Your project must be set to 4.x in **PlayerSettings**.

- **Setup PubSub policies** - You will need to setup PubSub policies in order to receive events on the clients. If you have not setup a policy yet, please visit [PubSub policies](pubsub-policies.md) to learn more.

## Installation

The PubSub feature does not come with the PlayFab SDK by default and you must acquire it via GitHub from our site.

> [!IMPORTANT]
> **Private preview only.**  While this feature is in [Private Preview](pubsub-private-preview-notes.md), you must be logged into GitHub for the package to download and install correctly.

### Install from GitHub

1. Login to GitHub.

2. Go to [GitHub: PlayFab PubSub](https://github.com/PlayFab/UnitySignalRBetaSdk/releases/download/0.0.1/PubSub.unitypackage) - If you don't have access to this repository, please speak with your PlayFab contact.

3. If the above link didn't automatically download, then you can click on the releases tab and download the latest released distribution package. You may also obtain updates from this location.

4. In Unity select **Assets, Import Package, Custom Package** and open the **PubSub.unityPackage** you downloaded.

5. Click **Import All** to import all the files into your Unity Project.

### Enable PubSub

To enable PubSub, perform the following:

1. Select **Settings**, **API**.

2. Check the boxes for both the Client and the Entity API. This will display the Feature sub-menu.

3. Check the boxes to **Enable Unstable Features** and **Enable PubSub**. You can then read information about the PubSub package specifically, on the Packages tab.

## Usage

Using the PubSub plugin is pretty easy. If you have not looked at our reference for this feature, you should get familiar with it at [PubSub client API](pubsub-reference.md).

1. **Initializing PubSub** - While you can initialize the plugin at any time in your code, we recommend that you initialize in either the `start` or `awake` method. When just getting started it also helps to set `Debugging` to true.

   ```csharp
   PlayFabSocketsAPI.Debugging = true;
   PlayFabSocketsAPI.Initialize();
   ```

2. **Authenticate** - Before you can use the PubSub feature, you must authenticate your client via PlayFab. For more information about Authenticating, please go to [Platform-Specific Authentication](../../authentication/platform-specific-authentication/index.md) to learn more.

    When you authenticate, you must store your Entity Key for later usage. In addition, this is when you want to start your connection by using the `PlayFabSocketsAPI.Connect()` method.

   ```csharp
   private EntityKey _currentEntity;

   private void OnAuthenticated(LoginResult result)
   {
       Debug.Log("Logged In");
       _currentEntity = result.EntityToken.Entity;
       _playFabId = result.PlayFabId;
       PlayFabSocketsAPI.Connect();
   }
   ```

3. **Event subscriptions** - You will want to subscribe to connection, disconnection, and connection error events.

   ```csharp
   PlayFabSocketsAPI.OnConnected.AddListener(OnSocketsConnected);
   PlayFabSocketsAPI.OnConnectionError.AddListener(OnSocketsConnectionError);
   PlayFabSocketsAPI.OnDisconnected.AddListener(OnSocketsDisconnected);
   ```

   And you will need handlers for each of these events.

   ```csharp
   private void OnSocketsConnected()
   {
       // We will subscribe to topics and register handlers here
   }

   // Here we are just going to log a message to the console for disconnection and errors
   private void OnSocketsDisconnected()
   {
       Debug.Log("PlayFab Sockets:You were disconnected from the server");
   }

   private void OnSocketsConnectionError(PlayFabError error)
   {
       Debug.LogFormat("PlayFab Sockets Error: {0}", error.GenerateErrorReport());
   }
   ```

4. **Create a topic message** - To create a topic, we must create an Entity Object and a Topic object to pass to the Subscribe method. In this example, we will use the current logged in Player's Entity. You will put this code in the ``OnSocketsConnected()`` method you defined in step 3.

   ```csharp
   //First we must transform your EntityKey that you received at login, to the proper Entity Object
   var entity = new PlayFab.Sockets.Models.Entity()
   {
       Id = _currentEntity.Id,
       Type = _currentEntity.Type
   };
   //Create a list of Topics to subscribe to
   var topics = new List<Topic>();

   //Create a Topic object to listen to
   var objectChangeTopic = new Topic()
   {
       Entity = entity,
       EventName = "custom_event_name",
       EventNamespace = "com.playfab.events.mygame"
   };
   //Add that topic to the array
   topics.Add(objectChangeTopic);
   ```

5. **Register a Handler** - Register a handler for when your event is received. Add the following after you create your Topic:

   ```csharp
   PlayFabSocketsAPI.RegisterHandler(customEventTopic, OnCustomEvent);
   ```

6. **Create a Handler Method** - Be sure to define the method that you registered in the previous step. In this example we are just logging the received JSON payload. You can use `var myMessage = netMsg.ReadMessage<T>` where T is a model you want to de-serialize to make this a strongly typed object.

   ```csharp
   private void OnCustomEvent(PlayFabNetworkMessage netMsg)
   {
       Debug.Log(netMsg.PayloadJSON);
   }
   ```

7. **Subscribe to topic(s)** - Now that you have topics you want to subscribe to, we need to notify the PubSub service that we want to receive these events. This requires that you have setup a policy to allow this. For more information, see [PubSub policies](pubsub-policies.md).

   ```csharp
   //send topic subscriptions and output any success or failures
   PlayFabSocketsAPI.Subscribe(topics, (subscribedTopics) =>
   {
       Debug.Log("Subscribe Success");

       subscribedTopics.ForEach((t) =>
       {
           Debug.LogFormat("{0} Subscribed Successfully", t.EventName);
       });
   }, (subscribedErrors) =>
   {
       Debug.Log("Subscribe Failed");

       subscribedErrors.ForEach((t) =>
       {
           Debug.LogFormat("{0}", t.Message);
       });
   });
   ```

## Example usage

In this example, we will use a custom CloudScript function to increment a statistic, **Score**, and then push a message to the player with the updated player statistics via PubSub.

1. First we need to create a statistic for Players. This is done under [Leaderboards](../../social/tournaments-leaderboards/index.md). Click on **Leaderboards** and create a new leaderboard with the following settings:

   ![Leaderboard Statistic Setup](images/leaderboard-setup-score.png)

2. We need a [CloudScript](../../automation/cloudscript/index.md) function that you can run on a player to increment the statistic for the player and then fire your custom event. You can edit this directly in PlayFab by going to **Automation --> CloudScript**. Add the following handler to your CloudScript:

   ```javascript

   handlers.CreateCustomEventForPlayer = function(args,context){
     //Get current PlayerId
     var playerId = currentPlayerId;
     //Increment Statistics by 100
     server.UpdatePlayerStatistics({
       PlayFabId:playerId,
       Statistics:[
         {
           StatisticName:"Score",
           Value:100
         }
       ]
     });

     var stats = server.GetPlayerStatistics({
       PlayFabId:playerId,
       StatisticNames:"Score"
     });
  
     //Get account info
     var accountInfo = server.GetUserAccountInfo({PlayFabId:playerId});
  
     //Get the Title Player Account
     var titlePlayerAccount = accountInfo.UserInfo.TitleInfo.TitlePlayerAccount;
  
     //Create a TitlePlayerEntity object
     var titleEntity = {
       Id:titlePlayerAccount.Id,
       Type:titlePlayerAccount.Type
     }
  
     //Trigger our event we will receive in PubSub
     var entityEvent = {};
     entityEvent.Entity = titleEntity;
     entityEvent.EventNamespace = "com.playfab.events.mygame";
     entityEvent.Name = "custom_event_name";
     entityEvent.PayloadJSON = JSON.stringify(stats);
     entity.WriteEvents({Events:[entityEvent]});
  
     return stats;
   }
   ```

## Run and test

Now you have all the pieces to run and test your code.

1. Run your project in unity. You should see the following:

   !["Console Output"](images/console.png)

1. Login to [Game Manager](https://developer.playfab.com) and navigate to your player that just logged int.

1. Run the CloudScript method on the player from the CloudScript Tab.

   !["Run CloudScript](images/run-cloudscript-function.png)

1. You should have received a message to your console that is similar to the following.

   !["Console Output"](images/console-result.png)