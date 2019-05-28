---
title: Objective-C quickstart
author: v-thopra
description: This guide will help you make your first PlayFab API call using Objective-C.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, objective-c, playfab objective-c sdk, native osx, ios development
ms.localizationpriority: medium
---

# Objective-C quickstart

This quickstart will assist you in making your first PlayFab API call using Objective-C, by illustrating how to get started with our [Objective-C SDK for native OSX & iOS development](https://github.com/PlayFab/Objective_C_SDK).

> [!Note]
> This SDK is currently in Beta, so please let us know if you run into any issues.

Happy Developing!

## Getting started

There are two ways to get started:

  1. You can begin by adding our [example implementation project](https://github.com/PlayFab/Objective_C_SDK/tree/master/ExampleProject), or...
  2. You can begin by importing the [Objective-C SDK](https://github.com/PlayFab/Objective_C_SDK/tree/master/PlayFabSDK) into an existing XCode project.

## Configuring PlayFab

Set your PlayFab `TitleId` in PlayFabSettings.m, on the line:

```objc
  static NSString * TitleId = @"XXXX";
```

## Set up your first API call

The following code example shows you how to make a PlayFab API request, and receive the response.

```objc
//EXAMPLE: Login with custom id request:

//Build the Request object:
  LoginWithCustomIDRequest* login_request = [LoginWithCustomIDRequest new];
  login_request.CustomId = [[[UIDevice currentDevice] identifierForVendor] UUIDString]; //use the identifier for vendor as our custom ID.
  login_request.CreateAccount = true; //creates a new account if no existing one

//Make each call to [PlayFabClientAPI GetInstance], the first time you do this, an instance will be created and then used.
  [[PlayFabClientAPI GetInstance] LoginWithCustomID:login_request

      success:^(LoginResult* result, NSObject* userData) {
        //This block will run when we receive successful response, inspect the result class for pertinent info.
        NSLog(@"error %@",result.PlayFabId);
      }

      failure:^(PlayFabError *error, NSObject *userData) {
        //Request errored or failed to connect, inspect the PlayFabError class for pertinent info.
        NSLog(@"error %@",error.description);
      } withUserData:nil];
```

## Notes

- IDFA/advertisingIdentifier logic is present, but has not been properly tested. It is off by default, and is only available if you explicitly add **USE_IDFA=1** to **Target** > **Build Settings** > **Preprocessor Macros**.

- `testTitleData.json` is present in the project, but must be changed to valid data for any Unit Tests to work.

## Troubleshooting

For a complete list of available APIs, see our [PlayFab API References](../../api-references/index.md) documentation.

## Contact Us

We love to hear from our developer community!
Do you have ideas on how we can make our products and services better?

Our Developer Success Team can assist with answering any questions, as well as process any feedback you have about PlayFab services.

[Forums, Support and Knowledge Base](https://community.playfab.com/index.html)