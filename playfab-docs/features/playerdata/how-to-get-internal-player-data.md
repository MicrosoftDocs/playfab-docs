---
title: How to get internal player data 
author: DanBehrendt
description: "How to get internal player data." 
ms.author: joanlee
ms.date: 06/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# How to get internal player data

To get internal player data, use the Server API [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) method. This is *internal* data that you shouldn't* expose it to the client.

The C# Sample in this article are written for the Unity SDK. The Unity SDK uses an event driven model to handle non-synchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs, you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

## C# code example

The following **C#** code example retrieves the Key Value Pairs of the player internal data.

```csharp
public void GetUserInternalData() {
    PlayFabServerAPI.GetUserInternalData(new GetUserDataRequest() {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
    },
    result => {
        if(result.Data == null || !result.Data.ContainsKey("Class")) Debug.Log("No Class");
        else Debug.Log("Class: " + result.Data["Class"].Value);
    },
    error => {
        Debug.Log("Got error getting internal user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## See also

[How to set internal player data](how-to-set-internal-player-data.md)
