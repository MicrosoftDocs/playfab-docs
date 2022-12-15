---
title: Quickstart C++ for Xbox
author: DanBehrendt
description: This guide helps you make your first PlayFab API call in C++ on an Xbox.
ms.author: joanlee
ms.date: 04/16/2020
ms.topic: article
ms.service: playfab
keywords: playfab, c++, windows, xbox, cross-platform
ms.localizationpriority: medium
---

# Quickstart: C++ for Xbox

Get started with the PlayFab Client library for C++. Follow steps to install the package and try out example code for a basic task.

This quickstart helps you make your first PlayFab API call in the using the Client library for C++. Before continuing, make sure you have completed [Getting started for developers](../../personas/developer.md), which ensures you have a PlayFab account and are familiar with the PlayFab Game Manager.

[API reference documentation](../../api-references/index.md) | [Library source code](https://github.com/PlayFab/XPlatCppSdk)

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).  
- An installation of [Visual Studio 2017](https://visualstudio.microsoft.com/).
  - The Xbox SDK is only supported on Visual Studio 2017.

## Xbox project setup

Follow the Xbox setup guide for Universal Windows Platform (UWP) applications: [UWP on Xbox One](/windows/uwp/xbox-apps/). This guide walks you through setting up your Xbox, the XDK, and Visual Studio to build Xbox applications.

## Using the PlayFab CPP SDK

Let's take a look at how to use the **PlayFab CPP SDK**.

> [!NOTE]
> The main difference for Xbox is that it has a separate project file for the solution.

Download the latest [PlayFab cross-platform (CPP) SDK](https://github.com/PlayFab/XPlatCppSdk). Follow the instructions in the *README* to recursively clone the dependencies. Note that this SDK is supported across Windows, Linux, and Xbox.

Build the dependencies for Xbox.

1. Open the **Xbox One XDK Visual Studio 2017 Command Prompt** and run the `build-dependencies-{debug/profile/release}.bat` script. This script is located in the **build \> Xbox** folder.
2. We will use debug for now, so make sure you run the debug script.

To build the respective configurations of the external dependencies, run the profile and release scripts. If the build fails, make sure that you completed a recursive clone of the repo to also clone the external dependencies.

### Setting up your Visual Studio project

To help you understand how to set up the project, we use a Direct3D sample for the guide. After you are familiar with the proper set up procedures, you can choose to start with a different starting sample.

1. Create a new **Direct3D** sample project by selecting **File \> New \> Project**.
2. Under **Installed**, select **Visual C++ \> Xbox One \> XDK \> July 2018 QFE 2**.
  
    > [!NOTE]
    > Based on the **XDK** you have installed, the version might be different. If you do not see **Xbox One** under **Visual C++**, re-install the **XDK** and try again.

3. Select **Direct3D 11 Game**. Name the project as PlayFabXboxGuide and select enter the location in which to store the project. To create the project, select **OK**.
4. To explicitly call out port numbers, edit the package.appxmanifest file. When using ports internally, make the following change to allow the application to talk to the network:

    For more information about using ports internally, see the manifest template code example in the "Xbox One exclusive resource application network manifest templates" section of [Configuring a XIM project in a manifest](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview#xbox-one-exclusive-resource-application-network-manifest-templates).

5. Modify the section for the **XML** header `<mx:Extension Category="windows.xbox.networking">` so that it looks like what is shown below.

```xml
         ...
         <mx:Extension Category="windows.xbox.networking">
           <mx:XboxNetworkingManifest>
             <mx:SocketDescriptions>
               <mx:SocketDescription Name="PlayFabQosApiClient" BoundPort="0" SecureIpProtocol="Udp">
                 <mx:AllowedUsages>
                   <mx:SecureDeviceSocketUsage Type="Initiate"/>
                   <mx:SecureDeviceSocketUsage Type="SendInsecure"/>
                   <mx:SecureDeviceSocketUsage Type="ReceiveInsecure"/>
                 </mx:AllowedUsages>
               </mx:SocketDescription>
               <mx:SocketDescription Name="PlayFabQosApiServer" BoundPort="3075" SecureIpProtocol="Udp">
                 <mx:AllowedUsages>
                   <mx:SecureDeviceSocketUsage Type="Accept" />
                   <mx:SecureDeviceSocketUsage Type="SendInsecure"/>
                   <mx:SecureDeviceSocketUsage Type="ReceiveInsecure"/>
                 </mx:AllowedUsages>
               </mx:SocketDescription>
             </mx:SocketDescriptions>
             <mx:SecureDeviceAssociationTemplates>
               <mx:SecureDeviceAssociationTemplate Name="PlayFabQosApiTraffic" InitiatorSocketDescription="PlayFabQosApiClient" AcceptorSocketDescription="PlayFabQosApiServer" MultiplayerSessionRequirement="None">
                 <mx:AllowedUsages>
                   <mx:SecureDeviceAssociationUsage Type="InitiateFromMicrosoftConsole" />
                   <mx:SecureDeviceAssociationUsage Type="InitiateFromWindowsDesktop" />
                   <mx:SecureDeviceAssociationUsage Type="AcceptOnOtherDevice" />
                 </mx:AllowedUsages>
               </mx:SecureDeviceAssociationTemplate>
             </mx:SecureDeviceAssociationTemplates>
           </mx:XboxNetworkingManifest>
         </mx:Extension>
```

To deploy your game:

1. Select **F5** to deploy and run the game.
2. Make sure you are connected to your Xbox.
3. On the **Xbox One XDK Visual Studio 2017 Command Prompt**, run the `xbconnect \<xbox ip\>` command to connect to your Xbox. 

You should see the game running on your Xbox.

### Adding the PlayFab CPP SDK to your project

1. In **Visual Studio**, right-click on the **Solution**. Select **Add \> Existing Project**.
2. Navigate to and select **XPlatXbox.vcxproj** under the **build \> Xbox** folder of the **XPlatCppSdk** folder.
3. Hit **Open**. You should now see the **XPlatXbox** project as part of your solution.
4. Right-click on **References** under the *PlayFabXboxGuide* project.
5. Select **Add Reference**.
6. Under **Project \> Solution**, select the **XPlatXbox** project and hit **OK**.
7. Now your project is linked to the XPlatXbox SDK, and you should be able to build to make PlayFab API calls.

Verify that the project builds. Try to build the Solution and make sure you do not have any build errors. If successful, you are ready to write some code and make your first API call.

### Making your first API call

1. Add the **PlayFab** header file paths to the **Additional Include Directories**.
2. Right-click on the *PlayFabXboxGuide* project and select **Properties**.
3. Under **Configuration Properties \> C/C++ \> General \> Additional Include Directories**, add the path to the **code**, **code\include** and **external\include** folders.
4. Once added, the **Additional Include Directories** value should look like this:  
    `\<path to the sdk root\>\code; \<path to the sdk root\>\code\include; \<path to the sdk root\>\external\json\include;%(AdditionalIncludeDirectories)`
5. Add a new header file called **PlayFabApiCall.h**, and add the code shown below to the file.

    ```cpp
    #pragma once
    void MakePlayFabCall();
    ```

6. Add a new source file called **PlayFabApiCall.cpp** with the code shown below.

    ```cpp
    #include "pch.h"
    
    #include "PlayFabApiCall.h"
    #include <playfab/PlayFabClientDataModels.h>
    #include <playfab/PlayFabClientApi.h>
    #include <playfab/PlayFabSettings.h>
    #include <windows.h>
    
    using namespace PlayFab;
    using namespace ClientModels;
    
    bool finished = false;
    
    void print_log(const char* format, ...)
    {
        static char s_printf_buf[1024];
        va_list args;
        va_start(args, format);
        vsnprintf(s_printf_buf, sizeof(s_printf_buf), format, args);
        va_end(args);
        OutputDebugStringA(s_printf_buf);
    }
    
    void OnLoginSuccess(const LoginResult& result, void* customData)
    {
        print_log("Congratulations, you made your first successful API call!\n");
        finished = true;
    }
    
    void OnLoginFail(const PlayFabError& error, void* customData)
    {
        print_log("Something went wrong with your first API call.\n");
        print_log("Here's some debug information:\n");
        print_log(error.GenerateErrorReport().c_str());
        print_log("\n");
        finished = true;
    }
    
    void MakePlayFabCall()
    {
        print_log("\n\n=====================Start making your first PlayFab API call========================\n\n");
    
        PlayFabSettings::titleId = "144";
    
        LoginWithCustomIDRequest request;
        request.CreateAccount = true;
        request.CustomId = "GettingStartedGuide";
    
        PlayFabClientAPI::LoginWithCustomID(request, OnLoginSuccess, OnLoginFail);
    
        while (PlayFabClientAPI::Update() != 0)
            Sleep(1);
    
        print_log("\n============================End your first PlayFab API call==========================\n\n");
    }
    ```

Now you have the code to make your first API call.

1. Call the **MakePlayFabCall()** function in **Main.cpp**, and add the following include statement:

    ```cpp
    #include "PlayFabApiCall.h"
    ```

2. In the `virtualvoid Initialize(CoreApplicationView^ applicationView)` function in `Main.cpp`, add `MakePlayFabCall();` as the last call.
3. Select **F5** to deploy and run the application.
4. The result of your first PlayFab API call from the Xbox, displays in the Output log window.
