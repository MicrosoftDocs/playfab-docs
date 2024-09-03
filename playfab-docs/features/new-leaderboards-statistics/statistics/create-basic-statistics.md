---
title: Create a Basic Statistic
author: braulioal
description: Learn more about how to create a basic Statistics
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, statistics
ms.localizationpriority: medium
---

# Create a basic statistic

In this tutorial, we show you how to create a basic statistic using our new Statistic Service. Let's start with an 
example of a shooter game that wants to track whenever a player hits a long shot.

## Creating a statistic

The first step is to create a statistic definition that includes the main elements for tracking long shots. For our shooter game,
we only need one column for the distance of the long shot. The following example shows how to create the statistic definition using the C# SDK.

``` C#
public static async Task CreateStatisticDefinitionAsync(PlayFabAuthenticationContext context, string statName)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    CreateStatisticDefinitionRequest statDefinitionRequest = new CreateStatisticDefinitionRequest()
    {
        Name = statName,
        AuthenticationContext = context,
        EntityType = "title_player_account",
        VersionConfiguration = new VersionConfiguration()
        {
            MaxQueryableVersions = 1,
            ResetInterval = ResetInterval.Manual,
        },
        Columns = new List<StatisticColumn>()
        {
            new StatisticColumn()
            {
                Name = "Distance",
                AggregationMethod = StatisticAggregationMethod.Max,
            }
        },
    };
    
    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createStatDefResult = await statsAPI.CreateStatisticDefinitionAsync(statDefinitionRequest);
}
```

Now, let's explain some key elements of this example:

- `AuthenticationContext`: This parameter handles all the authentication behind every request to our services. For a detailed explanation,
you can check the following page:  [Quickstart Statistics](quickstart-statistics.md).
- `Name`: This parameter helps you identify the statistics definition. It's important to keep something relevant here since it going to be 
used to make other requests to retrieve information
- `EntityType`: This parameter specifies the type of entity you want to create your statistic for. 
You can learn more here: [Entity Programming Model](../../entities/index.md).
- `VersionConfiguration`: This parameter allows you to set a versioning strategy for statistics that reset themselves 
after a certain period. This concept is covered in depth here:  [Seasonal Statistics](seasonal-statistics.md).
- `Columns`: Here, we define the number of columns for our statistic. In this example, we only set one column for the long shots.
We also define the `AggregationMethod` as Max, meaning that the statistic is only going to be updated whenever the new value is greater than 
the previous one.
    - The `AggregationMethod` has four possible values:
        - `Max`: The new value needs to be greater than the previous one.
        - `Min`: The new value needs to be lower than the previous one.
        - `Last`: It always updates with the latest value.
        - `Sum`: The previous and the new value are added together.

With all of the information clear, you're now ready to run the example and create your first statistic.

### Getting a statistic definition

Before adding data to this statistic, we want to ensure that it was created correctly. To do this action, we provide an example of
how you can retrieve your statistic definition.

``` C#
public static async Task GetStatisticDefinition(PlayFabAuthenticationContext context, string statName)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    GetStatisticDefinitionRequest statDefReq = new GetStatisticDefinitionRequest()
    {
        Name = statName
    };

    PlayFabResult<GetStatisticDefinitionResponse> getStatDefResult = await statsAPI.GetStatisticDefinitionAsync(statDefReq)
}
```

To retrieve the statistic definition, specify the name of the statistic you created. If you have multiple statistics 
definitions, you can use the next example to get all of your statistics definitions with a single request.

``` C#
public static async Task GetStatisticDefinitions(PlayFabAuthenticationContext context)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    GetStatisticDefinitionsRequest request = new GetStatisticDefinitionsRequest();
    PlayFabResult<GetStatisticDefinitionsResponse> getStatDefsResult = await statsAPI.GetStatisticDefinitionsAsync(request);
    
}
 ```

### Deleting Statistic Definition

If you want to delete your statistic definition to add more columns or fix some errors, you can do so as follows:

 
``` C#

public static async Task DeleteStatisticDefinition(PlayFabAuthenticationContext context, string statName)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    DeleteStatisticDefinitionRequest deleteStatDefRequest = new DeleteStatisticDefinitionRequest()
    {
        AuthenticationContext = context,
        Name = statName,
    };
    
    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> statResponse = await statsAPI.DeleteStatisticDefinitionAsync(deleteStatDefRequest);    
}
```

## Adding Data to a Statistic

Continuing with our shooter example, we now know how to create a statistic definition, retrieve it, and delete it if necessary.
Our next step is to start adding data to our statistic.

Keep in mind that these statistics are entity-based statistics, which means the entries are entities. 
In our specific example, we're using the entity type title_player_account, so our statistics tracks the information of a player. 
However, remember that there are other entity types you can use as well. 
You can check them out here: [Available built-in entity types](../../entities/available-built-in-entity-types.md).

Now let's dive into how we can add data to our statistic.

``` C#
public static async Task UpdateStatisticForPlayer(PlayFabAuthenticationContext context, string statName, string entityId, int score)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    UpdateStatisticsRequest updateStatRequest = new UpdateStatisticsRequest()
    {
        Entity = new PlayFab.LeaderboardsModels.EntityKey()
        {
            Id = entityId,
            Type = EntityType
        },
        AuthenticationContext = context,
        Statistics = new List<PlayFab.LeaderboardsModels.StatisticUpdate>() 
        {
            new PlayFab.LeaderboardsModels.StatisticUpdate() 
            {
                Name = statName,
                Scores = new List<string> { score.ToString()},
            }
        }
    };

    PlayFabResult<UpdateStatisticsResponse> updateResult = await statsAPI.UpdateStatisticsAsync(updateStatRequest);
}
```

Now, let's explain some key elements of this example:
- `Entity`: This parameter corresponds to the entity from which we want to make the update of the stat.
- `Statistics`: This parameter corresponds to the actual set of statistics of an entity. 
- `StatisticUpdate`: This parameter corresponds to the statistics values that are going to be added.
    -  `Scores`: This parameter corresponds to the list of scores you can add to one entity. Remember, statistics can have more than one column. 
     You can check these concepts in depth here: [Doing More With Statistics](doing-more-statistics.md)
    - `Name`: This parameter corresponds to the statistic name set when you created the statistic definition.

With these concepts clear, you're now ready to add data to your statistic.

## Retrieving Data From a Statistic

Let's do a quick recap. At this point, you created a statistic, checked all the configuration details, 
and started adding data to it. Now, let's imagine some players already started using your game,
all with impressive long shots. We want to query for one of them. In the following example, 
we show you how to do this action.

``` C#
public static async Task GetStatsForEntity(PlayFabAuthenticationContext context, string entityId)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);

    GetStatisticsRequest request = new GetStatisticsRequest()
    {
        AuthenticationContext = context,
        Entity = new PlayFab.LeaderboardsModels.EntityKey()
        {
            Id = entityId,
            Type = EntityType
        },
    };
    
    PlayFabResult<GetStatisticsResponse> result = await statsAPI.GetStatisticsAsync(request);

    Console.WriteLine("Stats for entity: " + result.Result.Entity.ToString());
    foreach (KeyValuePair<string, PlayFab.LeaderboardsModels.EntityStatisticValue> statValuePair in result.Result.Statistics)
    {
        Console.WriteLine($"{statValuePair.Value.Name} : {string.Join('|', statValuePair.Value.Scores)}");
    }
}
```

Here we query all the statistics associated to an entity and then we print the name with their corresponding value.

## Deleting Statistics Values

Our statistics are working as expected, and we have a bunch of players in your game. However, 
we start noticing some unusual behavior in the game. So we decided to start fresh and delete the data of our statistic.
In the next example, you can see how to data from your statistic.

``` C#

 public static async Task DeleteStats(PlayFabAuthenticationContext context, string entityId, List<StatisticDelete> stats)
 {
     PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
     DeleteStatisticsRequest statsDelReq = new DeleteStatisticsRequest()
     {
         Entity = new PlayFab.LeaderboardsModels.EntityKey()
         {
            Id = entityId,
            Type = EntityType
         },
         Statistics = stats
     };
 
     PlayFabResult<DeleteStatisticsResponse> delStatsResult = await statsAPI.DeleteStatisticsAsync(statsDelReq);     
 }
 ```

Now, let's explain some key elements of this example:
- `Entity`: This parameter is the entity from which you to delete.
- `List<StatisticDelete>`: This parameter is a list of the names of the stats you want to delete.

## Conclusions

In this tutorial, we learned how to do the following operations: 
* Create a statistic
* Check the configuration of a statistic
* Delete the statistic configuration
* Populate the statistic
* Delete entries in the statistic.


## See also

- [Doing More With Statistics](doing-more-statistics.md).
- [Seasonal Statistics](seasonal-statistics.md).
- [Add Contextual Data to Statistics](metadata-statistics.md).
- [API Reference](api-reference.md).
