---
title: C# quickstart
author: v-thopra
description: This guide will help you make your first PlayFab API call using CSharp.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, csharp, playfab api, login
ms.localizationpriority: medium
---

# C# quickstart

This quickstart has been created to help you make your first PlayFab API call using CSharp (C#).

Before you can call any PlayFab API, you must have a [PlayFab developer account](https://developer.playfab.com/en-us/sign-up). 

## CSharp Getting Started guide

A native C# project can be used two ways:

- Admin tools for maintaining your game
  - Usually, you will want to make synchronous calls back-to-back.
  - Each API call will lock the program while it's executing, but that's not an issue for this type of program.
  - See the comment about `loginTask.Wait()` in the example code below. This is how you'll usually make API calls.

- An actual game coded in native C#
  - You need to take advantage of the async nature of API calls, and the C# async/await feature keywords. For more information about asynchronous programming, see [Asynchronous Programming with async and await (C#)](https://docs.microsoft.com/dotnet/csharp/async).

## CSharp project setup

OS: This guide is written for Windows 10, and VS 2017.

Installation

1. Download Visual Studio: [https://www.visualstudio.com/downloads/](https://www.visualstudio.com/downloads/)
(Older versions should also work.)

2. Open Visual Studio and create a new project.

  ![VS - Create new project](media/csharp-new-project.png)

3. Install nuget package for **PlayFabAllSDK**.

  ![VS - Install nuget package for PlayFab SDK](media/csharp-nuget-add.png)

At this point, you should be able to successfully compile the project. The output window should contain something like the following example.

```output
1>------ Build started: Project: CSharpGettingStarted, Configuration: Debug Any CPU ------
1>  CSharpGettingStarted -> c:\dev\CSharpGettingStarted\CSharpGettingStarted\bin\Debug\CSharpGettingStarted.exe
========== Build: 1 succeeded, 0 failed, 0 up-to-date, 0 skipped ==========
```

Your PlayFab installation is complete!

## Set up your first API call

This guide provides the minimum steps required to make your first PlayFab API call. Confirmation is done via a console print.

Your new project should contain a file called Program.cs, which was created automatically by Visual Studio. Open that file, and replace the contents with the code in the example shown below (after pasting the code, you may need to refresh the file to see it). Confirmation of the API call will be done using messages written to the console output.

```csharp
using System;
using System.Threading;
using System.Threading.Tasks;
using PlayFab;
using PlayFab.ClientModels;

public static class Program
{
    private static bool _running = true;
    static void Main(string[] args)
    {
        PlayFabSettings.staticSettings.TitleId = "144"; // Please change this value to your own titleId from PlayFab Game Manager

        var request = new LoginWithCustomIDRequest { CustomId = "GettingStartedGuide", CreateAccount = true };
        var loginTask = PlayFabClientAPI.LoginWithCustomIDAsync(request);
        // If you want a synchronous result, you can call loginTask.Wait() - Note, this will halt the program until the function returns

        while (_running)
        {
            if (loginTask.IsCompleted) // You would probably want a more sophisticated way of tracking pending async API calls in a real game
            {
                OnLoginComplete(loginTask);
            }

            // Presumably this would be your main game loop, doing other things
            Thread.Sleep(1);
        }

        Console.WriteLine("Done! Press any key to close");
        Console.ReadKey(); // This halts the program and waits for the user
    }

    private static void OnLoginComplete(Task<PlayFabResult<LoginResult>> taskResult)
    {
        var apiError = taskResult.Result.Error;
        var apiResult = taskResult.Result.Result;

        if (apiError != null)
        {
            Console.ForegroundColor = ConsoleColor.Red; // Make the error more visible
            Console.WriteLine("Something went wrong with your first API call.  :(");
            Console.WriteLine("Here's some debug information:");
            Console.WriteLine(PlayFabUtil.GenerateErrorReport(apiError));
            Console.ForegroundColor = ConsoleColor.Gray; // Reset to normal
        }
        else if (apiResult != null)
        {
            Console.WriteLine("Congratulations, you made your first successful API call!");
        }

        _running = false; // Because this is just an example, successful login triggers the end of the program
    }
}
```

## Finish and execute

When you execute this program, you should get the following console output:  "Congratulations, you made your first successful API call! Done! Press any key to close."

- At this point, you can start making other API calls, and building your game.

- To build Admin utilities, see the alternate source files in the PlayFab CSharpSdk zip file located in `{CSharpSdk}/PlayFabClientSDK/sources`.

For a list of all available client API calls, or many other topics, see our [PlayFab API References](../../api-references/index.md) documentation.

Happy coding!

## Deconstruct the code

This optional last section describes each part of Program.cs in detail.

- There are 2 functions in Program.cs
  - Main and OnLoginComplete
    - Main kicks off a login, and enters a main-loop.
    - OnLoginComplete is an asynchronous handler, executed once the login call completes (You can also use Lambda functions).

### Inside of Main

- `PlayFabSettings.staticSettings.TitleId = "xxxx";`
  - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that titleId into your game. This lets the client know how to access the correct data within PlayFab. For now, just consider it a mandatory step that makes PlayFab work.

- `var request = new LoginWithCustomIDRequest { CustomId = "GettingStartedGuide", CreateAccount = true };`
  - Most PlayFab API methods require input parameters, and those input parameters are packed into a request object.
  - Every API method requires a unique request object, with a mix of optional and mandatory parameters
    - For `LoginWithCustomIDRequest`, there is a mandatory parameter of `CustomId`, which uniquely identifies a player and `CreateAccount`, which allows the creation of a new account with this call.
  - For login, most developers will want to use a more appropriate login method.
    - See the [PlayFab Login documentation](xref:titleid.playfabapi.com.client.authentication) for a list of all login methods, and input parameters. Common choices are:
      - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
      - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
      - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)

- `var loginTask = PlayFabClientAPI.LoginWithCustomIDAsync(request);`
  - This begins the async request to `LoginWithCustomID`, using the C# async/await feature.

- `while (_running)`
  - Running in a native C# environment means you have to code your own main loop.
  - This serves the purpose in the most trivial possible way.

### Inside of OnLoginComplete

- `var apiResult = taskResult.Result.Result;`
  - When successful, the apiResult object of many API callbacks will contain the requested information.
  - If not-null, the apiResult object for LoginResult contains some basic information about the player, but typically, login is simply a mandatory step before calling other APIs.

- `var apiError = taskResult.Result.Error;`
  - If `apiError` is not `null`, your API has failed.
  - API calls can fail for many reasons, and you should always attempt to handle failure.
  - Why API calls fail (In order of likelihood).
    - PlayFabSettings.staticSettings.TitleId is not set. If you forget to set titleId to your title, then nothing will work.
    - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail. See error.errorMessage, error.errorDetails, or error.GenerateErrorReport() for more info.
    - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
    - PlayFab server issue. As with all software, there can be issues. See our [release notes](../../release-notes/index.md) for updates.
    - The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.

  - If you are having difficulty debugging an issue, and the information within the error information is not sufficient, please visit us on our [forums](https://community.playfab.com/index.html)
