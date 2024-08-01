---
title: Local debugging for Cloudscript using Azure Functions
author: natashaorie
description: Setting up local debugging for Cloudscript using Azure Functions
ms.author: norie
ms.date: 08/18/2023
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, automation, cloudscript, azure functions, debugging
ms.localizationpriority: medium
---
# Tutorial: Local debugging for Cloudscript using Azure Functions

With Azure Functions, you can now test and debug your CloudScript code locally. After you have completed this tutorial, you can run your local Azure Functions app under the debugger (e.g. in VS Code or Visual Studio), set your breakpoints and run your game client.

In this tutorial you learn how to:

> [!div class="checklist"]
> * Add an implementation of ExecuteFunction to your local Azure Functions app
> * Add a settings file to tell the PlayFab SDK to call that local implementation from your game

## Prerequisites

* Currently local debugging is supported in the following SDKs: 
  * [PlayFab C# SDK](https://github.com/PlayFab/CSharpSDK)
  * [PlayFab Unity SDK](https://github.com/PlayFab/UnitySDK)
  * [Unreal 4 Marketplace PlugIn for PlayFab](https://github.com/PlayFab/UnrealMarketplacePlugin)

## Add a local implementation of ExecuteFunction

### For C# Azure Functions apps

To get the local implementation of ExecuteFunction set up in your C# Azure Functions app, add the [ExecuteFunction.cs](https://github.com/PlayFab/pf-af-devfuncs/blob/master/csharp/ExecuteFunction.cs) file to your local Azure Functions app.

### Required environment variables for local implementation of ExecuteFunction

Add the following settings to your `local.settings.json` file:

| Name | Value |
|--|--|
| PLAYFAB_TITLE_ID | Your title ID, in hex form |
| PLAYFAB_DEV_SECRET_KEY | Secret key for your title. You can find your secret keys in Game Manager by clicking on the gear icon to the right of your title's name and going to **Title Settings** > **Secret Keys**. | 

For example:

``` JSON
{
  "IsEncrypted": false,
  "Values": {
    "AzureWebJobsStorage": "...",
    "FUNCTIONS_WORKER_RUNTIME": "dotnet",
    "PLAYFAB_TITLE_ID": "B55D",
    "PLAYFAB_DEV_SECRET_KEY": "AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHIIIIJJJJKKKKLLLLMM"
  }
}
```

## Configure PlayFab SDK to call local ExecuteFunction implementation

To tell the PlayFab SDK to redirect ExecuteFunction API calls to your local implementation, add a file called `playfab.local.settings.json` to one of two places:

* The temporary directory on your machine
   * On Windows, this is the **TEMP** environment variable
   * On Linux/Mac, this is the **TMPDIR** environment variable
* The directory of your game executable  

Set the content of the file as follows:

``` JSON
{ "LocalApiServer": "http://localhost:<portNumber>/api/<functionName>" }
```

When you would like to stop local redirects and make ExecuteFunction call the PlayFab API server, delete the `playfab.local.settings.json` file.

## Additional resources

Azure Functions has a great guide on how to [test and debug your Functions](/azure/azure-functions/functions-develop-local) locally.

Here are some highlights from the above document.

* Make sure that your Azure Functions Core Tools are installed
* Configure your local settings file. For more information, [Develop Azure Functions by using Visual Studio Code](/azure/azure-functions/functions-develop-vs-code?tabs=nodejs#local-settings-file)
* Set a break point in your code
* Select **F5** to start debugging
