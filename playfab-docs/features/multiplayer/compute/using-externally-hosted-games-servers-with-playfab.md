---
title: Using Externally Hosted Game Servers with PlayFab
author: v-thopra
description: Tutorial about using externally hosted game servers with PlayFab.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer servers
ms.localizationpriority: medium
---

# Using Externally Hosted Game Servers with PlayFab

## External Game Server Hosting

While PlayFab has always offered custom game server hosting as a paid service on top of Amazon Web Services, we’re aware that some developers would prefer to manage their own servers, using a variety of server providers and server operating systems. To provide for that, we have introduced a new feature: external game server hosting. This tutorial covers everything you need to know to use this feature, and provides advice on best practices in this space.

### Hosting in PlayFab versus Externally

First, it’s important to understand the differences between PlayFab game server hosting and external game server hosting.

PlayFab game servers:

- Are hosted using AWS EC2.
- Are available in any AWS EC2 region, including the US, Europe, Australia, Singapore, Japan, and others.
- Can be provisioned using any EC2 server type; by default are t2.medium.
- Run Windows Server 2012 R2.
- Automatically spin up/down based on demand and capacity needed.
- Have log and output files automatically captured and archived on instance shut-down.
- Are billed monthly on the developer’s PlayFab bill.
- Are monitored by PlayFab; developers can monitor themselves via the NewRelic add-on.

Externally hosted servers:

- Can be hosted by any Game Server Provider (GSP), or on the developer’s own servers.
- Can run any operating system.
- Can be accessed via remote desktop by the developer (if the GSP allows this).
- Are not spun up or down by PlayFab; the GSP (or developer) is responsible for spinning servers up or down based on demand.
- Are not monitored or otherwise administered by PlayFab.
- Log files are not automatically archived via PlayFab.

The key limitations with externally hosted servers are imposed by the fact that the PlayFab Game Wrangler (the service which manages the server host machines) cannot access the servers directly. Specifically, you will need to manage server availability to make sure there is always enough capacity available, and provide for saving log and output files, if desired.

### Setting up External Hosting

Once you’ve made the decision to use externally hosted servers, the setup is easy. In the Settings->API Features tab of the PlayFab Game Manager, select the “Use external game server provider” option and click “Save API Features”. Here, you can also set your server timeout period, which determines how often you need to call RefreshGameServerInstanceHeartbeat (see the following list of [PlayFab API Calls](#playfab-api-calls)) from the server, in order to tell the service to keep it in the active set.

Please be aware that external game server hosting is not designed to work in conjunction with PlayFab custom game server hosting, so turning this option on does mean that no game server hosts will be created in PlayFab.

### PlayFab API Calls

There are three new API methods we’ve added that are specific to external hosting:

- [RegisterGame](xref:titleid.playfabapi.com.server.matchmaking.registergame) - Notifies PlayFab about a new server instance.
- [DeregisterGame](xref:titleid.playfabapi.com.server.matchmaking.deregistergame) - Notifies PlayFab that a server instance is going away.
- [RefreshGameServerInstanceHeartbeat](xref:titleid.playfabapi.com.server.matchmaking.refreshgameserverinstanceheartbeat) - Lets PlayFab know that the server is still running.

In addition, you should be aware of the following API methods:

- [GetCurrentGames](xref:titleid.playfabapi.com.client.matchmaking.getcurrentgames) - Gets the listing of all the active sessions running.
- [Matchmake](xref:titleid.playfabapi.com.client.matchmaking.matchmake) - Finds an open slot in an active server matching the search conditions, if one is available.
- [RedeemMatchmakerTicket](xref:titleid.playfabapi.com.server.matchmaking.redeemmatchmakerticket) - Used by the server to verify that the player’s session is valid, that they joined the server from a legitimate matchmaking call, and provides the server with basic account information for the player.
- [NotifyMatchmakerPlayerLeft](xref:titleid.playfabapi.com.server.matchmaking.notifymatchmakerplayerleft) - Used by the server to tell PlayFab that the player has left the server, opening a slot for matchmaking.
- [SetGameServerInstanceState](xref:titleid.playfabapi.com.server.matchmaking.setgameserverinstancestate) - Provides a way to close a server to matchmaking.
- [SetGameServerInstanceTags](xref:titleid.playfabapi.com.server.matchmaking.setgameserverinstancetags) - Adds tags to server instances that can be used for filtering in matchmaking.
- [SetGameServerInstanceData](xref:titleid.playfabapi.com.server.matchmaking.setgameserverinstancedata) - Sets custom data on a server instance which is returned when querying the list of running servers.

### Registering the Server

Once you’ve selected external game server hosting in your PlayFab Game Manager Settings, game servers can be registered with PlayFab. The way this works is that PlayFab maintains a registry of all game instances running, and which players occupy the slots in those games. Game servers are responsible for adding themselves to that registry, using the RegisterGame API method. For example:

```csharp
public void RegisterGame() {
    PlayFabServerAPI.RegisterGame(new RegisterGameRequest() {
        ServerHost = "118.129.31.244",
        ServerPort = "9984",
        Build = "11_034234.13",
        Region = Region.USEast,
        GameMode = "FreeForAll",
        Tags = new Dictionary<string, string>() {
            {"level_cap", "high"},
            {"no_smoking", "1"},
            {"custom_region", "timbuktu"}
        }
    }, LogSuccess, LogFailure);
}
```

In this case, a server for Title ID AAA is informing PlayFab that it is now available. Clients can query for a list of running games, or for an available slot in a game instance that matches some specified criteria. Apart from the Tags, all the fields you see here are required for the call, so that we have enough information to correctly matchmake players into the game session, and let the client know how to communicate with it.

Even though they are required, the Tags are worth a special mention, as they allow you to specify additional elements that can be used for your matchmaking calls. In particular, it’s worth pointing out the “custom_region” tag we’re using in this example. The Region element of the server must be set to one of the PlayFab-supported regions, but your GSP may have regions that don’t align well to the EC2 regions. The way to handle this is by using a Tag to specify your own custom regions, and then using them in your calls to Matchmake (setting the Region parameter to a consistent value).

The Build, Region, and GameMode parameters are all used exactly as they are in our tutorial on PlayFab’s hosting of [Custom Game Servers](custom-game-servers.md),because they are the primary elements used for matchmaking. Obviously, they're not used the same way, as you're not starting servers in our hosting, but you do still need to upload a Build and set up the GameMode you'll be using, as they are used to check the validity of the call to RegisterGame, and so that the matchmaker knows how many slots are free at any given time (specifically, the Build ID needs to match - you don't need to keep the Build up-to-date, apart from that). For external server hosting, you will not be setting the build to active in any region, however.

As a result of the RegisterGame call, the PlayFab matchmaker assigns the server a LobbyId, which is provided in the response.

```csharp
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
  "code": 200,
  "status": "OK",
  "data": {
    "LobbyId": "8285313"
  }
}
```

The LobbyId is the unique identifier that the game instance needs to use going forward in all calls to PlayFab, as you’ll see below.

### Managing Players and Sessions

Once the game server is up and running, matchmaking works exactly as it does for servers hosted by PlayFab. Calls to [GetCurrentGames](xref:titleid.playfabapi.com.client.matchmaking.getcurrentgames) will return the listing of game servers running, and [Matchmake](xref:titleid.playfabapi.com.client.matchmaking.matchmake) will return the information for the server with an available slot which is the best fit to the player’s search parameters. The player passes the matchmaker ticket returned by Matchmake to that server, which uses [RedeemMatchmakerTicket](xref:titleid.playfabapi.com.server.matchmaking.redeemmatchmakerticket) to validate that the user has a good login, was sent to the server as a result of a valid matchmaking call, and to retrieve the user’s information. That call also tells the PlayFab matchmaker that the player has joined the server, occupying the slot (which is “reserved” for two minutes after the call to Matchmake). When the player has left the server, the occupied slot is then freed up by calling [NotifyMatchmakerPlayerLeft](xref:titleid.playfabapi.com.server.matchmaking.notifymatchmakerplayerleft).

Now, since the PlayFab Game Wrangler has no direct access to your servers, it’s important for them to regularly let the service know that they’re still running. Regardless of whether the server has available slots or not, make sure to call [text](xref:titleid.playfabapi.com.server.matchmaking.refreshgameserverinstanceheartbeat) once every minute, to ensure the server is maintained in the matchmaker’s memory.

```csharp
public void RefreshGameServerInstanceHeartbeat(string lobbyId) {
    PlayFabServerAPI.RefreshGameServerInstanceHeartbeat(new RefreshGameServerInstanceHeartbeatRequest() {
        LobbyId = lobbyId
    }, LogSuccess, LogFailure);
}
```

The response will be a simple OK message with no data. Failure to call this after two minutes will result in the server being removed from the Matchmaker registry, which could mean that its LobbyId will be reassigned to a new server.

So if a server does nothing else before shutting down, it will be automatically removed from consideration for matchmaking after that period. However, it is a recommended best practice to notify the PlayFab matchmaker that your server is going away by making a call to DeregisterGame.

```csharp
public void DeregisterGame(string lobbyId) {
    PlayFabServerAPI.DeregisterGame(new DeregisterGameRequest() {
        LobbyId = lobbyId
    }, LogSuccess, LogFailure);
}
```

And again, there’s no data needed for the response, which will be a simple OK.

### Additional Options

Now, for the sake of completeness, there are a few additional features we’ve added to server hosting over time, which you can use.

The newest is server tags, which allow you to apply string tags to servers which can be used for matchmaking. If you look at both the [GetCurrentGames](xref:titleid.playfabapi.com.client.matchmaking.getcurrentgames) and [Matchmake](xref:titleid.playfabapi.com.client.matchmaking.matchmake) calls, you’ll see that they now take a [TagFilter](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CollectionFilter), which can be used to define tags that you want to search on, or that you want to exclude from your search. This is particularly handy for games with large user populations, where you want to give players the ability to search for games running their favorite maps, or where there are server options running that they particularly like (as well as letting them avoid the ones they hate).

As you can see in our [Registering the Server](#registering-the-server) example, you can set these tags up in the call to RegisterGame, but you can update them at any time using the [SetGameServerInstanceTags](xref:titleid.playfabapi.com.server.matchmaking.setgameserverinstancetags) call. We do recommend using tags judiciously, and providing for a back-off search (less restrictive) after a short period, as the more options you provide to focus a search, the more you “bucketize” your user base. A popular set of tags might still get plenty of traffic, but an unpopular tag might not, meaning your players could have a poor experience as they sit and wait on a game to open up with their preferred settings.

Next, if you need to be able to close a game session to matchmaking despite technically having slots available, make sure to use [SetGameServerInstanceState](xref:titleid.playfabapi.com.server.matchmaking.setgameserverinstancestate). Servers normally start in the Open state, but you can set them to Closed whenever you need to. Say, for instance, a team game where you need to disallow join-in-progress to prevent cheating.

Finally, for titles using [GetCurrentGames](xref:titleid.playfabapi.com.client.matchmaking.getcurrentgames), it's worth noting that we now return custom data for servers, so that you can use that to provide additional information to the client in determining which server is best for the player. You can set that custom data via [SetGameServerInstanceData](xref:titleid.playfabapi.com.server.matchmaking.setgameserverinstancedata). Since both the server custom data and tags are returned, you’ve got plenty of space to work with for any information you want to pass on to the client.

For clarity, here’s a diagram detailing the logic flow between PlayFab, your custom game servers, and the client.

![External Game Server-Client-MatchMaker Logic diagram](media/tutorials/external-game-server-client-matchmaker-logic-diagram.png)  

## Best Practices

Finally, a few pieces of advice for those who haven’t worked extensively with server hosting:

- Make sure you always have enough available capacity in each region to manage your peak load. If you’re planning user acquisition campaigns, make sure to take that into account and calculate that peak accordingly. GSPs vary pretty widely in how long they take to get new servers set up, ranging from minutes in some highly automated services to weeks in those requiring manual setup.
- To help with that planning, use a server monitoring service which tracks CPU, memory, and disk usage, and track closely on how those metrics change as you try different play modes and increased player numbers. Hit this hard with as many real-world tests as you can, and continue to monitor it post-launch, as players will surprise you by finding corner cases you didn’t plan for. The more accurately you can track this, the more efficient you can be with your total server need.
- Once you’ve got that usage per player figured out, don’t target your numbers higher than 80% usage. Spikes as more players at a time than normal hit high-cost sections of the game will drive you up into the danger zone, and could potentially impact performance. Planning to have some “overhead” always available helps to prevent issues when that occurs.
