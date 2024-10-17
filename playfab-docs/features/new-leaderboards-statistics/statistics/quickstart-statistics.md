---
title: Quickstart on statistics
author: braulioal
description: Learn about how to start your setup of statistics
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Quickstart statistics

In this guide, we're going to see how to set up the development environment for the Statistics service. We're also going
to learn how to create a quick leaderboard from our website [Game Manager](https://developer.playfab.com/en-US/login).

## Prerequisites

We're going to need a PlayFab account to use the PlayFab Statistics service. For instructions to create an account, 
see [Authentication](../../authentication/authentication/index.md).

## Creating a Statistic

We're going to select Progression on the left menu.

![PlayFab Statistics main menu](media/game-manager-main-menu.png)

We now select Statistics tab from the upper menu.

![PlayFab Statistics add statistic](media/statistic-menu.png)

After that, we're going to go "New Statistic" button and create our statistic definition.

![PlayFab Statistics Usage](media/new-statistic.png)

Here we're able to configure every aspect of the statistic. Learn more about the parameters available and 
how to create statistics here:
- [Create Basic Leaderboard](create-basic-statistics.md).
- [API Reference](api-reference.md)

The final result should be like this.

![PlayFab Statistics final result](media/stat-result.png)

## Setting up the environment

Here we're going to learn how to set up the developer environment to use the C# SDK, but the concepts
presented here can also work with other SDKs or plain HTTP requests.

## Setting TitleId and DeveloperSecretKey

DeveloperSecretKey is needed when authenticating as Title Entity. 

``` C#
PlayFabSettings.staticSettings.TitleId = ""; // Change this value to your own titleId from PlayFab Game Manager
PlayFabSettings.staticSettings.DeveloperSecretKey = ""; // Change this to your title's secret key from Game Manager
```

## Creating a title and getting the secret key

- Log in to https://playfab.com/
- Create a title
    - Find the Title ID in the API Features section under settings.   
- Generate secret key:
  - Cog next to title name in top left of title view
  - Title Settings
  - Secret Keys
  - New secret key

Here's how the UI looks like when you find the Secret Key section within Game Manager.

![PlayFab Statistics keys](media/secret-keys.png)

## Login as Title

For write operations we recommend using the TitleEntity from your game server, this method is going to return the `AuthenticationContext` that is
going to be used across all the requests we made.

``` C#
public static async Task<PlayFabAuthenticationContext> LoginAsTitleEntity()
{
    GetEntityTokenRequest request = new GetEntityTokenRequest()
    {
        Entity = new PlayFab.AuthenticationModels.EntityKey()
        {
            Id = PlayFabSettings.staticSettings.TitleId,
            Type = "title",
        },                
    };

    PlayFabResult<GetEntityTokenResponse> entityTokenResult = await PlayFabAuthenticationAPI.GetEntityTokenAsync(request);

    PlayFabAuthenticationContext authContext = new PlayFabAuthenticationContext
    {
        EntityToken = entityTokenResult.Result.EntityToken
    };
    
    return authContext;
}
```

## Login as Player (create Player)

Log in as the player for read operations directly against PlayFab APIs. This method is going to return the `AuthenticationContext` that is
going to be used across all the requests we made.

``` C#
private static async Task<PlayFabAuthenticationContext> LoginAsPlayer(string customId = "GettingStartedGuide")
{
    LoginWithCustomIDRequest request = new LoginWithCustomIDRequest { CustomId = customId, CreateAccount = true };

    PlayFabResult<LoginResult> loginResult = await PlayFabClientAPI.LoginWithCustomIDAsync(request);

    return loginResult.Result.AuthenticationContext;
}

```

## Set the display name property for an entity

In order to have the `DisplayName` property available as part of the response of the Get Statistics APIs,
we need to execute the following code per each entity that we have created. This process is going to map the entity to the custom 
display name of the game. 

``` C#
private static async Task UpdateEntityDisplayName(PlayFabAuthenticationContext context, string customId)
{
    SetDisplayNameRequest request = new SetDisplayNameRequest()
    {
        AuthenticationContext = context,
        DisplayName = customId,
        Entity = new PlayFab.ProfilesModels.EntityKey()
        {
            Id = context.EntityId,
            Type = context.EntityType,
        },
    };

    PlayFabResult<SetDisplayNameResponse> updateNameResult = await PlayFabProfilesAPI.SetDisplayNameAsync(request);

}
```


## See also

- [Create basic statistics](create-basic-statistics.md).
- [Doing more with statistics](doing-more-statistics.md).
- [Seasonal statistics](seasonal-statistics.md).
- [Add contextual data to statistics](metadata-statistics.md).
- [API reference](api-reference.md).
- [Statistics meters](../../pricing/meters/statistics-meters.md).
