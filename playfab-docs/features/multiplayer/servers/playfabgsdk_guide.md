---
title: Integrating the PlayFab GSDK into Unreal Engine 4
author: v-kciril
description: How to quickly upload a sample multiplayer server, configure a server build, and create server instances.
ms.author: v-kciril
ms.date: 09/12/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, api, powershell
ms.localizationpriority: medium
---

# Integrating the PlayFab GSDK into Unreal Engine 4

![](media/9d68e5424e82ba691c46b1bdc63d1b20.png)

**Released 8/22/2019**  
**Copyright © 2019 HICON Games, LLC. All Rights Reserved.**

## What this document is not

This document should not be used as a best-practices document. Each project is vastly different from one another, and as such has different requirements. There may be much better ways to integrate the PlayFab GSDK (for *Servers 2.0* in particular) into your Unreal Engine 4 project; however, for our customer HICON Games this was the way they got it deployed.

Once official documentation for integrating PlayFab GSDK C++ into Unreal Engine 4 does come out, this documentation may become obsolete. In addition, this guide is not a how-to use PlayFab or Unreal Engine 4 guide.

## What this document is

This is an internal technical document created by HICON Games for project Huli, to record the process used in integrating the PlayFab GSDK.

Because this is being made a public release document after the fact, we have not changed the documentation to fit into a generic UE4 project template.

Your project will be named something completely different, and any occurrences of the name “Huli” should be replaced to reflect your own project name.

This document should be used as a starting point for the bare minimum integration requirements needed to get the PlayFab GSDK integrated into your Unreal Engine 4 project and to deploy a successful UE4 dedicated server to the Multiplayer Server 2.0 servers hosted by PlayFab. This document assumes you can compile a standalone dedicated server build with UE4 and you have the correct [Project]Server.Target.cs files in your solution.

## Products and versions used

### *PlayFab GSDK*

The PlayFab C++ GSDK v.140.0.7.190715 is the latest version as of the date on this document.

Download: <https://www.nuget.org/packages/com.playfab.cppgsdk.v140>

### *Unreal Engine 4*

Our game engine version is 4.22.3 and we use the source version from Unreal Engine’s official GitHub page.

Download: <https://github.com/EpicGames/UnrealEngine>

### *Visual Studio*

Our programmers use Visual Studio 2017.

### Helpful links
-------------

- Unreal Engine 4 Documentation:
https://docs.unrealengine.com/index.html

- PlayFab Documentation (NEW): https://docs.microsoft.com/gaming/playfab/

- PlayFab API Reference: <https://api.playfab.com/>

- PlayFab Local Debugging (MockVM):
<https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/locally-debugging-game-servers-and-integration-with-playfab>

## Integrating the PlayFab GSDK into Huli

The easiest way to download the PlayFab GSDK is to use the Visual Studio NuGet Package Manager.

1. Open up the Huli project solution `Huli.sln` file in Visual Studio. 

2. Navigate to **Tools** and select **NuGet Package Manager** then choose **Manage NuGet Packages for
    Solution**.  
    
![](media/290f62fa7bffcfd4c12ed90d34ab8616.png)

3. Click on the Browse tab and search for “*playfab*.” 

![](media/1b7186f065b369c7a20bfe475558e494.png)

4. Find `com.playfab.cppgsdk.v140` and then select Games\Huli project from the list and make sure to pick the latest stable version, then click the **Install** button.  

![](media/fa1b6091f3c1f3883f75a467bd1c8722.png)

5. This will create a “packages” folder within the Huli project root folder and will contain the entire PlayFab C++ GSDK. We will link to this later.

![](media/3b86e24dba61aa15c0910671cd89c429.png)

### Overriding the UE4 Startup/Shutdown Modules

The way we chose to integrate the PlayFab GSDK’s core functions was to override UE4’s startup and shutdown modules for Huli.

1. Open the Huli game module header file `Huli.h`, located under Games\Huli\Source\Huli.   

![](media/1c9daa35536ccf8d3aef3a854d2e8e7a.png)

2. In this header file, we’ve defined our public overrides of the UE4: `StartupModule()`, `ShutdownModule()` and `IsGameModule()` as well as added a couple of private methods that made it easier to call PlayFab GSDK functions.

3.  Next, we implemented the methods we’ve defined in our header file, in our `Huli.cpp` file as well as include the `gsdk.h` file.

4. Override the default game modules in `Huli.cpp`.

5. Implement OnShutDown, HealthCheck and StartServer methods in `Huli.cpp`

6. Use custom logging methods for debugging in `Huli.cpp`

7. Add All Runtime Dependencies, .lib’s, .dll’s and include paths to `Huli.Build.cs`

> [!NOTE]
> Because they don’t get included automatically, we had to add all of our runtime dependencies modules that, for whatever reason, don’t get included when packaging our Huli dedicated server. Some of these are Windows-specific binaries that are required to run on the PlayFab Windows servers, but the others are required GSDK files.

1. Open the `Huli.Build.cs` file.  

![](media/e8169a2d8608ea1b5c459decc5e2eff7.png)

We’ve added the following dedicated server build rules to our `Huli.Build.cs` file when we package our HuliServer.exe. This file may have other, platform specific rules, we’ve only included the dedicated server rules.

Figure 6 Huli.Build.cs

### Pre-packaging Tip: Blacklisting or Removing UE4 Plugins

> [!IMPORTANT]
> Before packaging the Huli Server, it’s important to understand that since we are using Windows Server and docker containers from PlayFab, some UE4 plugins are not compatible with it. 

![](media/f3612a461c9f4715ef94bfbbd5c9c95b.png)

So far, the only one we found that prevents our PlayFab dedicated 2.0 server build from spinning up after deployment is the **Windows MoviePlayer** plugin. We simply *disabled/removed* it from our game outright, instead of blacklisting; however, UE4 does give you options to blacklist a plugin from running on a specific target if you’d like. For example, if your game client needs the **Windows MoviePlayer** plugin, but the server has no need to run it, you can set up blacklisting (or whitelisting if you prefer) within the `\*.uplugin` file itself.

More on whitelist/blacklisting:  
<https://answers.unrealengine.com/questions/345335/conditionally-compile-plugins-based-on-platform.html>

### Packaging `HuliServer.exe`

With these code changes, before you can package HuliServer, you need to compile the solution and target the Development Server or Shipping Server configuration within Visual Studio.

1. For a development server build, make sure to select **Development Server**, then **Win64** and finally make sure that the **Huli** project is selected from within Visual Studio.  

![](media/364cc9fc28933473cf29f000d7f827de.png)

2. Then right-click on the Huli project in Solution Explorer and click **Build** from the context menu.  
![](media/f1f98ade12ac3c2664a44abbac914ab0.png)

3. From here, the standard way we package our Server build is to use the Project Launcher.  

![](media/9934a03cd106f32d8ba9a968dfe51853.png)

4. Add a new custom launch profile  

![](media/56e23d53f36dfc78d09c85faa0e347a1.png)

5. Then click on the

![](media/04071f9366793fb0da435c26763da952.png)

icon to edit the profile, which opens up a new dialog for you to customize it.

6. Give it a name such as “Huli Dedicated Server (Development)” or something similar, and make sure that you target the Huli project (navigate to the `Huli.uproject` file within the project drop-down on this editor).

7. Make sure to cook the content “By the book” and select **WindowsServer** from the platform options.  

![](media/d52d7d82f610076b5aa1ca4496a1590f.png)

8. Target “en” for cooked cultures.

9. Include the following maps: “Main," “BattleCircle," and “Transition."

10. Under Package, select “Package & store locally," and then specify the directory you want to output to.

11. Click the

![](media/711d7c42bfd74e239f2d83b5ac8e9172.png)

icon and then run your new launch profile by clicking the

![](media/7e60798c7e68de5d34c7aa29f5637646.png)

icon.  

![](media/9a373e5fcffa7f215bb246ebf3e98318.png)

12. If everything worked correctly, you should see all green check marks across the board.  

![](media/006e6ceb4f32535c209e654f97789170.png)

13. Navigate to the directory you set in your custom launch profile.

14. Delete the three manifest files.  

![](media/6bdc8b4e3769b285c0b23bf9cb20d7ee.png)

15. Now you can zip up your folder. If you’re on Windows 10, simply select all files at the root, right-click on `HuliServer.exe` and then select **Send to** > *Compressed (zipped) folder*. This is the folder you will upload to PlayFab.

### Optional steps

How you package your server executable is up to you, but these optional steps may be required by the PlayFab Thunderhead 2.0 Windows servers.

1. Navigate to the Win64 sub-folder of your packaged server.  

![](media/e62f2ddb72dc317daabc041a84df8af3.png)

2. Copy all files, except for the HuliServer.exe file in this folder.  

![](media/3c579b0d2cb667f30665e7128aa6acd9.png)

2. Then finally navigate back to the root of your packaged folder and paste these files in here. It should look like the following:  

![](media/29fef087588d577c54bff735f6523152.png)

3. We do this as an added measure so that when PlayFab VM creates your docker
    container and runs the root HuliServer.exe, the proper files are linked
    within this executable. Even though the HuliServer.exe at root just calls
    the sub-exe in Huli \> Binaries \> Win64, the Windows server may require
    these at the root level as well.

### Deploying to PlayFab

Once you’re at this point, you’re at the homestretch. If everything compiles fine, you’ve followed the directions above and you’ve got your HuliServer.zip file ready to go, the last step is creating a new Server 2.0 Build.

1. Log into PlayFab with your developer account.

2. Click on the Huli project.

3. Click on the

![](media/a64d39fac095bd4aee45b5b9ac410ade.png)

menu option.

4. It should default you to the

![](media/6bca442e3f3e0025b8bc5547f3bdd36d.png)

tab; if not, click it.

5. Click on

![](media/dd7c75987e0c8574fad2855c7959d727.png)

6. Provide a Build name, Virtual machine selection, and Servers per machine. 

![](media/d7bbed8dedd7e1774fc19e6afb5ac414.png)

7. For the Network Section, all UE4 server builds run on **UDP** port **7777**.  

![](media/279a76f6cfe1f6d23263f57318128cde.png)

8. Set your start game command to `C:\\Assets\\HuliServer.exe` 

![](media/2b450620e7f7af30133262d510ecd90d.png)

9. Click

![](media/2c948c5e3837aece2016b7aac3ef61e9.png)

and navigate to your HuliServer.zip file and click

![](media/9a57a525be830e8b57f83909ed37d7a4.png)

and wait for it to finish uploading to PlayFab.

10. Asset package should now say “HuliServer.zip.” Leave **Mount path** as the default.  

![](media/922ca72f3d4e749b7a3a6d5dcf26bd44.png)

11. Click

![](media/82a8aba1c2a8a9d40784586652fa934b.png)  .

12. You’ll need to set up the Regions, how many standby servers, and maximum servers.  

![](media/f0241888d862f74de0fe0eaf52012931.png)

13. Once you’re all done, click

![](media/4157c387ba2521b8ce8318167d0e88a6.png)

14. The Huli Dedicated Server will now start deploying to PlayFab. This screen will auto-refresh.  

![](media/700ae93a20146ace554809b73f947656.png)

15. After about 20 minutes or so, the new server build should be up and running, and if there were no issues, you should get a successful deploy status.  

![](media/530f3634dc07a609b9ea88eec5787525.png)

16. The number under the build name, is the build ID. This is a custom build ID that we can use within the PlayFabSDK blueprints to make a new multiplayer server request to start up a new server and connect our players to this new dedicated server.  

![](media/b9118fb57b60a478343489be356a6667.png)
