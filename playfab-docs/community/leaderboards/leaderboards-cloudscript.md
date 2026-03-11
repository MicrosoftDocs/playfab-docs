---
title: Leaderboards using Azure Functions
author: braulioal
description: Learn how to create and manage leaderboards using Azure Functions in PlayFab.
ms.author: braulioal
ms.date: 09/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Leaderboards using Azure Functions 

In this tutorial, you'll learn how to implement leaderboards using Cloudscript, specifically through [Azure Functions](../../live-service-management/service-gateway/automation/cloudscript-af/index.md). 
This approach is powerful because it enables you to create custom server-side logic without requiring client updates.

By defining leaderboard-related logic within an Azure Function, your client can invoke that function to execute the code. If changes are needed later, you can update the Azure Function independently—often without modifying the client—depending on the complexity of the update.

## Prerequisites
To follow this tutorial, you need:
- A PlayFab account. If you don't have one, you can create it [here](https://developer.playfab.com/).
- An Azure subscription. If you don't have one, you can create it [here](https://azure.microsoft.com/free/).

For more details on how to create an Azure Function check this guide. [Create your first function in Azure using Visual Studio](https://learn.microsoft.com/azure/azure-functions/functions-create-your-first-function-visual-studio)

## Create a leaderboard using Azure Functions

In this section, we're going to create a leaderboard that allows you to submit scores and retrieve the top scores. 

``` C#
[Function("LeaderboardExample")]
public async Task<HttpResponseData> RunAsync([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequestData req)
{
    _logger.LogInformation("C# HTTP trigger function processed a request.");

    PlayFabSettings.staticSettings.TitleId = "78C3E"; // Change this value to your own titleId from PlayFab Game Manager
    PlayFabSettings.staticSettings.DeveloperSecretKey = "WJT5SBP7PUFH61JHE39QQ4F1SJKGBWBJR647CH1WYB9CS3MZDD"; // Change this to your title's secret key from Game Manager
                                                                                                              // Check if parameter exists
    if (string.IsNullOrEmpty(req.Query["leaderboardName"]))
    {
        var badResponse = req.CreateResponse(HttpStatusCode.BadRequest);
        badResponse.Headers.Add("Content-Type", "text/plain; charset=utf-8");
        badResponse.WriteString("Please pass a leaderboardName on the query string");
        return badResponse;
    }

    PlayFabAuthenticationContext authContext = await LoginAsTitleEntity();
    var result = await CreateLeaderboardDefinitionAsync(authContext, req.Query["leaderboardName"]);
    if (result != null)
    {
        if (result.Error != null) {
            PlayFabError apiError = result.Error;
            var response = req.CreateResponse(HttpStatusCode.BadRequest);
            response.Headers.Add("Content-Type", "text/plain; charset=utf-8");
            if (apiError != null)
            {
                response.WriteString("Something went wrong with your API call.  :");
                response.WriteString("Here's some debug information:");
                response.WriteString(PlayFabUtil.GenerateErrorReport(apiError));
                return response;
            }
            response.WriteString("Something went wrong with your API call but it wasn't possible to get a PlayFab error description.");
            return response;
        }
        else
        {
            var response = req.CreateResponse(HttpStatusCode.OK);
            response.Headers.Add("Content-Type", "text/plain; charset=utf-8");
            response.WriteString("Leaderboard created successfully!");
            return response;
        }
    }
    else 
    {
        var response = req.CreateResponse(HttpStatusCode.BadRequest);
        response.Headers.Add("Content-Type", "text/plain; charset=utf-8");
        response.WriteString("Something went wrong with your API call.  :");
        return response;
    }    
    
}

```
- This function attribute ```[Function("LeaderboardExample")]``` defines the name of the function, in this case `LeaderboardExample`.
- The function is triggered by an HTTP request, as indicated by the ```[HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")]``` attribute. This means that the function can be accessed via HTTP GET and POST methods without any authentication.
- Within the function, we set the PlayFab Title ID and Developer Secret Key to authenticate our requests to PlayFab services. You can change the way you want to access these values based on what fits best for your particular case and security requirements.
- The function checks if the query parameter "leaderboardName" is provided in the request.
- Then we call the method ```LoginAsTitleEntity``` to authenticate as a title entity, which is necessary to create leaderboard definitions.
- Finally, we call the method ```CreateLeaderboardDefinitionAsync``` to create a leaderboard definition with the provided name. To find more about creation of leaderboard, you can check [Create basic leaderboard](create-basic-leaderboard.md) and [Doing more with leaderboards](doing-more-with-leaderboards.md).

The RunAsync method serves as the entry point for your Azure Function. From there, you can define and call additional methods to build out your custom game logic. How you handle errors or interact with multiple PlayFab services is entirely up to you, giving you full flexibility in your implementation.

Additionally, you can configure automation rules to trigger this Azure Function based on specific events. For more details, refer [here](../../live-service-management/service-gateway/automation/cloudscript-af/quickstart.md).

## See also
- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Create basic leaderboard](create-basic-leaderboard.md).
- [Manual tiers](manual-tiers.md).
- [Limits](limits-leaderboards.md).
- [Quota](quota-leaderboards.md).
- [Seasonal leaderboards](seasonal-leaderboards.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md).
- [Add contextual data to leaderboards](metadata-leaderboards.md).
- [Leaderboards with Playstream](leaderboards-with-playstream-and-telemetry.md).
- [API reference](api-reference.md).

