---
title: Python quickstart
author: DanBehrendt
description: This guide will help you make your first PlayFab API call in Python 3.
ms.author: joanlee
ms.date: 12/04/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, python 3, python sdk
ms.localizationpriority: medium
---

# Python quickstart

This quickstart is designed to help you make your first API call in Python 3.

A native Python project can be used a few ways:

- As a stand-alone console Admin tool for maintaining your game.
- Integration into an existing Python-based game engine.
  - For a list of Python game engines, see [PythonGameLibraries](https://wiki.python.org/moin/PythonGameLibraries) on the python.org website.

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- [Python 3](https://www.python.org/downloads/) installed on your system.
  - You must also have the requests module installed.

> [!NOTE]
> This beta release of the Python SDK only supports synchronous API calls, and your game loop may become blocked performing PlayFab API calls. You may need to create your own async/threading model to avoid this problem.
>

  
If you are having difficulty debugging an issue, and the information provided the error information is not sufficient, please visit us on our [PlayFab forums](https://community.playfab.com/index.html).

## Python project setup

1. From a command prompt, install the [PlayFab Package](https://pypi.org/project/playfab/) using following command.

```cmd
pip install playfab
```

If `pip` is not in your path, use the following command instead.

```cmd
python -m pip install playfab
```

2. In your project directory, create a python script called playfab_test.py.

## Set up your first API call

This quickstart provides the minimum steps to make your first PlayFab API call, without any GUI or on-screen feedback. Confirmation is accomplished with a console print statement.

Replace the contents of your playfab_test.py file with the contents shown below.

```python
from playfab import PlayFabClientAPI, PlayFabSettings

PlayFabSettings.TitleId = "144"

request = {
    "CustomId": "GettingStartedGuide",
    "CreateAccount": True
}

def callback(success, failure):
    if success:
        print("Congratulations, you made your first successful API call!")
    else:
        print("Something went wrong with your first API call.  :(")
        if failure:
            print("Here's some debug information:")
            print(failure.GenerateErrorReport())
PlayFabClientAPI.LoginWithCustomID(request, callback)
```

## Finish and execute

Run the Python script using the command shown below.

```cmd
python playfab_test.py
```

When it finishes, you should see the following text: "Congratulations, you made your first successful API call!"
  
At this point, you can start making other API calls and building your game. For a list of all available client API calls, see our [PlayFab API References](../../api-references/index.md) documentation.

Happy coding!

## Deconstruct the code

This optional last section describes each part of playfab_test.py in detail.

- Imports
  - The PlayFab imports get you access to the APIs.

- `PlayFabSettings.TitleId = "144"`
  - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that titleId into your game. This lets the client know how to access the correct data within PlayFab. For most users, just consider it a mandatory step that makes PlayFab work.

- request
  - Most PlayFab API methods require input parameters, and those input parameters are packed into a dictionary object.
    - `LoginWithCustomIDRequest` takes a mandatory parameter of `CustomId`, which uniquely identifies a player and returns the associated entity token, and `CreateAccount`, which allows the creation of a new account with this call.
    - For login, most developers will want to use a more appropriate login method.
      - See the [PlayFab Login documentation](xref:titleid.playfabapi.com.client.authentication) for a list of all login methods, and input parameters. Common choices are:
        - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
        - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
        - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)

- Callback
  - Success
    - If the API call was successful, success will contain the requested information and failure will be `None`.
    - For login requests, success will contain basic information about the player, but for most users, login is simply a mandatory step before calling other APIs.

  - Failure
    - If the API call wasn't successful, failure will contain some error information and success will be `None`.
    - API calls can fail for many reasons, and you should always attempt to handle the failure.
    - Why API calls fail (In order of likelihood)
      - `PlayFabSettings.TitleId` is not set. If you forget to set `titleId` to your title, then nothing will work.
      - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail.
      - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
      - PlayFab server issue. As with all software, there can be issues. See our [release notes](../../release-notes/index.md) for updates.
      - The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.

- `PlayFabClientAPI.LoginWithCustomID`
  - Triggers the API call synchronously. When complete, the callback will be invoked.
