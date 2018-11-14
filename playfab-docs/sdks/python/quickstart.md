---
title: Python Quickstart
author: v-thopra
description: This guide will help you make your first PlayFab API call in Python 3.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, python 3, python sdk
ms.localizationpriority: medium
---

# Python Quickstart

This guide will help you make your first API call in Python 3. A native Python project can be used a few ways:

- Stand-alone console Admin tools for maintaining your game
  - The Python Sdk works great for a stand-alone Python program
  
- Integration into an existing Python based game engine
  - See [list of game engines](https://wiki.python.org/moin/PythonGameLibraries)

If you have any issues, let us know on the [Forums](https://community.playfab.com/index.html).

> [!NOTE]
> This beta release of the PythonSdk only supports synchronous API calls, and your game loop may become blocked performing PlayFab API calls. You may need to create your own async/threading model to avoid this problem.

## Python Project Setup

- Make sure [Python 3](https://www.python.org/downloads/) is installed on your system
- Install the [PlayFab Package](https://pypi.org/project/playfab/) using the below command

```cmd
pip install playfab
```

- If pip is not in your path, use the below command instead

```cmd
python -m pip install playfab
```

- Create a new python script in your desired directory called playfab_test.py

## Set up your first API call

This guide will provide the minimum steps to make your first PlayFab API call, without any GUI or on-screen feedback. Confirmation will be done with a console print statement.

- Replace the contents of playfab_test.py with the following:

```python
from playfab import PlayFabClientAPI, PlayFabSettings

PlayFabSettings.TitleId = "144"

request = {
    "CustomId": "GettingStartedGuide",
    "CreateAccount": True,
    "LoginTitlePlayerAccountEntity": True
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

## Finish and Execute

- Run the Python script
  - From the command line, run the following command:

```cmd
python playfab_test.py
```

- When it finishes, you should see the following text:
  - "Congratulations, you made your first successful API call!"
  
- At this point, you can start making other API calls, and building your game
- For a list of all available client API calls, see our documentation:
  - [https://api.playfab.com/](https://api.playfab.com/)

- Happy coding!

## Deconstruct the code

This optional last section describes each part of playfab_test.py in detail.

- imports
  - The PlayFab imports get you access to the APIs.

- PlayFabSettings.TitleId = "144"
  - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that titleId into your game. This lets the client know how to access the correct data within PlayFab. For most users, just consider it a mandatory step that makes PlayFab work

- request
  - Most PlayFab API methods require input parameters, and those input parameters are packed into a dictionary object
    - For LoginWithCustomIDRequest, there is a mandatory parameter of CustomId, which uniquely identifies a player, LoginTitlePlayerAccountEntity, which automatically logs the player's title_player_account in and returns the associated entity token, and CreateAccount, which allows the creation of a new account with this call.
    - For login, most developers will want to use a more appropriate login method
      - See the [PlayFab Login documentation](https://api.playfab.com/documentation/Client#Authentication) for a list of all login methods, and input parameters. Common choices are:
        - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
        - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
        - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)

- callback
  - success
    - If the API call was successful, success will contain the requested information and failure will be None
    - For login requests, success will contain basic information about the player, but for most users, login is simply a mandatory step before calling other APIs

  - failure
    - If the API call wasn't successful, failure will contain some error information and success will be None
    - API calls can fail for many reasons, and you should always attempt to handle failure
    - Why API calls fail (In order of likelihood)
      - PlayFabSettings.TitleId is not set. If you forget to set titleId to your title, then nothing will work.
      - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail. 
      - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
      - PlayFab server issue. As with all software, there can be issues. See our [release notes](https://api.playfab.com/releaseNotes/) for updates.
      - The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.
  
    - If you are having difficulty debugging an issue, and the information within the error information is not sufficient, please visit us on our [forums](https://community.playfab.com/index.html)

- PlayFabClientAPI.LoginWithCustomID
  - Triggers the API call synchronously. When complete, the callback will be invoked
