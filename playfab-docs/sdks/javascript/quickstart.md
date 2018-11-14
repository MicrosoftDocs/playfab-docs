---
title: JavaScript Quickstart for Native and Phaser
author: v-thopra
description: This guide will help you make your first PlayFab API call in JavaScript.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, javascript, playfab javascript sdk, native, phaser
ms.localizationpriority: medium
---

# JavaScript Quickstart for Native and Phaser

This guide will help you make your first API call in JavaScript.

## JavaScript Project Setup

- OS: This guide should work in any OS capable of running a web-browser
- Installation
  - You are probably already reading this page on your favorite browser

- New Project Setup
  - Create a new folder, with two empty text files:
    - PlayFabGettingStarted.html
    - PlayFabGettingStarted.js

- PlayFab installation complete

## Set up your first API call

This guide will provide the minimum steps to make your first PlayFab API call. Confirmation will be visible on the webpage.

In your favorite text-editor, update the contents of PlayFabGettingStarted.html as follows:

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>PlayFab JavaScript Unit Tests</title>
    <script type="text/javascript" src="https://download.playfab.com/PlayFabClientApi.js"></script>
    <script type="text/javascript" src="PlayFabGettingStarted.js"></script>
</head>
<body>
    PlayFab Getting Started Guide<br />
    TitleID: <input type="text" id="titleId" value="144"><br />
    CustomID: <input type="text" id="customId" value="GettingStartedGuide"><br />
    <input type="button" value="Call LoginWithCustomID" onclick="DoExampleLoginWithCustomID()"><br />
    Result:<br />
    <textarea id="resultOutput" cols="60" rows="5"></textarea><br />
</body>
</html>
```

In your favorite text-editor, update the contents of PlayFabGettingStarted.html as follows:

> [!NOTE]
> To look up the correct format for the loginRequest object in this example, see the API reference for [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid).

```javascript
function DoExampleLoginWithCustomID(){
    PlayFab.settings.titleId = document.getElementById("titleId").value;
    var loginRequest = {
        // Currently, you need to look up the correct format for this object in the API reference for LoginWithCustomID.
        TitleId: PlayFab.settings.titleId,
        CustomId: document.getElementById("customId").value,
        CreateAccount: true
    };

    PlayFabClientSDK.LoginWithCustomID(loginRequest, LoginCallback);
}

var LoginCallback = function (result, error) {
    if (result !== null) {
        document.getElementById("resultOutput").innerHTML = "Congratulations, you made your first successful API call!";
    } else if (error !== null) {
        document.getElementById("resultOutput").innerHTML =
            "Something went wrong with your first API call.\n" +
            "Here's some debug information:\n" +
            PlayFab.GenerateErrorReport(error);
    }
}
```

## Finish and Execute

- Open PlayFabGettingStarted.html in your favorite browser
- Click the "Call LoginWithCustomID" button
- You should see the following text in the Result section:

Congratulations, you made your first successful API call!

- At this point, you can start making other api calls, and building your game
- For a list of all available client API calls, see our documentation:
  - https://api.playfab.com/

- Happy coding!

## Deconstruct the code

This optional last section describes each part of Program.cs in detail.

The HTML file has a few important lines:

```html
src="https://download.playfab.com/PlayFabClientApi.js"></script>
```

version of PlayFabSDK. It may be safer for you to download the files, and use a fixed version: [PlayFab JavaScriptSDK](https://api.playfab.com/sdks/download/javascript)

```html
<script type="text/javascript" src="PlayFabGettingStarted.js"></script>
...
<input type="button" value="Call LoginWithCustomID" onclick="DoExampleLoginWithCustomID()"><br />
```

As you can see above, PlayFabGettingStarted.js contains the DoExampleLoginWithCustomID function. These lines bind our js file to our webpage, and invoke the DoExampleLoginWithCustomID function in that script. Everything else is just GUI.

- Line by line breakdown for PlayFabGettingStarted.js
  - PlayFab.settings.titleId = "xxxx";
    - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that titleId into your game. This lets the client know how to access the correct data within PlayFab. For most users, just consider it a mandatory step that makes PlayFab work.

  - var loginRequest = { TitleId: PlayFab.settings.titleId, CustomId: "GettingStartedGuide", CreateAccount: true };
    - Most PlayFab API methods require input parameters, and those input parameters are packed into a request object
    - Every API method requires a unique request object, with a mix of optional and mandatory parameters
      - For LoginWithCustomIDRequest, there is a mandatory parameter of CustomId, which uniquely identifies a player and CreateAccount, which allows the creation of a new account with this call. TitleId is another mandatory parameter in JavaScript, and it must match PlayFab.settings.titleId

  - PlayFabClientSDK.LoginWithCustomID(loginRequest, LoginCallback);
    - This begins the async request to "LoginWithCustomID", which will call LoginCallback when the API call is complete
    - For login, most developers will want to use a more appropriate login method
      - See the [PlayFab Login Documentation](https://api.playfab.com/documentation/Client#Authentication) for a list of all login methods, and input parameters. Common choices are:
        - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
        - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
        - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)

  - LoginCallback contains two parameters: result, error
    - When successful, error will be null, and the result object will contain the requested information, according to the API called
      - This result contains some basic information about the player, but for most users, login is simply a mandatory step before calling other APIs.

    - If error is not null, your API has failed
      - API calls can fail for many reasons, and you should always attempt to handle failure
      - Why API calls fail (In order of likelihood)
        - PlayFabSettings.TitleId is not set. If you forget to set titleId to your title, then nothing will work.
        - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail. See error.errorMessage, error.errorDetails, or error.GenerateErrorReport() for more info.
        - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
        - PlayFab server issue. As with all software, there can be issues. See our [release notes](https://api.playfab.com/releaseNotes/) for updates.
        - The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.

    - If you are having difficulty debugging an issue, and the information within the error information is not sufficient, please visit us on our [forums](https://community.playfab.com/index.html)
