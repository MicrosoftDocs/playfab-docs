---
title: Integrating the PlayFab GSDK into Unity
author: dgkanatsios
description: Integrating the PlayFab GSDK into Unity.
ms.author: digkanat
ms.date: 04/15/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, api, unity
ms.localizationpriority: medium
---

# Integrating the PlayFab GSDK into Unity

Multiplayer Servers platform provides a GSDK library that you can integrate into your [Unity](https://unity.com/) game server. The library is open source and can be found on the [GSDK repository on GitHub](https://github.com/PlayFab/gsdk/tree/master/UnityGsdk).

## Installation

You can copy the [Assets/PlayFabSdk](https://github.com/PlayFab/gsdk/tree/master/UnityGsdk/Assets/PlayFabSdk) folder into your Unity project. After that, you need to enable the scripting directive `ENABLE_PLAYFABSERVER_API` on your Unity Build settings ([example](https://user-images.githubusercontent.com/8256138/81462605-a6d7ac80-9168-11ea-9748-110ed01095c2.png)).
Alternatively, you can use the provided [Unity package file](https://github.com/PlayFab/gsdk/blob/main/UnityGsdk/MpsGsdk.unitypackage). 
You can find sample code in the [MultiplayerServerSample](https://github.com/PlayFab/gsdk/tree/main/UnityGsdk/Assets/PlayFabSdk) project.

## Usage

At a minimum, you need to implement `PlayFabMultiplayerAgentAPI.Start()` method and start a [coroutine](https://docs.unity3d.com/Manual/Coroutines.html) for the `PlayFabMultiplayerAgentAPI.ReadyForPlayers()` method, like in the code below

```csharp
//...
StartCoroutine(ReadyForPlayers());
//...

private IEnumerator ReadyForPlayers()
{
    yield return new WaitForSeconds(.5f);
    PlayFabMultiplayerAgentAPI.ReadyForPlayers();
}
```

You would also want to register for when the game server becomes transitions to Active using the `PlayFabMultiplayerAgentAPI.OnServerActiveCallback`, like in the example below:

```csharp
PlayFabMultiplayerAgentAPI.OnServerActiveCallback += OnServerActive;
// ...
private void OnServerActive()
{
    Debug.Log("Server Started From Agent Activation");
    // players can now connect to the server
}
```

> [!Note]
> For more information regarding game server states, check Basics of a PlayFab game server section [here](basics-of-a-playFab-game-server.md)

Moreover, you can implement the following callbacks on your game server:

- `PlayFabMultiplayerAgentAPI.OnMaintenanceCallback` triggered when Azure needs to perform maintenance on the VM
- `PlayFabMultiplayerAgentAPI.OnShutDownCallback` triggered when a termination notification is received
- `PlayFabMultiplayerAgentAPI.OnAgentErrorCallback` triggered if there's any error between game server and PlayFab VM Agent communication

> [!Note]
> For more GSDK samples, you can take a look at our MPS Samples repository [here](https://github.com/PlayFab/MpsSamples)
