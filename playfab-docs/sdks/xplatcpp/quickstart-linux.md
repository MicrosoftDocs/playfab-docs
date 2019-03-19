---
title: C++ quickstart for Linux
author: v-thopra
description: This guide will help you make your first PlayFab API call in Linux C++.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, c++, linux, cocos2d-x, unreal, lua sdk
ms.localizationpriority: medium
---

# C++ quickstart for Linux

This guide will help you make your first API call in C++. A native C++ project can be used a few ways:

- Stand-alone console Admin tools for maintaining your game
  - The C++ SDK works great for a stand-alone C++ program

- Integration into an existing C++ based game engine
  - The C++ SDK should not be used if we provide a more specific SDK
    - [Cocos2d-x](https://github.com/PlayFab/Cocos2d-xSDK)
    - [Unreal](https://github.com/PlayFab/UnrealCppSdk)

  - Many C++ based engines also integrate Lua:
    - [LuaSdk]https://github.com/PlayFab/LuaSdk)

If you have any issues, let us know on the [Forums](https://community.playfab.com/index.html).

## Linux C++ Project Setup

OS: This guide is written for Linux, using Ubuntu 18.04 LTS.

Before continuing, make sure you have completed [Getting started for developers](../../personas/developer.md) which ensures you have a PlayFab account and are familiar with the PlayFab Game Manager.

Installation

1. Install the following (sudo apt install ____ on Ubuntu):
    - g++
    - gdb
    - make
    - cmake
    - libjsoncpp-dev
    - libcurl4-openssl-dev
    - git-all
2. Clone [XPlatCppSdk](https://github.com/PlayFab/XPlatCppSdk) into your project folder.  
3. Create main.cpp and write Hello World in it as shown below.

```cpp
// main.cpp: entry point for the console application

#include <iostream> 

int main()
{
    std::cout << "Hello World" << std::endl;
    return 0;
}
```

- If you're using an IDE, make sure to:
  - Add the following folders to your sources:
    - XPlatCppSdk/cppsdk/source/playfab

  - Add the following folders to your include directories:
    - XPlatCppSdk/cppsdk
    - XPlatCppSdk/cppsdk/include

  - Link the following libraries
    - jsoncpp
    - curl
    - pthread

- Otherwise, create CMakeLists.txt and fill it with the following:

```cmake
cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 14)

project(PlayFab_Test)

file(GLOB PF_SOURCE XPlatCppSdk/cppsdk/source/playfab/*.cpp)
add_executable(PlayFab_Test ${PF_SOURCE} main.cpp)

include_directories(XPlatCppSdk/cppsdk)
include_directories(XPlatCppSdk/cppsdk/include)
target_link_libraries(PlayFab_Test -ljsoncpp -lcurl -lpthread)
```

- Build and run the project inside your IDE, or open Terminal and run:
  - cmake .
  - make
  - ./PlayFab_Test

Your project should compile and successfully run Hello World!


## Set up your first API call

This guide will provide the minimum steps to make your first PlayFab API call without any GUI or on-screen feedback. Confirmation is through a console print statement.

First, replace the contents of main.cpp with the following:

```cpp
// main.cpp: entry point for the console application

#include "playfab/PlayFabClientDataModels.h"
#include "playfab/PlayFabClientApi.h"
#include "playfab/PlayFabSettings.h"
#include <unistd.h>

using namespace PlayFab;
using namespace ClientModels;

bool finished = false;

void OnLoginSuccess(const LoginResult& result, void* customData)
{
    printf("Congratulations, you made your first successful API call!\n");
    finished = true;
}

void OnLoginFail(const PlayFabError& error, void* customData)
{
    printf("Something went wrong with your first API call.\n");
    printf("Here's some debug information:\n");
    printf(error.GenerateReport().c_str());
    printf("\n");
    finished = true;
}

int main()
{
    PlayFabSettings::titleId = "144";

    LoginWithCustomIDRequest request;
    request.CreateAccount = true;
    request.CustomId = "GettingStartedGuide";

    PlayFabClientAPI::LoginWithCustomID(request, OnLoginSuccess, OnLoginFail);

    while (PlayFabClientAPI::Update() != 0)
        sleep(1);

    printf("Press enter to exit\n");
    getchar();
    return 0;
}
```

## Finish and execute

1. Build and run the project inside your IDE, or open Terminal and run:
    - ./PlayFab_Test

2. When it loads, you should see the following text:
    - "Congratulations, you made your first successful API call!"

3. At this point, you can start making other API calls and build your game.
    - For a list of all available client API calls, see our [PlayFab API References](../../api-references/index.md) documentation.

Happy coding!

## Deconstruct the code

This optional last section describes each part of main.cpp in detail.

- Includes
  - The PlayFab includes get you access to the the Client APIs. In this example, unistd.h is only used for sleep()

- using namespaces
  - PlayFab and PlayFab::ClientModels. The first is for API methods and general PlayFab usage, and the latter is for the objects sent to and received by Client API calls

- OnLoginSuccess, OnLoginFailure are callback functions asynchronously invoked by PlayFabClientAPI.LoginWithCustomID
- main()
  - PlayFabSettings::titleId = "144";
    - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that titleId into your game. This lets the client know how to access the correct data within PlayFab. For most users, just consider it a mandatory step that makes PlayFab work

  - LoginWithCustomIDRequest request; (and field initialization)
    - Most PlayFab API methods require input parameters, and those input parameters are packed into a request object
    - Every API method requires a unique request object, with a mix of optional and mandatory parameters
      - For LoginWithCustomIDRequest, there is a mandatory parameter of CustomId, which uniquely identifies a player and CreateAccount, which allows the creation of a new account with this call.

    - For login, most developers will want to use a more appropriate login method
      - See the [PlayFab Login documentation](xref:titleid.playfabapi.com.client.authentication) for a list of all login methods, and input parameters. Common choices are:
        - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
        - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
        - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)

  - PlayFabClientAPI::LoginWithCustomID(request, OnLoginSuccess, OnLoginFail);
    - Triggers the threaded API call. When complete, OnLoginSuccess or OnLoginFail will be invoked appropriately

  - while (PlayFabClientAPI::Update() != 0) sleep(1);
    - Update returns the number of API calls that are in-progress
    - Update also executes the actual calls to OnLoginSuccess or OnLoginFail, once the threaded API calls are complete
      - This allows your callbacks to execute in a thread-safe manner, when your program is inherently single-threaded
      - True multi-threaded options are also available, but not demonstrated here

  - Inside of OnLoginSuccess:
    - The result object of many API success callbacks will contain the requested information
    - LoginResult contains some basic information about the player, but for most users, login is simply a mandatory step before calling other APIs

  - Inside of OnLoginFailure:
    - API calls can fail for many reasons, and you should always attempt to handle failure
    - Why API calls fail (In order of likelihood)
      - PlayFabSettings.TitleId is not set. If you forget to set titleId to your title, then nothing will work.
      - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail. See error.errorMessage, error.errorDetails, or error.GenerateErrorReport() for more info.
      - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
      - PlayFab server issue. As with all software, there can be issues. See our [release notes](../../release-notes/index.md) for updates.
      - The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.

    - If you are having difficulty debugging an issue, and the information within the error information is not sufficient, please visit us on our [forums](https://community.playfab.com/index.html)
