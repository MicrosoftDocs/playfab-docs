---
title: Using resettable statistics and leaderboards
author: joannaleecy
description: Describes how to configure and manage statistics with versioning, which enables “resetting” of statistics and leaderboards.
ms.author: joanlee
ms.date: 10/29/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, tournaments, statistics, leaderboards
ms.localizationpriority: medium
---

# Using resettable statistics and leaderboards

This tutorial provides a complete walkthrough of how to configure and manage statistics with versioning - which enables *resetting* of statistics - and by extension, leaderboards.

We'll focus on how to use the Admin API methods, with additional info on how to use the client and Server API methods to query the data - both for the current version as well as old ones.

Our goal is to provide you with a technical review of how re-settable statistics work in PlayFab, and all the ways they can be used in your games.

## Statistics and leaderboards

First, it’s important to note that all statistics defined for a player in a game in PlayFab are part of a leaderboard. So defining your statistics defines your leaderboard as well.

Statistics may not necessarily be visible to players, but they are there. You can use them to get lists of players by a score you define - whether to find the top of all scores, the bottom, those centered around the current player - or those on a user’s friend list.

Many statistics in games are intended to be *lifetime* values - meaning that players continually update their scores, with old ones remaining until each player beats his own personal best. However, for some player experiences, it’s important to be able to “wipe” the leaderboard from time to time.

This can be used to encourage a user to try to be the top ranked player for a given period, or to simply remove any players from the rankings who haven’t been active in a while.

As this tutorial will discuss, statistics in PlayFab can be configured to reset on a pre-determined interval.

This is useful not just for the scenarios described above - it can also be used for titles that need to have a distinct leaderboard of recent scores, which can be used for things like game challenges, where you want to let a player issue an invitation to someone of a similar skill level.

Setting a reset period means that the players returned in a call to [GetLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboardaroundplayer), for example, are those that have recently played the game, and who have scores similar to the local player.

It’s also possible to reset a statistic as a manual operation. This is a handy system for clearing out any data you have from your pre-launch tests or alpha/beta play.

It’s also useful for the worst case scenario, where a bug was introduced to the game code resulting in out-of-control scores. In each case, you need to have the ability to wipe the leaderboard *clean*, so that players feel like they have a fair chance to get on it.

> [!NOTE]
> Resetting statistics does not delete those values, as you will see below. On reset, statistics in PlayFab are versioned, making the new version authoritative, while keeping previous versions for later analysis (and so that you can reward players based on their old scores).

## Configuring resettable statistics

The reset periods for statistics are configured using the Admin API set or the Game Manager. They can then be updated and queried via the Game Manager, Server API, and Client API (though posting statistics from the client does require that the **allow client to post statistics** option be set in the game's **Settings**->**API Features** tab in the Game Manager).

We’ll describe the API method for this, though the parameters defined here are the same as those used in the Game Manager itself.

To set up the statistics, you can use the Admin `CreatePlayerStatisticDefinition` method, and the `UpdatePlayerStatisticDefinition` method to make changes later.

In both cases, there are only two parameters:

- `StatisticName` - The string identifier for the player statistic.
- `VersionChangeInterval` - The period defining when the statistics should be automatically reset.

The `VersionChangeInterval` is the key to this feature, and it can be defined as hourly, daily, weekly, or monthly. It can also be set to never, if you decide later that you no longer want the statistic to reset on a regular basis.

In the example that follows, the call to the `CreatePlayerStatisticDefinition` method sets up the statistic Headshots with a daily reset, meaning that the leaderboard for this statistic in the game will reset every day at 00:00 UTC.

```csharp
public void CreatePlayerStatisticDefinition() {
    PlayFabAdminAPI.CreatePlayerStatisticDefinition(
        new CreatePlayerStatisticDefinitionRequest() {
            StatisticName = "Headshots",
            VersionChangeInterval = StatisticResetIntervalOption.Day
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

The following shows the response for the preceding API call.

```json
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "Statistic":
        {
            "StatisticName": "Headshots",
            "CurrentVersion": 0,
            "VersionChangeInterval": "Day"
        }
    }
}
```

The coding shown below is an alternative example.

```csharp
public void UpdatePlayerStatisticDefinition() {
    PlayFabAdminAPI.UpdatePlayerStatisticDefinition(
        new UpdatePlayerStatisticDefinitionRequest() {
            StatisticName = "Headshots",
            VersionChangeInterval = StatisticResetIntervalOption.Week
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

The call demonstrates setting the reset period for the statistic to weekly, with the following response.

```json
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "Statistic":
        {
            "StatisticName": "Headshots",
            "CurrentVersion": 0,
            "VersionChangeInterval": "Week"
        }
    }
}
```

In each case, the result is the `PlayerStatisticDefinition`, containing:

- The string ID of the statistic (`StatisticName`).
- The number of times the statistic has been reset (`CurrentVersion`).
- The defined period for when the statistic will reset (`VersionChangeInterval`).

The reset periods take effect as soon as they are defined, so in this case, the second call means that the reset is now defined as 00:00 UTC, Monday morning (midnight on Sunday night/Monday morning, using the UTC timezone), regardless of what it was before the call.

The remaining reset intervals are also defined using UTC, with Month making the reset occur at 00:00 UTC on the first day of each month.

For the completed list, the reset periods are:

- **Never**: Stop versioning the statistic on a time-based basis.
- **Hour**: Version the statistic at the top of every **Hour** (XX:00 UTC).
- **Day**: Version the statistic at midnight (00:00 UTC) every **Day**.
- **Week**: Version the statistic at midnight (00:00 UTC) every Monday.
- **Month**: Version the statistic at midnight (00:00 UTC) on the first day of every Month.

## Preexisting Statistics

All statistics defined in the game can be queried for their definition, regardless of whether they were set up as resetting statistics or not.

This is important to note, since statistics can be created using the [UpdatePlayerStatistics](xref:titleid.playfabapi.com.client.playerdatamanagement.updateplayerstatistics) call. Any statistics not created with a reset period (`VersionChangeInterval`) will not have one to start, and so a query for the statistic configuration would return with this parameter set to `Never`.

Using the example above, if the title also had a statistics named `FlagsCaptured` created using [UpdatePlayerStatistics](xref:titleid.playfabapi.com.client.playerdatamanagement.updateplayerstatistics) (or created in the Game Manager directly on a player), and a couple of weeks had passed, it would appear as shown in the call shown below.

```csharp
public void GetPlayerStatisticDefinitions() {
    PlayFabAdminAPI.GetPlayerStatisticDefinitions(
        new GetPlayerStatisticDefinitionsRequest(),
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

Would result in the following.

```json
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "Statistics": [
        {
            "StatisticName": "Headshots",
            "CurrentVersion": 2,
            "VersionChangeInterval": "Week"
        },
        {
            "StatisticName": "FlagsCaptured",
            "CurrentVersion": 0,
            "VersionChangeInterval": “Never”
        }]
    }
}
```

In this case, the statistics named `Headshots` has a reset interval defined, and `CurrentVersion` indicates that the statistics has been reset twice.

Meanwhile, `FlagsCaptured` does not have a `VersionChangeInterval`, which is also why the `CurrentVersion` is **0** (since it has never been versioned).

Statistics created via [UpdatePlayerStatistics](xref:titleid.playfabapi.com.client.playerdatamanagement.updateplayerstatistics) (or the PlayFab Game Manager), can still be defined to have a reset period using `UpdatePlayerStatisticDefinition`, as described above.

Once this has been done, they will reset on that interval exactly as if they were originally defined using `CreatePlayerStatisticDefinition`.

## Manually resetting a statistic

For the situation where a game bug allowed for cheating on a statistic, or where you simply need to reset to remove scores from pre-release gameplay, the statistic can be forced to reset in the Game Manager, or via a call to `IncrementPlayerStatisticVersion`.

This immediately resets the current statistics that you specify, clearing the leaderboard for the game, and providing a blank slate for new values to be reported.

For our example, this call might look like the one shown below.

```csharp
public void IncrementPlayerStatisticVersion() {
    PlayFabAdminAPI.IncrementPlayerStatisticVersion(
        new IncrementPlayerStatisticVersionRequest() {
            StatisticName = "Headshots"
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

This increments the `Headshots` statistic once more, returning information on the version which has just been made active.

```json
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "StatisticVersion":
        {
            "StatisticName": "Headshots",
            "Version": 3,
            "ActivationTime": "2016-02-03T08:02:29.864Z",
            "ArchivalStatus": "NotScheduled"
        }
    }
}
```

In this case, the `PlayerStatisticVersion` information is returned, containing the ID of the statistic (`StatisticName`), as well as its version number, the time when it became the authoritative version (`ActivationTime`), and the `ArchivalStatus` (which will always be `NotScheduled` for the current version).

However, for a statistic which also has a `VersionChangeInterval`, manually resetting will *not* change the next scheduled reset time. If a statistic is scheduled to reset on a daily basis - and it is manually reset at 11:30 PM UTC - it will *still* reset again at midnight UTC.

### When the reset occurs

As stated, when the reset interval occurs, the statistic will be versioned, so that a new version is immediately available, while the old version of that statistic is archived for later retrieval.

Once the reset interval occurs (or a manual reset is performed), and the statistic is versioned, writes to the old version will be accepted for up to ten minutes. Beyond that point, the statistic is *locked*, preventing future updates.

Once expired, statistics start into the archive process, so that they can be retrieved by the title later.

The stages of the archival process for a statistic are:

- **NotScheduled** - Archiving of the statistic has not started (normally only for the currently active statistic version).
- **Scheduled** - The archive process has been scheduled, but is not underway yet.
- **InProgress** - The statistic is being backed up to the archive.
- **Failed** - An unexpected failure occurred (in this case, contact our [Support Forums](https://community.playfab.com/)).
- **Complete** - This version of the statistic has been archived.

All of the past and current versions of a statistic can be queried using `GetPlayerStatisticVersions`. This returns the information for each version, as shown in the previous manual reset example.

In other words, this call should appear like the one presented below.

```csharp
public void GetPlayerStatisticVersions() {
    PlayFabAdminAPI.GetPlayerStatisticVersions(
        new GetPlayerStatisticVersionsRequest() {
            StatisticName = "Headshots"
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

This could result in the following information being returned for our example title.

```json
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "StatisticVersions": [
        {
            "StatisticName": "Headshots",
            "Version": 0,
            "ActivationTime": "2015-01-20T05:47:27.17Z",
            "DeactivationTime": "2016-01-25T00:00:00.000Z",
            "ArchivalStatus": "Complete",
            "ArchiveDownloadUrl": {{URL}}
        },
        {
            "StatisticName": "Headshots",
            "Version": 1,
            "ActivationTime": "2016-01-25T00:00:00.000Z",
            "DeactivationTime": "2016-02-01T00:00:00.000Z",
            "ArchivalStatus": "Complete",
            "ArchiveDownloadUrl": {{URL}}
        },
        {
            "StatisticName": "Headshots",
            "Version": 2,
            "ActivationTime": "2016-02-01T00:00:00.000Z",
            "DeactivationTime": "2016-02-03T08:02:29.864Z",
            "ArchivalStatus": "InProgress"
        },
        {
            "StatisticName": "Headshots",
            "Version": 3,
            "ActivationTime": "2016-02-03T08:02:29.864Z",
            "ArchivalStatus": "NotScheduled"
        }]
    }
}
```

In addition to the values returned from `IncrementPlayerStatisticVersion`, the response also includes the timestamps for when each version was expired (`DeactivationTime`) for versions prior to the current active one, and a URL for downloading the CSV containing the complete record of the old leaderboard, once the archive process has completed (`ArchiveDownloadUrl`).

### Reading and writing to statistic versions

Finally, from the server and client API side of the story, the calls are very similar to what you know from original PlayFab user and character statistics calls.

The difference is that now, the version is part of either the request or the response.

When retrieving statistics, the value for the current statistic version - as well as the version number itself - is returned.

The following examples show making the call for the `Headshots` statistic, as well as the returned data.

#### Server Request

```csharp
public void GetPlayerStatistics() {
    PlayFabServerAPI.GetPlayerStatistics(
        new GetPlayerStatisticsRequest() {
            PlayFabId= "_PlayFabId_",
            StatisticNames = new List<string>() { "Headshots" }
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

#### Server response

```json
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "PlayFabId": {{PlayFabId}},
        "Statistics": [
        {
            "StatisticName": "Headshots",
            "Value": 10,
            "Version": "3"
        }]
    }
}
```

#### Client request

```csharp
public void GetPlayerStatistics() {
    PlayFabClientAPI.GetPlayerStatistics(
        new GetPlayerStatisticsRequest() {
            StatisticNames = new List<string>() { "Headshots" }
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

#### Client response

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "Statistics": [
        {
            "StatisticName": "Headshots",
            "Value": 10,
            "Version": "3"
        }]
    }
}
```

Meanwhile, the `Update` call takes an optional version, to allow the title to control which version is being updated, for cases where the version may have incremented during game play.

> [!NOTE]
> In this example, if the title were to write to the *previous* version while it is still possible, it would be writing to Version 2, as shown below.

#### Server request

```csharp
public void UpdatePlayerStatistics() {
    PlayFabServerAPI.UpdatePlayerStatistics(
        new UpdatePlayerStatisticsRequest() {
            PlayFabId= "_PlayFabId_",
            Statistics = new List<StatisticUpdate>() {
                new StatisticUpdate() {
                    StatisticName = "Headshots",
                    Version = 2,
                    Value = 10
                }
            }
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

#### Server response

```json
{
    "code": 200,
    "status": "OK",
    "data": {}
}
```

#### Client request

```csharp
public void UpdatePlayerStatistics() {
    PlayFabClientAPI.UpdatePlayerStatistics(
        new UpdatePlayerStatisticsRequest() {
            Statistics = new List<StatisticUpdate>() {
                new StatisticUpdate() {
                    StatisticName = "Headshots",
                    Version = 2,
                    Value = 10
                }
            }
        },
        result => Debug.Log("Complete"),
        error => Debug.Log(error.GenerateErrorReport())
    );
}
```

#### Client response

```json
{
    "code": 200,
    "status": "OK",
    "data": {}
}
```
But remember - while the expired version can be written to for up to 10 minutes, any attempt to write to that version *beyond* that time will fail, with a response like the one shown below.

```json
{
    "code": 400,
    "status": "BadRequest",
    "error": "StatisticVersionClosedForWrites",
    "errorCode": 1197,
    "errorMessage": "The statistic version is not current and is no longer accepting updates"
}
```

## Resources

For completeness, this section provides a list of all the enums, classes, and API methods described above, with brief descriptions.

### Base enums

- **Interval** - period at which rate the statistic (leaderboard) will be reset:
  - **Never**
  - **Hour**
  - **Day**
  - **Week**
  - **Month**

- **StatisticVersionArchivalStatus** - the status of the process of saving the player statistic values of a version to a downloadable archive:
  - **NotScheduled**
  - **Scheduled**
  - **InProgress**
  - **Failed**
  - **Complete**

### Base classes and their members

- **PlayerStatisticDefinition**
  - **StatisticName** (string) - The unique name of the statistic.
  - **CurrentVersion** (string) - The current active version of the statistic, incremented each time the statistic resets.
  - **VersionChangeInterval** (Interval) - The interval at which the values of the statistic for all players are reset.

- **PlayerStatisticVersion**
  - **StatisticName** (string) - The name of the statistic when the version became active.
  - **Version** (string) - The version of the statistic (a hexadecimal number encoded as a string).
  - **ScheduledVersionChangeIntervalTime** (DateTime) - The time at which the statistic version was scheduled to become active, based on the configured **ResetInterval**.
  - **CreatedTime** (DateTime) - The time when the statistic version became active.
  - **ArchivalStatus** (**StatisticVersionArchivalStatus**) - The status of the process of saving player statistic values of this version to a downloadable archive, if configured.
  - **ResetInterval** (Interval) - The reset interval that triggered the version to become active, if configured.

- **StatisticValue**
  - **StatisticName** (string) - The unique name of the statistic.
  - **Value** (Int32) - The statistic value for the player.
  - **Version** (string) - For an existing statistic value for a player, the version of the statistic when it was loaded.

- **StatisticUpdate**
  - **StatisticName** (string) - The unique name of the statistic.
  - **Version** (string) - For updates to a statistic value for a player, the version of the statistic to be updated
  - Value (Int32) - The statistic value for the player.

### Admin API methods

- **CreatePlayerStatisticDefinition**
  - **CreatePlayerStatisticDefinitionRequest**
    - **Name** (string) - min length 1, max length 128 - The unique name of the statistic.
    - (**VersionChangeInterval**) (Interval) - The interval at which the values of the statistic for all players are reset (resets begin at the next interval boundary).

  - **CreatePlayerStatisticDefinitionResult**
    - **Statistic** (**PlayerStatisticDefinition**) - The created statistic's definition.

- **UpdatePlayerStatisticDefinition**
  - **UpdatePlayerStatisticDefinitionRequest**
    - **StatisticName** (string) - The unique name of the statistic.
    - **VersionChangeInterval** (Interval) - The interval at which the values of the statistic for all players are reset (resets begin at the next interval boundary).

  - **UpdatePlayerStatisticDefinitionResult**
    - **Statistic** (**PlayerStatisticDefinition**) - The created statistic's definition.

- **GetPlayerStatisticDefinitions**
  - **GetPlayerStatisticDefinitionsRequest** (no parameters).
  - **GetPlayerStatisticDefinitionsResult**
    - **Statistics** (**PlayerStatisticDefinition[]**) - The array of definitions for the resetting.

- **GetPlayerStatisticVersions**
  - **GetPlayerStatisticVersionsRequest**
    - **StatisticName** (string) - The unique name of the statistic.

  - **GetPlayerStatisticVersionsResult**
    - **StatisticVersions** (**PlayerStatisticVersion[]**) - The version change history of the statistic (all the versions).

- **IncrementPlayerStatisticVersion**
  - **IncrementPlayerStatisticVersionRequest**
    - **StatisticName** (string) - The unique name of the statistic.

  - **IncrementPlayerStatisticVersionResult**
    - **StatisticVersion** (**PlayerStatisticVersion**) - The statistic version which was expired as a result of this operation (and its archival status).

### Client API methods

- **GetPlayerStatistics**
  - **GetPlayerStatisticsRequest**
    - **StatisticNames** (string[]) - Array of statistic to be returned, by their unique names.

  - **GetPlayerStatisticsResult**
    - **Statistics** (**StatisticValue[]**) - Array of **StatisticValue** data for all the statistic requested.

- **UpdatePlayerStatistics**
  - **UpdatePlayerStatisticsRequest**
    - **Statistics** (**StatisticUpdate[]**) - The statistic to be updated, with the provided values.

  - **UpdatePlayerStatisticsResult** (no parameters).

### Server API methods

- **GetPlayerStatistics**
  - **GetPlayerStatisticsRequest**
    - **PlayFabId** (string) - The PlayFab ID of the player whose statistics are being updated.
    - **StatisticNames** (string[]) - Array of statistics to be returned, by their unique names.

  - **GetPlayerStatisticsResult**
    - **Statistics** (**StatisticValue[]**) - Array of **StatisticValue** data for all the statistic requested.

- **UpdatePlayerStatistics**
  - **UpdatePlayerStatisticsRequest**
    - **PlayFabId** (string) - The PlayFab ID of the player whose statistics are being updated.
    - **Statistics** (**StatisticUpdate[]**) - The statistic to be updated, with the provided values.

  - **UpdatePlayerStatisticsResult** (no parameters).
 