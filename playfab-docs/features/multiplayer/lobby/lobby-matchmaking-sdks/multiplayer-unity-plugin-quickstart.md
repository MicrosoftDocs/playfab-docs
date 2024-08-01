---
title: Multiplayer Unity plugin quickstart
description: Guidance on how to use PlayFab Multiplayer plugin in your Unity Project.
author: vicodex
ms.author: victorku
ms.date: 11/23/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, unity, middleware
---

# Quickstart: PlayFab Multiplayer Unity plugin
 

Get started with the PlayFab Multiplayer Unity plugin. Follow steps below to install the package and try out example code for a basic task.

This quickstart helps you make your first API calls using the PlayFab Multiplayer SDK for Unity. Before continuing, make sure you complete [Quickstart: PlayFab Client library for C# in Unity](../../../../sdks/unity3d/quickstart.md), which ensures you have a PlayFab account and are familiar with logging into PlayFab from your game and the PlayFab Game Manager.

> [!NOTE]
>
> If you intend to use this plugin to develop games based on the Microsoft Game Development Kit (GDK) you need to acquire and install the GDK separately. Please also see details about Unity add-on for Game Core on Xbox consoles.
>

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- An installed copy of the Unity Editor. To install Unity for personal use via Unity Hub, or Unity+ for professional use, see [Download Unity](https://unity3d.com/get-unity/download). Check on Unity support in documentation of your specific platform if needed. The minimum supported Unity version is Unity 2017 LTS.
- A Unity Project – this can be any of the following:

  - A brand new project: For more information, see [Starting Unity for the first time](/gaming/playfab/sdks/unity3d/quickstart).
  - A guided tutorial project. For more information, see [Getting Started with Unity](https://learn.unity.com/).
  - An existing project.

- The PlayFab "core" Unity3D SDK (also included in Multiplayer Unity plugin). For information about installing the Unity3D SDK, see the "Download and install PlayFab SDK" section of [Quickstart: PlayFab Client library for C# in Unity](../../../../sdks/unity3d/quickstart.md#download-and-install-playfab-sdk).

## Download and install the PlayFab Multiplayer Unity plugin

Following the steps to download and install the PlayFab Multiplayer Unity plugin.

1. Download the PlayFab [Multiplayer Unity Plugin](https://github.com/PlayFab/PlayFabMultiplayerUnity) Asset Package (use a distribution point depending on your platform).
1. **Important!** See information in README file published with plugin. It's tailored to each particular version and might include important instructions specific to your platform.
1. Open your Unity Project.
1. Navigate to the location where you saved the .unitypackage and double-click it to open the import dialog.
1. To import the PlayFab Multiplayer Unity Plugin into your project, select  **Import**.

Note: you might need to install a newer version of PlayFab "core" Unity SDK if necessary.

## Set up your scene
This part of the guide shows you how to add the `PlayfabMultiplayerEventProcessor` to your scene to enable you to call PlayFab Multiplayer APIs from Unity.

Before you can use Multiplayer API, you **must have a PlayFab player logged in**. For information about logging in a player, see [Making your first API call in Quickstart: PlayFab Client library for C# in Unity](../../../../sdks/unity3d/quickstart.md#making-your-first-api-call).

1. In the Unity editor, in the Project window, navigate to  **Assets > PlayFabMultiplayerSDK > Prefabs**.
1. From the Prefabs folder, drag and drop the **PlayfabMultiplayerEventProcessor** into your scene in the **Hierarchy** window.
1. Create an empty Game Object in your scene called "HelloMultiplayerLogic".
1. Select the HelloMultiplayerLogic Game Object to open the **Inspector**.
1. Select  **Add Component**.
1. Type "HelloMultiplayerLogic" and press enter to show the new script menu.
1. Press enter again to create the new script, HelloMultiplayerLogic.cs.
1. Find the script in the **Project** window and double-click it to edit the script.
1. Add the following using statement to your script:

    ```csharp
    using PlayFab;
    using PlayFab.Multiplayer;
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

## Create and Join a lobby

This part of the guide shows you how to Create and Join a lobby.

1. Open the HelloMultiplayerLogic.cs  script. In the `OnLoginSuccess` method, add the following code to create and join a lobby:

    ```csharp
    string entityId = ...; // PlayFab user's entity Id
    string entityType = ...; // PlayFab user's entity type

    PlayFabMultiplayer.OnLobbyCreateAndJoinCompleted += this.PlayFabMultiplayer_OnLobbyCreateAndJoinCompleted;
    PlayFabMultiplayer.OnLobbyDisconnected += this.PlayFabMultiplayer_OnLobbyDisconnected;

    var createConfig = new LobbyCreateConfiguration()
    {
        MaxMemberCount = 10,
        OwnerMigrationPolicy = LobbyOwnerMigrationPolicy.Automatic,
        AccessPolicy = LobbyAccessPolicy.Public
    };

    createConfig.LobbyProperties["Prop1"] = "Value1";
    createConfig.LobbyProperties["Prop2"] = "Value2";

    var joinConfig = new LobbyJoinConfiguration();
    joinConfig.MemberProperties["MemberProp1"] = "MemberValue1";
    joinConfig.MemberProperties["MemberProp2"] = "MemberValue2";

    PlayFabMultiplayer.CreateAndJoinLobby(
        new PFEntityKey(
            entityId,
            entityType),
        createConfig,
        joinConfig);
    ```

2. To define the OnLobbyCreateAndJoinCompleted event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnLobbyCreateAndJoinCompleted(Lobby lobby, int result)
    {
        if (LobbyError.SUCCEEDED(result))
        {
            // Lobby was successfully created
            Debug.Log(lobby.ConnectionString);
        }
        else
        {
            // Error creating a lobby
            Debug.Log("Error creating a lobby");
        }
    }
    ```

3. To define the OnLobbyDisconnected event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnLobbyDisconnected(Lobby lobby)
    {
        // Disconnected from lobby
        Debug.Log("Disconnected from lobby!");
    }
    ```

4. Save and select Play in the Unity Editor. The lobby connection string displays in the Console window.

## Join a lobby

This part of the guide shows you how to join an existing lobby that another client created.

1. Open the HelloMultiplayerLogic.cs  script. In the OnLoginSuccess method, add the following code to Join a lobby:

    ```csharp
    PFEntityKey entityKey = ...; // PlayFab user's entity key

    string connectionString = "<your lobby connection string>";

    PlayFabMultiplayer.JoinLobby(
            entityKey,
            connectionString,
            null);
    ```

2. To define an event that fires when your local client joins the lobby, add the following code to the `OnLoginSuccess` method:

    ```csharp
    PlayFabMultiplayer.OnLobbyJoinCompleted += this.PlayFabMultiplayer_OnLobbyJoinCompleted;
    ```

3. To define the OnLobbyJoinCompleted event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnLobbyJoinCompleted(Lobby lobby, PFEntityKey newMember, int reason)
    {
        if (LobbyError.SUCCEEDED(reason))
        {
            // Successfully joined a lobby
            Debug.Log("Joined a lobby");
        }
        else
        {
            // Error joining a lobby
            Debug.Log("Error joining a lobby");
        }
    }
    ```

4. Save and select Play in the Unity Editor. The string "Joined a lobby" displays in the Console window.

## Find lobbies

This part of the guide shows you how to find existing lobbies that other clients created.

1. Open the HelloMultiplayerLogic.cs  script. In the OnLoginSuccess method, add the following code to find lobbies:

    ```csharp
    PFEntityKey entityKey = ...; // PlayFab user's entity key

    LobbySearchConfiguration config = new LobbySearchConfiguration();
    PlayFabMultiplayer.FindLobbies(entityKey, config);
    ```

2. To define an event that fires when your local client finds lobbies, add the following code to the `OnLoginSuccess` method:

    ```csharp
    PlayFabMultiplayer.OnLobbyFindLobbiesCompleted += this.PlayFabMultiplayer_OnLobbyFindLobbiesCompleted;
    ```

3. To define the OnLobbyFindLobbiesCompleted event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnLobbyFindLobbiesCompleted(
        IList<LobbySearchResult> searchResults, 
        PFEntityKey newMember, 
        int reason)
    {
        if (LobbyError.SUCCEEDED(reason))
        {
            // Successfully found lobbies
            Debug.Log("Found lobbies");

            // Iterate through lobby search results
            foreach (LobbySearchResult result in searchResults)
            {
                // Examine a search result
            }
        }
        else
        {
            // Error finding lobbies
            Debug.Log("Error finding lobbies");
        }
    }
    ```

4. Save and select Play in the Unity Editor. The string "Found lobbies" displays in the Console window.

## Create a matchmaking ticket

This part of the guide shows you how to Create a matchmaking ticket. Run it with the scenario "Join a matchmaking ticket" on another client below.

1. Open the HelloMultiplayerLogic.cs  script. In the `OnLoginSuccess` method, add the following code to create a matchmaking ticket:

    ```csharp
    PFEntityKey entityKey = ...; // PlayFab user's entity key
    PFEntityKey remoteEntityKey = ...; // another PlayFab user's entity key
    string remoteUserAttributesJson = ...; // JSON string with another PlayFab user's attributes for matchmaking

    PlayFabMultiplayer.OnMatchmakingTicketStatusChanged += PlayFabMultiplayer_OnMatchmakingTicketStatusChanged;

    List<MatchUser> localUsers = new List<MatchUser>();
    localUsers.Add(new MatchUser(entityKey, remoteUserAttributesJson));

    List<PFEntityKey> membersToMatchWith = new List<PFEntityKey>();
    membersToMatchWith.Add(remoteEntityKey);

    PlayFabMultiplayer.CreateMatchmakingTicket(
        localUsers,
        "QuickMatchQueueName",
        membersToMatchWith);
    ```

2. To define the OnMatchmakingTicketStatusChanged event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnMatchmakingTicketStatusChanged(MatchmakingTicket ticket)
    {
        // Store and print matchmaking ticket
        Debug.Log(ticket.TicketId);

        // Examine matchmaking ticket status
        Debub.Log(ticket.Status)

        // Share matchmaking ticket with other clients taking part in matchmaking

        // Examine ticket
    }
    ```

3. Save and select Play in the Unity Editor.

If membersToMatchWith is specified, one OnMatchmakingTicketStatusChanged event handler will be triggered and the Status will be WaitingForPlayers. In that case, once another client calls JoinMatchmakingTicketFromId a new OnMatchmakingTicketStatusChanged event handler will be triggered and the status this time will be WaitingForMatch.

Alternatively, one OnMatchmakingTicketStatusChanged event handler will be triggered and the status will be WaitingForMatch.

## Join a matchmaking ticket

This part of the guide shows you how to join an existing matchmaking ticket that another client created. Run it with the scenario "Create a matchmaking ticket" on another client above.

1. Open the HelloMultiplayerLogic.cs  script. In the OnLoginSuccess method, add the following code to join a matchmaking ticket:

    ```csharp
    PFEntityKey entityKey = ...; // PlayFab user's entity key
    string ticketId = ...; // Matchmaking ticket obtained from the client that created the ticket

    PlayFabMultiplayer.OnMatchmakingTicketCompleted += PlayFabMultiplayer_OnMatchmakingTicketStatusChanged;

    // Create JSON string with PlayFab user's attributes for matchmaking. This will need to be shared with other clients taking part in matchmaking
    string uniqueId = System.Guid.NewGuid().ToString();
    string userAttributesJson = "{\"MatchIdentifier\": \"" + uniqueId + "\"}";

    PlayFabMultiplayer.JoinMatchmakingTicketFromId(
        new MatchUser(entityKey, userAttributesJson),
        ticketId,
        "QuickMatchQueueName",
        new List<PFEntityKey>());
    ```

2. To define the OnMatchmakingTicketStatusChanged event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnMatchmakingTicketStatusChanged(MatchmakingTicket ticket)
    {
        // Store and print matchmaking ticket
        Debug.Log(ticket.TicketId);

        // Examine matchmaking ticket status
        Debub.Log(ticket.Status)

        // Share matchmaking ticket with other clients taking part in matchmaking

        // Examine ticket
    }
    ```

3. Save and select Play in the Unity Editor.

One OnMatchmakingTicketStatusChanged will be triggered with the Status being WaitingForMatch.

##  Complete a matchmaking ticket

This part of the guide shows you how matchmaking is completed. Run it with the scenario "Create a matchmaking ticket" on another client above. Optionally, you can run it with the scenario "Join a matchmaking ticket".

1. A match will be found once multiple tickets in the same queue are eligible to be matched. In that case,
OnMatchmakingTicketCompleted event handler is triggered.

2. Subscribe to OnMatchmakignTicketCompleted handler
    ```csharp
    PlayFabMultiplayer.OnMatchmakingTicketCompleted += PlayFabMultiplayer_OnMatchmakingTicketCompleted;
    ```

3. To define the OnMatchmakingTicketCompleted event handler, add the following code to the class:

    ```csharp
    private void PlayFabMultiplayer_OnMatchmakingTicketCompleted(MatchmakingTicket ticket, int result)
    {
        if (LobbyError.SUCCEEDED(result))
        {
            // Successfully completed matchmaking ticket
            Debug.Log("Completed matchmaking ticket");

            // Examine matchmaking details
            MatchmakingMatchDetails details = ticket.GetMatchDetails();
        }
        else
        {
            // Error completing a matchmaking ticket
            Debug.Log("Error completing a matchmaking ticket");
        }
    }
    ```
