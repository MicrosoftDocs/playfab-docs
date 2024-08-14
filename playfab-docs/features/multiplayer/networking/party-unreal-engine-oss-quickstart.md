---
title: PlayFab Online Subsystem (OSS) Quickstart
description: Guidance on how to use PlayFab Party and Multiplayer SDKs in your Unreal Engine Project.
author: PushpadantK
ms.author: pkacha
ms.date: 05/10/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, ue4, ue5, middleware
---

# QuickStart: PlayFab Online Subsystem (OSS)

This quickstart guide helps you set up and use Multiplayer features such as Lobby, Matchmaking and Party for Xbox, PC, Nintendo Switch, PlayStation®5 and PlayStation®4 games built using Unreal Engine 4 or Unreal Engine 5. For the full list of supported platforms and versions in UE4 or UE5, see [Supported platforms](party-unreal-engine-oss-overview.md).

After following the relevant steps that are outlined in this page for your target platforms, you'll be ready to start using the OSS. Authentication, networking, VOIP, grouping into lobbies, and matchmaking is handled on your behalf with no other changes required.

## Download and install PlayFab Online Subsystem

Go to [PlayFab Online SubSystem](https://github.com/PlayFab/PlayFabMultiplayerUnreal) to download or clone PlayFab Online SubSystem source. The downloaded or cloned repository name is PlayFabMultiplayerUnreal. **The repository has to be renamed to OnlineSubsystemPlayFab**. 

## What you need

* **PlayFab Title ID:** If you don't have a Title ID configured for PlayFab Party and Multiplayer SDKs, see [Enabling PlayFab Party](enable-party.md).

### GDK, PC, Switch, PlayStation®5 and PlayStation®4

* **Specific platform PlayFab Party and Lobby and Matchmaking libraries:** See [Obtaining PlayFab Party and Multiplayer libraries](party-unreal-engine-oss-obtaining-playfab-party-libraries.md).

## Initial setup

### Unreal Engine code base
* Copy the **OnlineSubsystemPlayFab** folder and its contents from to your UE directory under **Engine\Plugins\Online**.
* Run **GenerateProjectFiles.bat** to create project files for the engine.
* Load the project into Visual Studio by double-clicking the new **UE5.sln** file.
* Set your solution configuration to **Development Editor** and your solution platform to **Win64**, then right click the **UE5** target and select **Build**.
### Game code base
* Apply the following changes to the Plugins section of your **.uproject** file to add the OnlineSubsystemPlayFab to your plugin list.
  * You may remove any platforms that you're not shipping on
  * Use XboxOneGDK instead of XB1 if you're using UE4, since UE5 deprecates XboxOneGDK

```json
{
 "Name": "OnlineSubsystemPlayFab",
 "Enabled": true,
 "WhitelistPlatforms": [
  "XB1",
  "WinGDK",
  "XSX",
  "Win64",
  "Switch",
  "PS4",
  "PS5"
 ],
 "SupportedTargetPlatforms": [
  "XB1",
  "WinGDK",
  "XSX",
  "Win64",
  "Switch",
  "PS4",
  "PS5"
 ]
}
```
* Generate the game solution file by right-clicking the **.uproject** file and selecting 'Switch Unreal Engine Version' to the above Unreal Engine code path.

## Game Configuration

* No matter which platform you're targeting, your game needs to configure certain PlayFab specific values in your intended platform target's INI file (located at [yourGameDirectory]/Platforms/[yourPlatform]/Config).
  * **Xbox Series X GDK:** XSXEngine.ini
  * **PC GDK:** WinGDKEngine.ini
  * **Xbox One GDK:** XB1Engine.ini (or XboxOneGDKEngine.ini if you're using UE4)
  * **PC Steam:** WindowsEngine.ini (or find it in [yourGameDirectory]/Config/Windows)
  * **Nintendo Switch** SwitchEngine.ini
  * **PS4™** PS4Engine.ini
  * **PS5™** PS5Engine.ini
* Replace the INI sections in the config if they already exist (for example, Engine.GameEngine) with the ones presented in the following sections.
* Ensure you replace all the *\<REPLACE ME>* fields with your data:

```ini
[OnlineSubsystemPlayFab]
bEnabled=true
PlayFabTitleID=<REPLACE ME with your PlayFab title ID>
MaxDeviceCount=<REPLACE ME with your max player count (note: split screen is still 1 device). In the example of an 8 player game, this would be 8.>
MaxDevicesPerUserCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device) In the example of an 8 player game, this would be 1.>
MaxEndpointsPerDeviceCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device)  In the example of an 8 player game, this would be 1.>
MaxUserCount=<REPLACE ME with your max player count (note: split screen is still 1 device)  In the example of an 8 player game, this would be 8.>
MaxUsersPerDeviceCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device)  In the example of an 8 player game, this would be 1.>
DirectPeerConnectivityOptions=<REPLACE ME with your connectivity options, in the form of an array of strings. The default case corresponds to the following:
+DirectPeerConnectivityOptions=AnyPlatformType
+DirectPeerConnectivityOptions=AnyEntityLoginProvider.
If you want to disable P2P and use cloud relay instead, set DirectPeerConnectivityOptions=None>
bHasPlayFabVoiceEnabled=<REPLACE ME with true/false>

[/Script/OnlineSubsystemPlayFab.PlayFabNetDriver]
NetConnectionClassName="OnlineSubsystemPlayFab.PlayFabNetConnection"
ReplicationDriverClassName="<REPLACE ME with your existing replication driver class name>" . Skip if the game doesn't have a replication driver class (https://docs.unrealengine.com/5.2/en-US/replication-graph-in-unreal-engine/).
ConnectionTimeout=15.0
InitialConnectTimeout=30.0

[/Script/Engine.GameEngine]
!NetDriverDefinitions=ClearArray
+NetDriverDefinitions=(DefName="GameNetDriver",DriverClassName="OnlineSubsystemPlayFab.PlayFabNetDriver",DriverClassNameFallback="OnlineSubsystemUtils.IpNetDriver")
```

## Platform Specific Considerations

With all that done, we're nearly finished. There are only a few key platform-specific parameters left that must be set.  

### GDK

If you're developing games using GDK, define the platform services:

```ini
[OnlineSubsystem]
DefaultPlatformService=PlayFab
NativePlatformService=GDK
```

### Steam

If you're developing games for Win64 with Steam, define your platform services:

```ini
[OnlineSubsystem]
DefaultPlatformService=PlayFab
NativePlatformService=Steam
```

### Switch

For more information about Switch, see the [ReadMe.md](https://dev.azure.com/PlayFabPrivate/Switch/_git/PlayFabMultiplayerUnrealSwitch?path=/README.md) file that comes with the Switch PlayFab OSS. If you don't have access, you can [request access](request-access-for-sdks-samples.md) to our private repositories.

### PS5™ and PS4™

For more information about PS5™ and PS4™, see the [ReadMe.md](https://dev.azure.com/PlayFabPrivate/PS5/_git/PlayFabMultiplayerUnrealPlayStation?path=/README.md) file that comes with the PS5™ and PS4™ PlayFab OSS. If you don't have access, you can [request access](request-access-for-sdks-samples.md) to our private repositories.

### Cross-platform

Finally, if your game makes use PlayFab's cross-platform networking support, define which platforms you permit to connect:

```ini
[/Script/OnlineSubsystemUtils.OnlineEngineInterfaceImpl]
!CompatibleUniqueNetIdTypes=ClearArray
+CompatibleUniqueNetIdTypes=STEAM
+CompatibleUniqueNetIdTypes=GDK
+CompatibleUniqueNetIdTypes=SWITCH
+CompatibleUniqueNetIdTypes=PS4
+CompatibleUniqueNetIdTypes=PS5
```

All platforms allow VoIP by default. To disable VoIP for a specific platform, add the platform model name to your UE configuration file as shown in the following example.
```ini
[OnlineSubsystemPlayFabVoiceChatDisabledPlatforms]
!Platforms=ClearArray
+Platforms=WIN64
+Platforms=STEAM
+Platforms=SWITCH
+Platforms=PS4
+Platforms=PS5
```
These steps complete the setup of OSS required to be used in your game.  Good luck!

## Use in Game Code
>[!NOTE]
> PlayFab Online Subsystem only supports Game Session naming as `NAME_GameSession`

Similar to using other Online Subsystem plugins:

Add `PublicDependencyModuleNames.AddRange(new string[] { "OnlineSubsystem", "OnlineSubsystemUtils" });` in **Game.Build.cs**, then use it the same way as other game plugins.

Example code in GameSession.cpp:

```cpp
#include "OnlineSubsystem.h"
#include "OnlineSubsystemUtils.h"

...

bool Game::JoinSession(const FUniqueNetIdPtr UserId, FName SessionName, const FOnlineSessionSearchResult& SearchResult)
{

	IOnlineSubsystem* OnlineSub = Online::GetSubsystem(GetWorld()); // Using OnlineSubsystemPlayFab plugin
	if (OnlineSub)
	{
		IOnlineSessionPtr Sessions = OnlineSub->GetSessionInterface(); // Using OnlineSessionInterfacePlayFab.h
		if (Sessions.IsValid() && UserId.IsValid())
		{
			// ...
		}
	}
	// ...
}

```

Example code in GameFriends.cpp:
```cpp
#include "OnlineSubsystem.h"
#include "OnlineSubsystemUtils.h"

...

void Game::ViewFriendProfile()
{
	IOnlineSubsystem* OnlineSub = Online::GetSubsystem(GetWorld()); // Using OnlineSubsystemPlayFab plugin
	if (OnlineSub)
	{
		IOnlineIdentityPtr Identity = OnlineSub->GetIdentityInterface(); // Using OnlineIdentityInterfacePlayFab.h
		if (Identity.IsValid() && Friends.IsValidIndex(FriendIndex))
		{
			// ....
		}
	}
}
```
## Troubleshoot:
Ways to help you troubleshoot issues.

### Unreal Engine Installed Builds

Users may face issues when trying to create an Unreal Engine Installed Build with the OnlineSubsystemPlayFab on GDK build flavors. We provide the following guidance to successfully overcome this issue until there's a more complete solution.

**If you are using UE5.4:**
 * You may encounter the following runtime error: `Runtime dependency Party.dll is configured to be staged from C:\Program Files (x86)\Microsoft GDK\<version>\Party.dll and \Engine\Plugins\Online\OnlineSubsystemPlayFab\Platforms\GDK\Redist\Party.dll`
 * Navigate to Engine\Platforms\GDK\Plugins\Online\OnlineSubsystemGDK\
 * Open OnlineSubsystemGDK.uplugin and set `PlayFabParty` to disabled:
    ```json
    {
        "Name": "PlayFabParty",
        "Enabled": false
    }
	```

 * Navigate to Engine\Platforms\GDK\Plugins\Online\OnlineSubsystemGDK\Source\
 * Open OnlineSubsystemGDK.Build.cs and comment out the inclusion of `PlayFabParty`:
    ```csharp
    if (Target.bCompileAgainstEngine)
    {
        //PublicDependencyModuleNames.Add("PlayFabParty");
    }
	```

**If you are using UE5.0 - 5.3:**
 * Locate the directory where Unreal Engine is installed on the machine.
 * Navigate to Engine\Platforms\GDK\Plugins\Online\PlayFabParty
 * Open PlayFabParty.uplugin, and update Modules config with **PlatformDenyList**:
    ```ini
    "Modules": [
            {
                "Name": "PlayFabParty",
                "Type": "Runtime",
                "LoadingPhase": "Default",
                "HasExplicitPlatforms": true,
                "PlatformDenyList": [ "WinGDK", "Win64" ]
            }
        ],
    ```
* Repeat the above process for XB1 (PlayFabParty_XB1.uplugin) and XSX (PlayFabParty_XSX.uplugin) if these platforms are required for the Installed Build. If Win64 is also a required platform for the installed build, add Win64 in the array of **PlatformDenyList**.

**If you are using UE4.27+,**
 * Locate the directory where Unreal Engine is installed on the machine.
 * Navigate to Engine\Platforms\GDK\Plugins\Online\PlayFabParty
 * Open PlayFabParty.uplugin
 * Replace the key **WhitelistPlatforms** with **BlacklistPlatforms**
 * Repeat the process for XboxOneGDK (PlayFabParty_XboxOneGDK.uplugin) and XSX (PlayFabParty_XSX.uplugin) if these platforms are required for the Installed Build. If Win64 is also a required platform for the installed build, add Win64 in the array of **BlacklistPlatforms**.
    
    Example Modules config in PlayFabParty.uplugin for UE4.27+::
```ini
	"Modules": [
		{
			"Name": "PlayFabParty",
			"Type": "Runtime",
			"LoadingPhase": "Default",
			"BlacklistPlatforms": ["WinGDK", "Win64"]
		}
	],
```

### HandShake failure on Steam
If you are seeing handshake failure (such as `LogHandshake: IncomingConnectionless: Error reading handshake packet`), refer to this [UE Forum post](https://forums.unrealengine.com/t/ue-5-1-steam-sockets-problem/696726) to check the settings.

## Workflow for OnlineSubsystemPlayFab

The steps outlined in the [Platform Specific Considerations](#platform-specific-considerations) section ask you to include:
```ini
[OnlineSubsystem]
DefaultPlatformService=PlayFab
```
UE OnlineSubsystemModule creates an online subsystem instance for PlayFab and starts creating ⁠the PlayFabSingleton. At this point, SDK is initialized in⁠ `FOnlineSubsystemPlayFab::Init()`,
where it initializes both Party and Multiplayer SDKs with PlayFab TitleID (this titleID is defined inside the [Game Configuration](#game-configuration) file. During initialization,
we'll `⁠CreatePlayFabSocketSubsystem()` as the main online subsystem. 

Workflow of Multiplayer SDK: `FOnlineSubsystemPlayFab::Init()` initializes the `InitializeMultiplayer()` multiplayer SDK singleton for your title. In the `PlayFabLobby.cpp`, `FPlayFabLobby::DoWork()` processes the
state changes triggered by Multiplayer APIs (view `Platforms/GDK/Include/PFLobby.h` for APIs).

Workflow of Party SDK: `FOnlineSubsystemPlayFab::Init()` initializes the `InitializeParty()` multiplayer SDK singleton for your title. In the `OnlineSubsystemPlayFab.cpp`, `FOnlineSubsystemPlayFab::DoWork()` processes the
state changes triggered by Party APIs (view `Platforms/GDK/Include/Party.h` for APIs).

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
