---
title: Party Unity plugin quickstart
description: Guidance on how to use PlayFab party in your Unity Project.
author: xmcai2016
ms.author: joanlee
ms.date: 06/17/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unity, middleware
---

# Quickstart: PlayFab Party Unity Plugin

This quickstart helps you install the Party SDK for Unity and make your first API calls to join players together in a Party Network. Before continuing, make sure you have completed [Enable Party feature via Game Manager](enable-party.md) from your PlayFab account.

> [!NOTE]
>
> If you intend to use this plugin to develop games based on the Microsoft Game Development Kit (GDK) you need to acquire and install the GDK separately. Please also see details about Unity add-on for Game Core on Xbox consoles.
>

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- An installed copy of the Unity Editor. To install Unity for personal use via Unity Hub, or Unity+ for professional use, see [Download Unity](https://unity3d.com/get-unity/download). Check on Unity support in documentation of your specific platform if needed. The minimum supported Unity version is Unity 2017 LTS.
- A Unity Project, which can be any of the following options:

  - A brand new project: For more information, see [Starting Unity for the first time](/gaming/playfab/sdks/unity3d/quickstart).
  - A guided tutorial project. For more information, see [Getting Started with Unity](https://learn.unity.com/).
  - An existing project.

- The PlayFab "core" Unity3D SDK. For information about installing the Unity3D SDK, see the "Download and install PlayFab SDK" section of [Quickstart: PlayFab Client library for C# in Unity](../../../sdks/unity3d/quickstart.md#download-and-install-playfab-sdk).

## Download and install the PlayFab Party Unity plugin

Following the steps to download and install the PlayFab Party Unity plugin.

1. Download the PlayFab [Party Unity Plugin](https://github.com/playfab/PlayFabPartyUnity) Asset Package (use a distribution point depending on your platform).
1. **Important!** See information in the [README file](https://github.com/PlayFab/PlayFabPartyUnity/blob/master/README.md) published with plugin. It is tailored to each particular version and may include important instructions specific to your platform.
1. Open your Unity Project.
1. Navigate to the location where you saved the .unitypackage and double-click it to open the import dialog.
1. To import the PlayFab Party Unity Plugin into your project, select  **Import**.

## Set up your scene
This part of the guide shows you how to add the `PlayFabMultiplayerManager` to your scene to enable you to call PlayFab Party APIs from Unity.

Before you can create a network, you **must have a PlayFab player logged in**. For information about logging in a player, see [Making your first API call in Quickstart: PlayFab Client library for C# in Unity](../../../sdks/unity3d/quickstart.md#making-your-first-api-call).

1. In the Unity editor, in the Project window, navigate to  **Assets > PlayFabPartySDK > Prefabs**.
1. From the Prefabs folder, drag and drop the  **PlayFabMultiplayerManager**  into your scene in the **Hierarchy** window.
1. Create an empty Game Object in your scene called "HelloPartyLogic".
1. Select the HelloPartyLogic Game Object to open the **Inspector**.
1. Select  **Add Component**.
1. Type "HelloPartyLogic" and press enter to show the new script menu.
1. Press enter again to create the new script, HelloPartyLogic.cs.
1. Find the script in the **Project** window and double-click it to edit the script.
1. Add the following using statement to your script:

    ```csharp
    using PlayFab;
    using PlayFab.Party;
    using PlayFab.ClientModels;
    ```

1. Add the following code in the Start method to log into PlayFab.

    ```csharp
    // Log into playfab
    var request = new LoginWithCustomIDRequest { CustomId = UnityEngine.Random.value.ToString(), CreateAccount = true };
    PlayFabClientAPI.LoginWithCustomID(request, OnLoginSuccess, OnLoginFailure);
    ```

1. Add the following methods to the class.

    ```csharp
    private void OnLoginSuccess(LoginResult result)
    {
    }

    private void OnLoginFailure(PlayFabError error)
    {
    }
    ```

> [!NOTE]
> You might receive the following errors:
>
>  ```
>  Error    CS0227    Unsafe code may only appear if compiling with /unsafe
>  The plugin requires unsafe code because it interops with a native DLL.
>  
>  Mismatch between the processor architecture of the project being built "MSIL" and the processor architecture of the reference "XGamingRuntime", "AMD64".
>  ```

The Microsoft GDK and Windows only support x64.

To resolve these issues:

1. In the Unity Editor, select  **File > Build Settings.**
1. Select your platform. Then from the  **Architecture**  dropdown, select either x86\_64 or x64.
1. Select  **Player Settings.**
1. In the right pane, select Other Setting.
1. Find the **Allow unsafe Code** setting and select it.
1. Close the **Build Settings** and **Project Settings** windows.

## Connecting to a network

This part of the guide shows you how to Create and Join a network.

1. Open the HelloPartyLogic.cs  script. In the `OnLoginSuccess` method, add the following code to create and join a network:

    ```csharp
    PlayFabMultiplayerManager.Get().CreateAndJoinNetwork();
    PlayFabMultiplayerManager.Get().OnNetworkJoined += OnNetworkJoined;
    ```

2. To define the OnNetworkJoined event handler, add the following code to the class:

    ```csharp
    private void OnNetworkJoined(object sender, string networkId)
    {
        // Print the Network ID so you can give it to the other client.
        Debug.Log(networkId);
    }
    ```

3. Save and select Play in the Unity Editor. The Network ID displays in the Console window.

## Joining an existing network

This part of the guide shows you how to join an existing network that another client created.

1. Open the HelloPartyLogic.cs  script. In the OnLoginSuccess method, add the following code to Join a network:

    ```csharp
    string networkId = "<your network id>";
    PlayFabMultiplayerManager.Get().JoinNetwork(networkId);
    ```

2. To define an event that fires when your local client joins the network, add the following code to the `OnLoginSuccess` method:

    ```csharp
    PlayFabMultiplayerManager.Get().OnNetworkJoined += OnNetworkJoined;
    ```

3. To define the OnNetworkJoined event handler, add the following code to the class:

    ```csharp
        private void OnNetworkJoined(object sender, string networkId)
        {
            // Print the Network ID so you can give it to the other client.
            Debug.Log("Network joined!");
        }
    ```

    There are many ways to get the Network ID from the host to other players who want to join. Refer to the sample in this Unity plugin for an example of how to do that.

4. Save and select Play in the Unity Editor. The string "Network joined!" displays in the Console window.

## Accessing other players

This part of the guide shows you how to access other players on the network, including the local player.

To listen for new players joining and leaving the network, register for the OnRemotePlayerJoined and OnRemotePlayerLeft events.

1. Open the HelloPartyLogic.cs  script. In the OnLoginSuccess method, add the following code to Create and Join a network:

    ```csharp
    PlayFabMultiplayerManager.Get().OnRemotePlayerJoined += OnRemotePlayerJoined;
    PlayFabMultiplayerManager.Get().OnRemotePlayerLeft += OnRemotePlayerLeft;
    ```

1. Add the following methods to the class:

    ```csharp
    private void OnRemotePlayerLeft(object sender, PlayFabPlayer player)
    {
    }
    
    private void OnRemotePlayerJoined(object sender, PlayFabPlayer player)
    {
    }
    ```

1. To access the local player, add the following code to the OnRemotePlayerJoined  method:

    ```csharp
    var localPlayer = PlayFabMultiplayerManager.Get().LocalPlayer;
    ```

The PlayFabPlayer class contains properties for identifying the player, muting, and rendering their chat state in a chat UI.

## Sending and receiving data messages

This part of the guide shows you how to send and receive data messages. Before you can start sending and receiving data messages, you must join a network.

1. Open the HelloPartyLogic.cs  script. In the OnLoginSuccess method, add the following code to listen for data messages:

    ```csharp
    PlayFabMultiplayerManager.Get().OnDataMessageReceived += LocalPlayer_OnDataMessageReceived;
    ```

2. Add the `OnDataMessageRecieved` event handler to the class:

    ```csharp
    private void OnDataMessageReceived(object sender, PlayFabPlayer from, byte[] buffer)
    {
        Debug.Log(Encoding.Default.GetString(buffer));
    }
    ```

3. To send a data message, add the following code to the Update method:

    ```csharp
    if (Input.GetButtonDown("Fire1"))
    {
        byte[] requestAsBytes = Encoding.UTF8.GetBytes("Hello (data message)");
        PlayFabMultiplayerManager.Get().SendDataMessageToAllPlayers(requestAsBytes);
    }
    ```

Save HelloPartyLogic.cs and select Play in the Unity Editor.

1. In a second client, repeat the steps from [Connecting to a network](#connecting-to-a-network) to create and join a network.
1. Copy the Network ID returned to your first client and connect to the network.
1. Select on the scene to send a message. "Hello (data message)" displays in the Console window.

## Sending and receiving chat messages

This part of the guide shows you how to send and receive chat messages and mute remote players. In addition to text chat, Party automatically enables voice chat between players.

Before you can start sending and receiving chat messages, you must join a network.

1. Open the HelloPartyLogic.cs  script. In the OnLoginSuccess method, add the following code to listen for chat messages:

    ```csharp
    PlayFabMultiplayerManager.Get().OnChatMessageReceived += OnChatMessageReceived;
    ```

2. Add the event handler `OnChatMessageReceived` to the class;

    ```csharp
    private void OnChatMessageReceived(object sender, PlayFabPlayer from, string message, ChatMessageType type)
    {
        Debug.Log(message);
    }
    ```

Save HelloPartyLogic.cs and press Play in the Unity Editor.

1. In a second client, repeat the steps from [Connecting to a network](#connecting-to-a-network) to create and join a network.
1. Copy the Network ID returned to your first client and connect to the network.
1. When you select on your scene, it sends a message and which displays in the Console window.
1. If you want to give your players the option to mute other players, set the IsMuted property to true.

    ```csharp
    private void OnRemotePlayerJoined(object sender, PlayFabPlayer player)
    {
        // This player will not be able to send text or voice communication.
        // Data messages can still be sent.+
        player.IsMuted = true;
    }
    ```
## Connecting to a network with custom peer connectivity configuration options

This part of the guide shows you how to Create and Join a network with custom peer connectivity configuration options. The default
option is P2P, however, using any combination of the flags presented here: [DirectPeerConnectivityOptions](unity-party-api-reference/enums/partyunitydirectpeerconnectivityoptions.md), the user can modify this option. This example shows how P2P is set:

1. Open the HelloPartyLogic.cs  script. In the `OnLoginSuccess` method, add the following code to create and join a network:

    ```csharp
    PlayfabNetworkConfiguration networkConfiguration = new PlayfabNetworkConfiguration();
    networkConfiguration.DirectPeerConnectivityOptions = PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_ANY_PLATFORM_TYPE |
                                                         PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_ANY_ENTITY_LOGIN_PROVIDER;
    PlayFabMultiplayerManager.Get().CreateAndJoinNetwork(networkConfiguration);
    PlayFabMultiplayerManager.Get().OnNetworkJoined += OnNetworkJoined;
    ```

## Handling title suspension
Some platforms support temporarily suspending execution of your title: iOS, Switch, and GDK.
When your title is suspended, the network stack becomes invalidated and PlayFab Party is unable to maintain a connection to the PlayFab Party network.
Special consideration is required to handle suspending and resuming execution of your title when using PlayFab Party.

### iOS
On iOS, you must leave and reconnect to the PlayFab Party network, which can be achieved by calling [ResetParty()](unity-party-api-reference/classes/playfabmultiplayermanager/methods/playfabunityresetparty.md)

### Switch and GDK
On Nintendo Switch and Microsoft GDK, you must clean up PlayFab Party and all resources associated with PlayFabMultiplayerManager then wait until the title execution resumes before reinitializing PlayFab Party and reconnecting to your network.

"To clean up PlayFab Party during a title suspension call [Suspend()](unity-party-api-reference/classes/playfabmultiplayermanager/methods/playfabunitysuspend.md). Once the title has resumed execution call [Resume()](unity-party-api-reference/classes/playfabmultiplayermanager/methods/playfabunityresume.md) to reinitialize PlayFab Party.

Once PlayFab Party and all resources associated with PlayFabMultiplayerManager are successfully initialized, repeat the steps to [Join an existing network](#joining-an-existing-network).
