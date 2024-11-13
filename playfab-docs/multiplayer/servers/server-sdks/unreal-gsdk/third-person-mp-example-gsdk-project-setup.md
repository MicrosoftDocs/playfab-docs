---
title: GSDK Project Setup
author: joannaleecy
description: Adding the GSDK to an Unreal Project
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal
ms.localizationpriority: medium
---

# Add GSDK to Project

This article describes how to upgrade an existing project so it can be hosted on PlayFab Multiplayer Servers (MPS). The process involves adding and configuring PlayFab GSDK into an Unreal project. The instructions here are written using the Unreal ThirdPersonMP template project.

Note, your Unreal project must have the following capabilities:

* Networking
* Multiplayer
* Dedicated Game-Server

If not, you will need to return to the [Example Project Setup](third-person-mp-example-project-setup.md) guide to configure your project as a network-enabled multiplayer game, with dedicated server capabilities.

## Goals

We will add and configure the PlayFab Unreal GSDK to your project, and test it locally to verify it is expected to work on PlayFab Multiplayer Services.

## Requirements

* Download Visual Studio. The [community version](https://visualstudio.microsoft.com/vs/community/) is free.
    * Required workloads: .NET desktop development and Desktop development with C++
* Download Unreal Engine Source Code. For instructions, see [Downloading Unreal Engine Source code (external)](https://docs.unrealengine.com/ProgrammingAndScripting/ProgrammingWithCPP/DownloadingSourceCode/).
* A completed [ThirdPersonMP Example Project](third-person-mp-example-project-setup.md), or a project with similar capabilities
* [PlayFab Unreal GSDK plugin](https://github.com/PlayFab/gsdk/tree/master/UnrealPlugin)
* [Optional] [PlayFab Marketplace plugin](https://www.unrealengine.com/marketplace/product/playfab-sdk) or the [source version on GitHub](https://github.com/PlayFab/UnrealMarketplacePlugin). This plugin is not required for GSDK but is required for many PlayFab services, including login.

## C++ Implementation

### Add the plugin to the project

Follow these steps to add the Unreal GSDK to your project:

* Go to your Unreal project
* Open File Explorer and create a **Plugins** folder in your games' root directory. In the Plugins folder, create a folder called **PlayFabGSDK.**
* Go to **{depot}\\GSDK\\gsdk\\UnrealPlugin**. Drag all the files from the **UnrealPlugin** folder into the **Plugins/PlayFabGSDK** folder.
* Lastly, open the ```{ProjectName}.uproject``` file in a text editor of your choice. In the plugins array, add the "PlayFabGSDK" plugin.

See the example below:

```json
{
    "FileVersion": 3,
    "EngineAssociation": "{YourEngineVersion}",
    "Category": "",
    "Description": "",
    "Modules": [
        {
            "Name": "{ProjectName}",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "Engine"
            ]
        }
    ],
    "Plugins": [                    // Add this if it doesn't exist
        {                           // Add this
            "Name": "PlayFabGSDK",  // Add this
            "Enabled": true         // Add this
        }                           // Add this
    ]                               // Add this if it doesn't exist
}
```

### Include the plugin in your modules

* Update {ProjectName}.Build.cs file to add "PlayFabGSDK" into the PublicDependencyModuleNames.AddRange(); list as follows:

```csharp
PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "HeadMountedDisplay", "PlayFabGSDK" });
```

* Right-click on the ```{ProjectName}.uproject``` file and select the option to __Switch Unreal Engine version__, which is how you can quickly check which Unreal Engine version you are currently using. The popup seen below should appear. If you already see that the Unreal Engine version is source build, you don’t need to change anything, so click Cancel. If the Unreal version is not currently the source build, select it from the dropdown list and then click OK.

![image depicting a window that says "Select Unreal Engine Version"](media/SelectUnrealEngineVersion.png)

* Right-click on the ```{ProjectName}.uproject``` file again and select "Generate Visual Studio Project Files".

* Finally, build the project in Visual Studio and start the Editor by selecting the Development Editor configuration.

![image depicting Visual Studio with the option to build in Development Editor Mode](media/DevelopmentEditor.png)

### Project set up

Once your project has enabled server mode, you will have a {ProjectName}Server.Target.cs file.

Result should look similar to:

```csharp
public class {ProjectName}ServerTarget : TargetRules
{
    public {ProjectName}ServerTarget( TargetInfo Target) : base(Target)
    {
        Type = TargetType.Server;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        ExtraModuleNames.AddRange( new string[] { "{ProjectName}" } );

    // You may have additional configuration based on your server needs
    }
}
```

For Windows builds, you may need to add these optional configurations:

```csharp
DisablePlugins.Add("WMFMediaPlayer");
DisablePlugins.Add("AsyncLoadingScreen"); //if you are using this plugin
DisablePlugins.Add("WindowsMoviePlayer");
DisablePlugins.Add("MediaFoundationMediaPlayer");
```

NOTE: These configurations are invalid for a Linux server build.

### Create/Update the GameInstance Class

#### Create a GameInstance Class

If you are in the process of creating a project from scratch and do not yet have a GameInstance class, then first follow these example instructions to create a GameInstance class. If you are using a project, which already has a GameInstance class (for example, ShooterGame from Unreal's sample library), then move on to the section titled _**Modify the GameInstance class**_.

----

In the Unreal Editor:

* Select __Files__
* Select __Create a new C++ class__
* Select __Show all classes__
* Type ```GameInstance``` into the search field
    * By selecting it directly as described, everything should be generated correctly and then you can add the functions we detail below
* Close Unreal and __Generate project files__ in source build mode again
* Using Visual Studio, open those newly created files and follow instructions to modify the GameInstance class.

#### Modify the GameInstance class

Depending on the setup of your project, you can modify the GameInstance class using C++ or Blueprints. Both ways are presented below, you should select the one that fits your needs.

#### C++ implementation

Locate your GameInstance class, which is most likely called something similar to {ProjectName}GameInstance or MyGameInstance. From now on, your GameInstance class will be denoted with [YourGameInstanceClassName].

##### Modify the GameInstance header file

First, check the include statements and ensure that the following are included in the header file for your GameInstance class ([YourGameInstanceClassName].h):

```cpp
#include "CoreMinimal.h"
#include "Engine/GameInstance.h"
#include "MyGameInstance.generated.h"
```
[Optional] With the following code, the user can introduce a log channel specifically for the GameInstance. Alternatively, logging with LogTemp is sufficient.

```cpp
DECLARE_LOG_CATEGORY_EXTERN(LogPlayFabGSDKGameInstance, Log, All);
```

Then, add the following declarations to the public section: (If you already have an Init() function, there is no need to include another declaration)

```cpp
public:

    virtual void Init() override;
    virtual void OnStart() override;
```

Then, add the following declarations to the protected section of methods:

```cpp
protected:

    UFUNCTION()
    void OnGSDKShutdown();

    UFUNCTION()
    bool OnGSDKHealthCheck();

    UFUNCTION()
    void OnGSDKServerActive();

    UFUNCTION()
    void OnGSDKReadyForPlayers();

};
```

##### Modify the GameInstance CPP file

Then, locate the [YourGameInstanceClassName].cpp file.

Make sure that the following are included:

```cpp
#include "[YourGameInstanceClassName].h"
#include "PlayfabGSDK.h"
#include "GSDKUtils.h"
```

If the custom log channel has been introduced in the header file, then the following code is necessary:

```cpp
DEFINE_LOG_CATEGORY(LogPlayFabGSDKGameInstance);

```

Then locate your Init() function. If you _**don't**_ have an Init() function yet, then add in the function as such:

###### Create Init() function

```cpp
void U[YourGameInstanceClassName]::Init()
{
    FOnGSDKShutdown_Dyn OnGSDKShutdown;
    OnGSDKShutdown.BindDynamic(this, &UMyGameInstance::OnGSDKShutdown);
    FOnGSDKHealthCheck_Dyn OnGSDKHealthCheck;
    OnGSDKHealthCheck.BindDynamic(this, &UMyGameInstance::OnGSDKHealthCheck);
    FOnGSDKServerActive_Dyn OnGSDKServerActive;
    OnGSDKServerActive.BindDynamic(this, &UThirdPersonGameInstance::OnGSDKServerActive);
    FOnGSDKReadyForPlayers_Dyn OnGSDKReadyForPlayers;
    OnGSDKReadyForPlayers.BindDynamic(this, &UThirdPersonGameInstance::OnGSDKReadyForPlayers);

    UGSDKUtils::RegisterGSDKShutdownDelegate(OnGSDKShutdown);
    UGSDKUtils::RegisterGSDKHealthCheckDelegate(OnGSDKHealthCheck);
    UGSDKUtils::RegisterGSDKServerActiveDelegate(OnGSDKServerActive);
    UGSDKUtils::RegisterGSDKReadyForPlayersDelegate(OnGSDKReadyForPlayers);
}
```

----

If you already **had** an Init() function, go to check in ```[YourGameInstanceClassName].cpp``` file to see if you have a variable that indicates whether the instance is for a dedicated server. **If you can find this variable**, then add the following to the end of your Init() function:

###### Modify existing Init() function

```cpp
    if (IsDedicatedServerInstance() == true)
    {
        FOnGSDKShutdown_Dyn OnGsdkShutdown;
        OnGsdkShutdown.BindDynamic(this, &UShooterGameInstance::OnGSDKShutdown);
        FOnGSDKHealthCheck_Dyn OnGsdkHealthCheck;
        OnGsdkHealthCheck.BindDynamic(this, &UShooterGameInstance::OnGSDKHealthCheck);
        FOnGSDKServerActive_Dyn OnGSDKServerActive;
        OnGSDKServerActive.BindDynamic(this, &UShooterGameInstance::OnGSDKServerActive);
        FOnGSDKReadyForPlayers_Dyn OnGSDKReadyForPlayers;
        OnGSDKReadyForPlayers.BindDynamic(this, &UShooterGameInstance::OnGSDKReadyForPlayers);

        UGSDKUtils::RegisterGSDKShutdownDelegate(OnGsdkShutdown);
        UGSDKUtils::RegisterGSDKHealthCheckDelegate(OnGsdkHealthCheck);
        UGSDKUtils::RegisterGSDKServerActiveDelegate(OnGSDKServerActive);
        UGSDKUtils::RegisterGSDKReadyForPlayers(OnGSDKReadyForPlayers);
    }
```

**Complete the Init() function** by calling the following function that sets up the default port for MPS.

```cpp
#if UE_SERVER
    UGSDKUtils::SetDefaultServerHostPort();
#endif
```

----

Lastly, add these method implementations to the bottom of ```[YourGameInstanceClassName].cpp``` file:

```cpp
void UMyGameInstance::OnStart()
{
    UE_LOG(LogPlayFabGSDKGameInstance, Warning, TEXT("Reached onStart!"));
    UGSDKUtils::ReadyForPlayers();
}

void UMyGameInstance::OnGSDKShutdown()
{
    UE_LOG(LogPlayFabGSDKGameInstance, Warning, TEXT("Shutdown!"));
    FPlatformMisc::RequestExit(false);
}

bool UMyGameInstance::OnGSDKHealthCheck()
{
    // Uncomment the next line if you want your server to log something at every heartbeat for sanity check.
    /* UE_LOG(LogPlayFabGSDKGameInstance, Warning, TEXT("Healthy!")); */
    return true;
}

void UThirdPersonGameInstance::OnGSDKServerActive()
{
    /**
     * Server is transitioning to an active state.
     * Optional: Add in the implementation any code that is needed for the game server when
     * this transition occurs.
     */
    UE_LOG(LogPlayFabGSDKGameInstance, Warning, TEXT("Active!"));
}

void UThirdPersonGameInstance::OnGSDKReadyForPlayers()
{
    /**
     * Server is transitioning to a StandBy state. Game initialization is complete and the game
     * is ready to accept players.
     * Optional: Add in the implementation any code that is needed for the game server before
     * initialization completes.
     */
    UE_LOG(LogPlayFabGSDKGameInstance, Warning, TEXT("Finished Initialization - Moving to StandBy!"));
}
```

#### Blueprint implementation

This part is only needed if you have decided to proceed with the Blueprint implementation and not with the pure C++ implementation.

* Observe the Content Browser window in the Unreal Editor
* Pick or create a folder to contain new Blueprints
* Right-Click and create a Blueprint class
* In the All classes dropdown menu, find your GameInstance class
    * In this example, the blueprint is named "MyGameInstance"
* Double-click the blueprint
* On the left side, hover over the function field and select the Override dropdown
* Select the Init function
* Right-click in the graph and add in all register GSDK function
* For GSDK Shutdown and Maintenance Delegate drag out a line from the red square, and select "Add Custom Event"
* For "Register GSDK Health Check Delegate", select the "Create Event" in the "Event Dispatchers".
* ![PlayFab GSDK Health Check add](media/BlueprintAddRegisterHealthCheckDelegate.png)
* In the dropdown of the new node "Create matching function". **This is important, as the GSDK Health Check Delegate has a return value.**
* ![PlayFab GSDK Health Check register](media/BlueprintRegisterHealthCheckDelegate.png)
* In the function, make sure the return boolean value is checked.
* ![PlayFab GSDK Health Check function](media/BlueprintGSDKHealthCheckFunction.png)
* Don't forget to connect all the nodes to the Event Init node.
* In the end add the "ReadyforPlayers" node to be able to react to the ready signal of PlayFab.
* Also, dont forget to add the "SetDefaultServerHostPort" node to connect to the port that GSDK expects.
* For every GSDK function / node that you want to add in your Blueprint, you can verify that it exists by typing the first letters of the name of the function in your new node and seeing the expected GSDK function show up in the suggestions.
* In the end, your Blueprint should be similar to the one presented in the image below.
* ![PlayFab GSDK Full Graph](media/BlueprintFullGraph.png)

## Set the GameInstance class

After creating a custom GameInstance class that integrates with the gsdk, you have to configure your project to actually use this newly created GameInstance class. There are two ways to do this - either through the Unreal Engine editor or by editing DefaultEngine.ini directly.

### In the Unreal Editor

In the editor, the default GameInstance can be set through the UI in the editor. In the editor, go to __Edit__ -> __Project Settings__. From that opened window, navigate to __Maps&Modes__ on the left side. Scroll to the bottom, and then you can set the option ```GameInstanceClass``` to your new GameInstance class directly (avoid typos, it must be an exact match).

### In DefaultEngine.ini

Or you can update DefaultEngine.ini file and add the following lines:

```ini
[/Script/EngineSettings.GameMapsSettings]
GameInstanceClass=/Script/{ProjectName}.MyGameInstance
```

## Include Pre-requisites for Windows Dedicated Server

There are two ways to include the app-local prerequisites - either through the Unreal Engine editor or by editing DefaultGame.ini.

### In the Unreal Editor

In the editor, go to Edit -> Project Settings. In the opened window, navigate to Packaging on the left side. Scroll to the bottom of the list, and tick "Include app-local prerequisites".

### In DefaultGame.ini

Or you can update DefaultGame.ini with the following code:

```ini
[/Script/UnrealEd.ProjectPackagingSettings]
IncludeAppLocalPrerequisites=True
```

If the category already exists in your DefaultGame.ini, then just add the second line to it. This configuration ensures that all app local dependencies ship with the project as well.

If you are using Continuous Integration (CI), then you could add it to your setup to only turn on this flag when building a dedicated server, so the prerequisite dlls only get added if it is a dedicated server build.

## Next steps

You are now ready to [build your project](building-the-third-person-mp-example-project.md) on your local machine.

Alternately, you can return to the main [Unreal GSDK Plugin](index.md#unreal-project-build-configurations) guide.
