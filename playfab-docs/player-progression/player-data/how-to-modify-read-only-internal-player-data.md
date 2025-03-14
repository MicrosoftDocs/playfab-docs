---
title: How to modify read-only or internal player data from CloudScript 
author: DanBehrendt
description: "How to modify read-only or internal player data from Cloudscript"
ms.author: joanlee 
ms.date: 06/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# How to modify read-only or internal player data from CloudScript

Player data is accessible from CloudScript if you require it for your title.

For more information about using CloudScript, see [CloudScript quickstart](../automation/cloudscript/quickstart.md).

The C# Sample in this topic are written for the Unity SDK. The Unity SDK uses an event driven model to handle non-synchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

## CloudScript code example

You must be very careful to ensure the security of your server API calls in CloudScript. The following code demonstrates modifying a piece of read-only player data from CloudScript safely.

```javascript
function IncrementReadOnlyUserData(args) {
  var playerData = server.GetUserInternalData({
        PlayFabId: currentPlayerId,
        Keys: ["ReadOnlyTest"]
  });

  var prevCount = "0";
  var nextCount = "1";
  try {
    prevCount = playerData.Data["ReadOnlyTest"].Value;
    var prevInt = parseInt(prevCount, 10);
    if (prevInt != prevInt) {
      prevInt = 0;
      nextCount = (prevInt + 1).toString();
    }
  } catch (e) {
    prevCount = "0";
    nextCount = "0";
  }

  var updateUserDataResult = server.UpdateUserInternalData({
    PlayFabId: currentPlayerId,
    Data:
        {
          "ReadOnlyTest": nextCount
        }
  });
}
```

## C# code example

As explained in the CloudScript quickstart, you can call the following logic from the client.

```csharp
public void CloudIncrement() {
    PlayFabClientAPI.ExecuteCloudScript( new ExecuteCloudScriptRequest {
        FunctionName = "IncrementReadOnlyUserData"
    },
    result => Debug.Log("CloudScript call successful"),
    error => {
        Debug.Log("CloudScript call failed");
        Debug.Log(error.GenerateErrorReport());
    });
}
```
