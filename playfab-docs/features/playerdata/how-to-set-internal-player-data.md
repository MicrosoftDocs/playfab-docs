---
title: How to set internal player data 
author: DanBehrendt
description: "How to set internal player data"
ms.author: joanlee
ms.date: 06/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# How to set internal player data

To set internal player data, use the Server API [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) method. This is data that the client can't access. 

The C# Sample in this article are written for the Unity SDK. The Unity SDK uses an event driven model to handle non-synchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs, you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

## C# code example

The following **C#** code example uses the PlayFab server API to create (or update, if a key value already exists) the KVPs with the key named `Class`, with the value `Fighter`, and `Race` with the value `Human`.

```csharp
public void UpdateUserInternalData() {
    PlayFabServerAPI.UpdateUserInternalData(new UpdateUserInternalDataRequest() {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
        Data = new Dictionary<string, string>() {
            {"Class", "Fighter"},
            {"Race", "Human"},
        },
    },
    result => Debug.Log("Set internal user data successful"),
    error => {
        Debug.Log("Got error updating internal user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## See also

[How to get internal player data](how-to-get-internal-player-data.md)
