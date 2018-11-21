---
title: Accessing Archived Tournament Results
author: v-thopra
description: Describes how to access archived leaderboard states.
ms.author: v-thopra
ms.date: 29/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, social, tournaments, leaderboards
ms.localizationpriority: medium
---

# Accessing Archived Tournament Results

This tutorial illustrates how you can access archived leaderboards states.

Each leaderboard can be reset manually or automatically, meaning statistic values will be removed for all the players, leading to a "clear" state and the leaderboard version will be implemented. Before that happens, however, PlayFab creates a snapshot of all the leaderboard statistic values for each player. This allows you to access this "archived" version of the leaderboard.

> [!NOTE]
> PlayFab free tier only allows access to the most recently archived version of the leaderboard, effectively giving you the current and the most previous versions. For example, with a free tier, if your current leaderboard version is 3, you may only access version 3 and archived version 2.

## Initial setup

To follow this guide, please ensure that you have some players already registered for the title. The following screenshot shows 5 players artificially registered using the [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid) API call:

![Game Manager - Players - Most recent logins](media/tutorials/game-manager-players-most-recent-logins.png)  

## Defining and simulating a leaderboard

In this step, we will create a leaderboard for our test purposes. Then, we will simulate the leaderboard iteration process by populating and resetting the leaderboard several times.

Open Game Manager and navigate to "Leaderboards" tab **(1)**. Then click the "New Leaderboard" button **(2)**:

![Game Manager - Leaderboards - New Leaderboard](media/tutorials/game-manager-leaderboards-new-leaderboard.png)  

Configure the new leaderboard: set the Statistic name to "TestScore" **(1)**, keep the Reset Frequency as "Manually" **(2)** and leave the default Aggregation method **(3)**. Submit by clicking "Save Leaderboard" **(4)**:

![Game Manager - Leaderboards - New Leaderboard - Properties](media/tutorials/game-manager-leaderboards-new-leaderboard-properties.png)  

You will end up on the new Leaderboards page which will, obviously, render blank data:

![Game Manager - Leaderboards - Edit Leaderboard](media/tutorials/game-manager-leaderboards-edit-leaderboard.png)  

## Begin Test Section

> [!IMPORTANT]
> The following section is an example of how to populate test data for the purpose of this example. Your real game will populate this data in a more natural way.

Our next step is simulating some data for our leaderboard. The quickest way to do this is to create a CloudScript handler, which will set random statistics for a given player. We will invoke this handler for every player over the "All Players" segment. As a result, each player will get a random statistic value, which is a "good enough" approximation of a real world scenario.

Let's start with defining our CloudScript (refer to the code comments for further information):

```javascript
// Should be invoked from a task that runs over certain segment
handlers.PopulateLeaderboard = (args,ctx) => {
    // When handler is executed as a task over the segment
    // we can extract individual player id using the next line:
    let playerId = ctx.playerProfile.PlayerId;

    // Use player id and update player statistics as follows:
    server.UpdatePlayerStatistics({
        PlayFabId : playerId,
        Statistics : [
            {
                "StatisticName": "TestScore",
                "Value": getRandomInRange(100,1000)
            }
        ]
    });
}

// Utility method to generate random number
let getRandomInRange = (min, max) => {
    return Math.round(Math.random() * (max - min) + min);
}
```

Let's upload the CloudScript. Using Game Manager, navigate to the "Automation" **(1)** tab. Then navigate to the "CloudScript" **(2)** sub-tab. Insert the CloudScript code **(3)** and click "Save as revision" **(4)**. Finally, deploy the revision **(5)**:

![Game Manager - Automation - CloudScript - upload CloudScript](media/tutorials/game-manager-automation-cloudscript-upload-cloudscript.png)  

Next, we need to define a task to execute our CloudScript over a specific segment. Navigate to the "Players" tab **(1)**. Then, navigate to the "Segments" sub-tab **(2)**. By default, PlayFab generates an "All Players" segment for you. This segment is specifically useful when you need all players registered in your title (which is exactly our case). Select the "All Players" segment **(3)** and click "Run task..." **(4)**.

> [!NOTE]
> If you have no "All Players" segment in the list, please, refer to our [Player Segmentation](../../analytics/segmentation/player-segmentation.md) tutorial to create one.

![Game Manager - Players - Segments - All Players - Run Task](media/tutorials/game-manager-players-segments-all-players-run-task.png)  

Configure the task: set up the name **(1)**, make sure the type of task is set to "Run actions on each player in a segment" **(2)**, also make sure that the "All Players" segment is selected. Add a new action **(3)** and select the "Execute CloudScript" type **(4)**. Select the "PopulateLeaderboard" handler **(5)**. Finally, click "Save and Run" **(6)**.

![Game Manager - Configure Task](media/tutorials/game-manager-configure-task.png)  

Make sure the execution result is "Successful".

![Game Manager - Task Execution Succeeded](media/tutorials/game-manager-task-execution-succeeded.png)  

## End of Test Section

### Populate test data

Navigate to the "Leaderboards" tab **(1)** again, and select our "Leaderboard" **(2)**.

![Game Manager - Leaderboards - Test Score](media/tutorials/game-manager-leaderboards-test-score.png)  

You will see that our leaderboard was populated with random values **(1)**. Reset the leaderboard **(2)**.

![Reset the Test Score Leaderboard](media/tutorials/reset-the-test-score-leaderboard.png)  

This will create a snapshot of all the data we currently have, and then it will "nullify" statistics values on every player and increment the version. Once your leaderboard is reset, run the CloudScript task again. Repeat this 2-3 times: reset and repopulate.

You will end up with several leaderboard versions **(1)**. Current version data will be displayed in the table to the left **(3)**. Archived data will be available for previous versions **(2)**. With a free tier, only the very previous version will be available:

![Game Manager - Leaderboards - Leaderboard Versions](media/tutorials/game-manager-leaderboards-leaderboard-versions.png)  

### Accessing archived data using Game Manager

You can access archived results directly from the Leaderboard page. Navigate to the "Leaderboards" tab **(1)** and select the leaderboard you need **(2)**:

![Game Manager - Leaderboards - Select Leaderboard](media/tutorials/game-manager-leaderboards-select-leaderboard.png)  

If your leaderboard contains archived revisions, you will be able to download JSON data using the download link **(1)**:

![Game Manager - Leaderboards - Download Archived Revision](media/tutorials/game-manager-leaderboards-download-archived-revision.png)  

### Accessing archived data using API

The following code allows you to pull the latest (current) version of the leaderboard:

```csharp
PlayFabClientAPI.GetLeaderboard(new GetLeaderboardRequest()
{
    StatisticName = "TestScore",
}, result =>
{
    Debug.Log("Leaderboard version: "+result.Version);
    foreach (var entry in result.Leaderboard)
    {
        Debug.Log(entry.PlayFabId+" "+entry.StatValue);
    }
}, FailureCallback);
```

The result will look like this:

![Debug output - Display Leaderboard Versions](media/tutorials/debug-output-display-leaderboard-versions.png)  

Alternatively, you may specify a version of the leaderboard you want to load:

```csharp
PlayFabClientAPI.GetLeaderboard(new GetLeaderboardRequest()
{
    StatisticName = "TestScore",
    Version = 1
}, result =>
{
    Debug.Log("Leaderboard version: "+result.Version);

    foreach (var entry in result.Leaderboard)
    {
        Debug.Log(entry.PlayFabId+" "+entry.StatValue);
    }
}, FailureCallback);
```

The result will look like this:

![Debug output - Display Leaderboard Version 1](media/tutorials/debug-output-display-leaderboard-version-1.png)  

Free tier only allows you to access the very latest archived version of the leaderboard. Trying to pull an older version will result in an error:

![Error - Leaderboard Version not available](media/tutorials/error-leaderboard-version-not-available.png)  

The same rules apply for all the leaderboard requests:

- [GetLeaderboard](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboard)
- [GetLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboardaroundplayer)
- [GetFriendLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getfriendleaderboardaroundplayer)
- [GetFriendLeaderboard](xref:titleid.playfabapi.com.client.playerdatamanagement.getfriendleaderboard)

Please refer to documentation for the [GetLeaderboardResult](https://api.playfab.com/documentation/client/datatype/PlayFab.client.Models/PlayFab.client.Models.GetLeaderboardResult) object, to learn about useful properties you may get with the leaderboard data.
