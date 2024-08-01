---
title: NodeJS quickstart
author: joannaleecy
description: This guide will help you make your first API call in NodeJS.
ms.author: joanlee
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, nodejs, javascript
ms.localizationpriority: medium
---

# Quickstart: PlayFab client library for NodeJS

Get started with the PlayFab client library for NodeJS to make your first PlayFab API call and authenticate a player. Follow steps to install the package and try out example code for basic tasks.



## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up). For information about creating a Title and finding TitleId, see [Game Manager QuickStart](../../gamemanager/quickstart.md).
- [Node.js](https://nodejs.org/en/download/)
- Node must be in your PATH environment variable. If you used the installer, it's probably set for you to the default location: C:/Program Files (x86)/nodejs/



## Setting up

The following commands work on Windows, MacOS, and Linux.

1. Create a new folder for your project {NodeProjLocation}:

   `GettingStarted.js`

2. Open a command window in your project folder.

3. Run this command:

   `npm install playfab-sdk --save`

   (Keep this window open (we'll use it again later.)

PlayFab installation complete!



## Code examples

### Authenticate the client

This guide provides the minimum steps for you to make your first PlayFab API call, without any GUI or on-screen feedback. Confirmation is done with the Console log. For more information about parameters and return values, we recommend using [Postman template](../postman/postman-quickstart.md) first. 

In your favorite text editor, update the contents of GettingStarted.js as follows:

> [!NOTE]
> To look up the correct format for the `loginRequest` object in this example, see the API reference for [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid).  

```javascript
var PlayFab = require("./node_modules/playfab-sdk/Scripts/PlayFab/PlayFab");
var PlayFabClient = require("./node_modules/playfab-sdk/Scripts/PlayFab/PlayFabClient");

function DoExampleLoginWithCustomID() {
    PlayFab.settings.titleId = "144";
    var loginRequest = {
        // Currently, you need to look up the correct format for this object in the API reference for LoginWithCustomID. The Request Headers and Request Body are included as keys and values in the request object.
        TitleId: PlayFab.settings.titleId,
        CustomId: "GettingStartedGuide",
        CreateAccount: true
    };

    // For functions in the Node SDK, the first parameter will be the request object and the second parameter will be the callback function. The callback function executes after the request returns.
    PlayFabClient.LoginWithCustomID(loginRequest, LoginCallback);
}

function LoginCallback(error, result) {
    if (result !== null) {
        console.log("Congratulations, you made your first successful API call!");
    } else if (error !== null) {
        console.log("Something went wrong with your first API call.");
        console.log("Here's some debug information:");
        console.log(CompileErrorReport(error));
    }
}

// This is a utility function we haven't put into the core SDK yet. Feel free to use it.
function CompileErrorReport(error) {
    if (error == null)
        return "";
    var fullErrors = error.errorMessage;
    for (var paramName in error.errorDetails)
        for (var msgIdx in error.errorDetails[paramName])
            fullErrors += "\n" + paramName + ": " + error.errorDetails[paramName][msgIdx];
    return fullErrors;
}

// Kick off the actual login call
DoExampleLoginWithCustomID();
```



## Run the code

1. In the console window we opened during installation, run the command:
  
    `node GettingStarted.js`

    You should see the following text as a result:  

    "Congratulations, you made your first successful API call!"

Now, you can start making other API calls and building your game.

For a list of all available client API calls, see our [PlayFab API References](../../api-references/index.md) documentation.



## Deconstruct the code

This section explains each part of the Node quickstart code in detail.

For the Node SDK, the functions in `PlayFabClientSDK` are named after the HTTP request. For example, the corresponding HTTP request for the `LoginWithCustomID` function is also called "LoginWithCustomID." The Request Headers and Request Body are packed into the JavaScript request object as keys and values.

- Line-by-line breakdown for `GettingStarted.js`
  - `PlayFab.settings.titleId = "xxxx";`
    - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that TitleId into your game. This lets the client know how to access the correct data within PlayFab. For most users, just consider it a mandatory step that makes PlayFab work.

  - `var loginRequest = { TitleId: PlayFab.settings.titleId, CustomId: "GettingStartedGuide", CreateAccount: true };`
    - Most PlayFab API methods require input parameters, and those input parameters are packed into a request object.
    - Every API method requires a unique request object, with a mix of optional and mandatory parameters.
      - For `LoginWithCustomIDRequest`, there is a mandatory parameter of `CustomId`, which uniquely identifies a player and `CreateAccount`, which allows the creation of a new account with this call. `TitleId` is another mandatory parameter in JavaScript, and it must match `PlayFab.settings.titleId`.
      - For information about where to find `TitleId`, see [Game Manager QuickStart](../../gamemanager/quickstart.md).
- In this case, `TitleId`,  `customId`, and `CreateAccount` are from the Request Body of `LoginWithCustomID`.
  - `PlayFabClientSDK.LoginWithCustomID(loginRequest, LoginCallback);`
    - This begins the async request to `LoginWithCustomID`, which will call LoginCallback when the API call is complete.

  - For login, most developers will want to use a more appropriate login method.
    - See [PlayFab Login documentation](xref:titleid.playfabapi.com.client.authentication) for a list of all login methods, and input parameters. Common choices are:
      - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
      - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
      - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)
- `LoginCallback` contains two parameters: `error` and `result`.
  - When successful, `error` will be `null`, and the `result` object will contain the requested information, according to the API called.
    - This `result` contains some basic information about the player, but for most users, login is simply a mandatory step before calling other APIs.
- If error is not `null`, your API has failed.



## Troubleshooting

- API calls can fail for many reasons, and you should always attempt to handle failure.
- The error object includes the error name, error code, and error message. Together, this information should be sufficient to diagnose your error.
- Why API calls fail (In order of likelihood):
  - `PlayFabSettings.TitleId` is not set. If you forget to set `TitleId` to your title, then nothing will work.
  - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail. See `error.errorMessage`, `error.errorDetails`, or `error.GenerateErrorReport()` for more info.
  - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
  - PlayFab server issue. As with all software, there can be issues. See our [release notes](../../release-notes/index.md) for updates.
- The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.
  - Global API Method Error Codes can be found in [Global API Method Error Codes](../../api-references/global-api-method-error-codes.md).
  - If you are having difficulty debugging an issue, and the information within the error information is not sufficient, please visit us on our [forums](https://community.playfab.com/index.html).



## Next Steps

This quickstart shows a simplified procedure for authenticating a user. For additional information about user authentication, see [Login basics and best practices](../../features/authentication/login/login-basics-best-practices.md).

Happy coding!
