---
title: How to get read-only player data  
author: DanBehrendt
description: "How to get read-only player data." 
ms.author: joanlee
ms.date: 06/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# How to get read-only player data

To get read-only player data, use the Server API [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) method.

The C# Sample in this topic are written for the Unity SDK. The Unity SDK uses an event driven model to handle non-synchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

## C# code example

The following **C#** code example uses the PlayFab server API to get all of the player read-only data.

```csharp
public void GetUserReadOnlyData()
{
    PlayFabServerAPI.GetUserReadOnlyData(new GetUserDataRequest()
    {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
    },
    result => {
        if(result.Data == null || !result.Data.ContainsKey("Sister")) Debug.Log("No Sister");
        else Debug.Log("Sister: "+result.Data["Sister"].Value);
    },
    error => {
        Debug.Log("Got error getting read-only user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## See also

[How to set read-only player data](how-to-set-read-only-player-data.md)
