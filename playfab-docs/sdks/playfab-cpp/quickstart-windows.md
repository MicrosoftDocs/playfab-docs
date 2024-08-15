---
title: Quickstart C++ for Windows
author: DanBehrendt
description: This guide helps you make your first PlayFab API call in native C++.
ms.author: joanlee
ms.date: 04/16/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, cocos2d-x, unreal, lua sdk
ms.localizationpriority: medium
---

# Quickstart: C++ for Windows

> [!NOTE]  
> This SDK is being replaced by the new [PlayFab C SDK](../c/index.md). The new SDK supports Windows (Win32). We are expanding the set of supported platforms for the new SDK over time.

Get started with the PlayFab Client library for C++. Follow steps to install the package and try out example code for a basic task.

This quickstart helps you make your first PlayFab API call in the using the Client library for C++.

[API reference documentation](../../api-references/index.md) | [Library source code](https://github.com/PlayFab/XPlatCppSdk)

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).  
- An installation of [Visual Studio](https://visualstudio.microsoft.com/).

## Windows C++ project setup

Installation:

1. Download and install the [PlayFab Cross-Platform (CPP) SDK](https://github.com/PlayFab/XPlatCppSdk).
2. Create a new C++ Console project.
3. Right-click on the project in **Solution Explorer**, select **Manage NuGet packages**, and search using "playfab". There will be a few matches. Select **com.playfab.xplatcppsdk.vXXX**
4. Verify that your project compiles in x64 Release 

## Set up your first API call

This guide provides the minimum steps to make your first PlayFab API call, without any GUI or on-screen feedback. Confirmation is performed using a console print statement.

1. In Visual Studio, open your C++ Console Application.
2. Open the main cpp document for the project. If you didn't rename the project, the file name will be similar to ConsoleApplication1.cpp`.
3. Replace the contents of the file with the code shown below.

```cpp
// ConsoleApplication1.cpp : Defines the entry point for the console application.
//

#include "playfab/PlayFabError.h"
#include "playfab/PlayFabClientDataModels.h"
#include "playfab/PlayFabClientApi.h"
#include "playfab/PlayFabSettings.h"
#include "playfab/PlayFabApiSettings.h"
#include <windows.h>

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
    printf(error.GenerateErrorReport().c_str());
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
        Sleep(1);

    printf("Press enter to exit\n");
    getchar();
    return 0;
}
```

## Finish and execute

1. To run the project, select **Debug** > **Start Debugging**.
2. When it loads, the following text is displayed:

    "Congratulations, you made your first successful API call!"  
3. Start making other API calls, and build your title.
