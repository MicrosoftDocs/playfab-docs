---
title: Quickstart C++ for Linux
author: DanBehrendt
description: This guide helps you make your first PlayFab API call in Linux C++.
ms.author: joanlee
ms.date: 04/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, linux, cocos2d-x, unreal, lua sdk
ms.localizationpriority: medium
---

# Quickstart: C++ for Linux

Get started with the PlayFab Client library for C++. Follow steps to install the package and try out example code for a basic task.

This quickstart helps you make your first PlayFab API call in the using the Client library for C++.

This quickstart was written using Ubuntu 18.04 LTS.

[API reference documentation](../../api-references/index.md) | [Library source code](https://github.com/PlayFab/XPlatCppSdk)

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).  

## Linux C++ Project Setup

1. Install the following (sudo apt-get install ____ on Ubuntu):
    - g++
    - gdb
    - make
    - cmake
    - libjsoncpp-dev
    - libcurl4-openssl-dev
    - git-all
2. Clone the [PlayFab cross-platform (CPP) SDK](https://github.com/PlayFab/XPlatCppSdk) into your project folder.  

To verify that your installation is correct.

Create a main.cpp and insert the "Hello World" code shown below.

```cpp
// main.cpp: entry point for the console application

#include <iostream>

int main()
{
    std::cout << "Hello World" << std::endl;
    return 0;
}
```

If you're using an IDE, make sure to:

- Add the following folders to your sources:
  - XPlatCppSdk/cppsdk/source/playfab

- Add the following folders to your include directories:
  - XPlatCppSdk/cppsdk
  - XPlatCppSdk/cppsdk/include

- Link the following libraries:
  - jsoncpp
  - curl
  - pthread

Otherwise, create a file named CMakeLists.txt and copy the build commands shown below.

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

- Build and run the project from inside your IDE, or open a Terminal prompt and run:
  - `cmake .`
  - `make`
  - `./PlayFab_Test`

## Set up your first API call

This guide provides the minimum steps to make your first PlayFab API call, without any GUI or on-screen feedback. Confirmation is performed using a console print statement.

First, replace the contents of `main.cpp` with the content shown below.

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
    PlayFabSettings::staticSettings->titleId = ("144");

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
    - `./PlayFab_Test`
2. When it loads, the following text is displayed:
    - "Congratulations, you made your first successful API call!"

3. Start making other API calls, and build your title.

