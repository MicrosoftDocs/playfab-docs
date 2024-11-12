---
title: How to set read-only player data 
author: DanBehrendt
description: "How to set read-only player data"
ms.author: joanlee
ms.date: 06/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# How to set read-only player data

To set read-only KVPs, you must call the Server API [UpdateUserReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) method from a server process. This is data that the server can modify, but the client can only read.

The C# Samples in this topic are written for the Unity SDK. The Unity SDK uses an event driven model to handle non-synchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

## C# code example

The following **C#** code example uses the PlayFab server API to create (or update, if the KVPs already exist) the KVPs with the key named `Father`, with the value `Fred`,  `Mother` with the value `Alice`, `Sister` with the value `Lucy`, and `Brother` with the value `Doug`.

```csharp
public void UpdateUserReadOnlyData() {
    PlayFabServerAPI.UpdateUserReadOnlyData(new UpdateUserDataRequest() {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
        Data = new Dictionary<string, string>() {
            {"Father", "Fred"},
            {"Mother", "Alice"},
            {"Sister", "Lucy"},
            {"Brother", "Doug"}
        },
        Permission = UserDataPermission.Public
    },
    result => Debug.Log("Set read-only user data successful"),
    error => {
        Debug.Log("Got error updating read-only user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## See also

[How to get read-only player data](how-to-get-read-only-player-data.md)
