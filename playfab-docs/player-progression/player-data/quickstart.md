---
title: Quickstart Player Data 
author: DanBehrendt
description: Tutorial that describes how to create and use player data.
ms.author: joanlee
ms.date: 06/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# Quickstart: Set and get player data

> [!NOTE]
> In the PlayFab APIs, the function names utilize the term **UserData**. In the **Game Manager**, this concept is described as **Player Data**. They are identical, and interchangeable.

Get started using PlayFab Player Data. This quickstart shows you how to set and retrieve player data using C# in Unity and using PlayFab CloudScript.

Player data is information that applies to an individual player or player group (shared data) and is stored as Key/Value Pairs (KVPs) by PlayFab. This article covers client API calls, which are safe to call from any process or context. It also covers server API calls, which should *only* be made from a dedicated server process you control, or a carefully secured CloudScript call. Server APIs require your dev secret key, which you should never provide-to or publish-with your client.

The C# Samples in this article are written for the Unity SDK. The Unity SDK uses an event driven model to handle non-synchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs, you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- An installed copy of the Unity Editor. To install Unity for personal use via Unity Hub, or Unity+ for professional use, see [Download Unity](https://unity3d.com/get-unity/download).
  > [!NOTE]
  > The PlayFab Unity3D SDK supports Unity Editor version 5.3 (released December 2015) and higher.
- A Unity Project - this can be any of the following:
  - A brand new project. For more information, see [Starting Unity for the first time](https://docs.unity3d.com/550/Documentation/Manual/GettingStarted.html).
  - A guided tutorial project. For more information, see [Getting Started with Unity](https://learn.unity.com/).
  - An existing project.
- The PlayFab Unity3D SDK.

For information about setting up the PlayFab Unity3D SDK, see [Quickstart: PlayFab Client library for C# in Unity](../../sdks/unity3d/quickstart.md) article, which ensures you have a PlayFab account and have configured the Unity3D SDK.

## About the code examples

The C# Samples in this article are written for the Unity SDK. The Unity SDK uses an event driven model to handle nonsynchronous tasks. To run the sample code using the standard C# or Xamarin C# SDKs, you must modify the code to use an async Task model. Methods that must be modified have Async append to the method name in the signature. For example, SetObject in the Unity SDK becomes SetObjectAsync in the standard C# SDK. For more information, see [Asynchronous programming with async and await](/dotnet/csharp/programming-guide/concepts/async/).

While you can use an existing using Unity Project, the procedures in this quickstart assume that you're using the sample that you create when you complete the [Quickstart: PlayFab Client library for C# in Unity](../../sdks/unity3d/quickstart.md).

## Player data in Game Manager

You can always get and set player data through Game Manager by performing the following steps.

- Open **Game Manager**. If you're unfamiliar with it, see the [Game Manager quickstart](../../gamemanager/quickstart.md).
- Select the **Players** tab.
- Select the name of the **Player**. This will put you into the **Players Account** tab.
- Select the **Player Data** tab to see their data.

## Add a method to set the player data and retrieve the player data

1. In the Unity Editor, open your sample project.
2. In the **Project** window, open **Assets** > **Scripts** and then open the PlayFabLogin script.
3. In Visual Studio, add the following to the following using statement:

    `using System.Collections.Generic;`
4. To set player data, add a `SetUserData` method to the `PlayFabLogin` class. `SetUserData` uses the [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) method to create or update the player data for the logged in player.

    The method creates (or updates, if the Key Value Pairs (KVPS) already exist) the KVPs `Ancestor` with the value `Arthur`, and `Successor` with the value `Fred`.

    ```csharp
    void SetUserData() {
        PlayFabClientAPI.UpdateUserData(new UpdateUserDataRequest() {
            Data = new Dictionary<string, string>() {
                {"Ancestor", "Arthur"},
                {"Successor", "Fred"}
            }
        },
        result => Debug.Log("Successfully updated user data"),
        error => {
            Debug.Log("Got error setting user data Ancestor to Arthur");
            Debug.Log(error.GenerateErrorReport());
        });
    }
    ```

5. To get player data, add a `GetUserData` method to the `PlayFabLogin` class. `SetUserData` uses the [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) method to retrieve the player data for the specified player.

    ```csharp
    void GetUserData(string myPlayFabId) {
        PlayFabClientAPI.GetUserData(new GetUserDataRequest() {
            PlayFabId = myPlayFabId,
            Keys = null
        }, result => {
            Debug.Log("Got user data:");
            if (result.Data == null || !result.Data.ContainsKey("Ancestor")) Debug.Log("No Ancestor");
            else Debug.Log("Ancestor: "+result.Data["Ancestor"].Value);
        }, (error) => {
            Debug.Log("Got error retrieving user data:");
            Debug.Log(error.GenerateErrorReport());
        });
    }
    ```

6. To call the add calls to the  `SetUserData` and `GetUserData` in the `OnLoginSuccess` method:

    ```csharp
    private void OnLoginSuccess(LoginResult result) {
        Debug.Log("Congratulations, you made your first successful API call!");
        SetUserData();
        GetUserData(result.PlayFabId);
    }
    ```

7. Save the file.

## Run the sample

In the Unity Editor, select the play button. On success, the results of the of calls display in the console window.

## See Also

- [How to set internal player data](how-to-set-internal-player-data.md)
- [How to get internal player data](how-to-get-internal-player-data.md)
- [How to set read-only player data](how-to-set-read-only-player-data.md)
- [How to get read-only player data](how-to-get-read-only-player-data.md)
- [How to modify read-only or internal player data from CloudScript](how-to-modify-read-only-internal-player-data.md)
- [Title Data quickstart](../titledata/quickstart.md)  
- [Using Publisher Data](../titledata/using-publisher-data.md)  
- [CloudScript quickstart](../automation/cloudscript/quickstart.md)
