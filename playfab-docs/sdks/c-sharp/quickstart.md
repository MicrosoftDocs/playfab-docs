---
title: Quickstart - PlayFab Client library for C#
description: This guide will help you make your first PlayFab API call using CSharp.
author: Jeffrey-Shi #Required; your GitHub user alias, with correct capitalization.
ms.author: jeffshi #Required; microsoft alias of author; optional team alias.
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, csharp, playfab api, login
ms.localizationpriority: medium
---

# Quickstart: PlayFab Client library for C\#

Get started with the PlayFab Client library for C#. Follow steps to install the package and try out example code for a basic task.

This quickstart helps you make your first PlayFab API call in the using the Client library for C#.

[API reference documentation](../../api-references/index.md) 

## Requirements

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).  
- An installation of [Visual Studio](https://visualstudio.microsoft.com/).

## CSharp project setup

Installation

1. Open Visual Studio and Select **Create a new project**.
2. Select **Console App (.Net Core)** for C#.
2. Install NuGet package for **PlayFabAllSDK**.

  ![VS - Install nuget package for PlayFab SDK](media/csharp-nuget-add.png)

At this point, you should be able to successfully compile the project. The output window should contain something like the following example.

```output
1>------ Build started: Project: CSharpGettingStarted, Configuration: Debug Any CPU ------
1>  CSharpGettingStarted -> c:\dev\CSharpGettingStarted\CSharpGettingStarted\bin\Debug\CSharpGettingStarted.exe
========== Build: 1 succeeded, 0 failed, 0 up-to-date, 0 skipped ==========
```

## Set up your first API call

This guide provides the minimum steps required to make your first PlayFab API call. Confirmation is done via a console print.

Your new project should contain a file called Program.cs, which was created automatically by Visual Studio. Open that file, and replace the contents with the code in the example shown below (after pasting the code, you might need to refresh the file to see it). Confirmation of the API call will be done using messages written to the console output.

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

When you execute this program, following output displays in the consol

"Congratulations, you made your first successful API call! Done! Press any key to close."

- At this point, you can start making other API calls, and building your game.

- To build Admin utilities, see the alternate source files in the PlayFab CSharpSdk zip file located in `{CSharpSdk}/PlayFabClientSDK/sources`.

For a list of all available client API calls, or many other articles, see [PlayFab API References](../../api-references/index.md).
