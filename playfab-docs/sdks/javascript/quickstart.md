---
title: JavaScript quickstart for Native and Phaser
author: joannaleecy
description: This guide will help you make your first PlayFab API call in JavaScript.
ms.author: joanlee
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, javascript, playfab javascript sdk, native, phaser
ms.localizationpriority: medium
---

# QuickStart: PlayFab client library for JavaScript

Get started with the PlayFab client library for JavaScript to authenticate a player. Follow steps to install the package and try out example code for basic tasks. 

## Prerequisites

* A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up). For information about creating a Title and finding TitleId, see [Game Manager QuickStart](../../gamemanager/quickstart.md).

The QuickStart guide works in any operating system capable of running a web browser.

## JavaScript project setup

Before you can call any PlayFab API, you must have a [PlayFab developer account](https://developer.playfab.com/en-us/sign-up). For information about creating a Title and finding TitleId, see [Game Manager QuickStart](../../gamemanager/quickstart.md).

OS: This guide works in any OS capable of running a web browser.

To set up a new project, create a new folder with two empty text files:  

- `PlayFabGettingStarted.html`  
- `PlayFabGettingStarted.js`

That's it - PlayFab installation complete!

## Code examples

This guide provides the minimum steps to make your first PlayFab API call. Confirmation is visible on the webpage. For more information about parameters and return values, we recommend using [Postman template](../postman/postman-quickstart.md) first. 

### Authenticate the client

In your favorite text-editor, update the contents of `PlayFabGettingStarted.html` as follows:

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

In your favorite text-editor, update the contents of `PlayFabGettingStarted.js` as follows:

```javascript
function DoExampleLoginWithCustomID(){
    PlayFab.settings.titleId = document.getElementById("titleId").value;
    var loginRequest = {
        // Currently, you need to look up the required and optional keys for this object in the API reference for LoginWithCustomID. See the Request Headers and Request Body.
        TitleId: PlayFab.settings.titleId,
        CustomId: document.getElementById("customId").value,
        CreateAccount: true
    };

    PlayFabClientSDK.LoginWithCustomID(loginRequest, LoginCallback);
}

// callback functions take two parameters: result and error
// see callback functions in JavaScript if unclear
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

To look up the correct format for the loginRequest object in this example, see the API reference for [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid).



## Run the code

1. Open `PlayFabGettingStarted.html` in your favorite browser.
2. Click the **Call LoginWithCustomID** button.
3. You should see the following text in the Result section:
"Congratulations, you made your first successful API call!"

At this point, you can start making other api calls, and building your game.

For a list of all available client API calls, see [PlayFab API References](../../api-references/index.md) documentation.



## Deconstruct the code

This section describes each part of the code in detail.

The HTML file has a few important lines:

```html
<script type="text/javascript" src="https://download.playfab.com/PlayFabClientApi.js"></script>
```

This line loads the Client-SDK directly from the PlayFab CDN. Our CDN always hosts the latest version of PlayFabSDK. It may be safer for you to download the files, and use a fixed version: [PlayFab JavaScript SDK](https://aka.ms/playfabjavascriptsdkdownload)

```html
<script type="text/javascript" src="PlayFabGettingStarted.js"></script>
...
<input type="button" value="Call LoginWithCustomID" onclick="DoExampleLoginWithCustomID()"><br />
```

As you can see above, `PlayFabGettingStarted.js` contains the `DoExampleLoginWithCustomID` function. These lines bind our js file to our webpage, and invoke the `DoExampleLoginWithCustomID` function in that script. Everything else is just GUI.

The functions in `PlayFabClientSDK` are named after the corresponding HTTP requests. For example, the corresponding HTTP request for the `LoginWithCustomID` function is also named"LoginWithCustomID." The Request Body is packed into the JavaScript request object as keys and values. The Session Ticket will be saved from login, so client calls need not incorporate the Session Ticket from the Request Header.

- Line by line breakdown for `PlayFabGettingStarted.js`
  - `PlayFab.settings.titleId = "xxxx";`
    - Every PlayFab developer creates a title in Game Manager. When you publish your game, you must code that titleId into your game. This lets the client know how to access the correct data within PlayFab. For most users, just consider it a mandatory step that makes PlayFab work.

  - `var loginRequest = { TitleId: PlayFab.settings.titleId, CustomId: "GettingStartedGuide", CreateAccount: true };`
    - Most PlayFab API methods require input parameters, and those input parameters are packed into a request object
    - Every API method requires a unique request object, with a mix of optional and mandatory parameters
      - For `LoginWithCustomID`, there is a mandatory parameter of `CustomId`, which uniquely identifies a player and `CreateAccount`, which allows the creation of a new account with this call. `TitleId` is another mandatory parameter in JavaScript, and it must match `PlayFab.settings.titleId`.
      - For information about where to find `TitleId`, see [Game Manager QuickStart](../../gamemanager/quickstart.md).
  - In this case, `TitleId`,  `customId`, and `CreateAccount` are from the Request Body of `LoginWithCustomID`. The Request Body fields are included as keys and values in the request object. The Session Ticket in the Request Header will be saved from login, so the SessionTicket is not included in the request object.
    
  - `PlayFabClientSDK.LoginWithCustomID(loginRequest, LoginCallback);`
    - This begins the async request to `LoginWithCustomID`, which will call `LoginCallback` when the API call is complete.
    - For login, most developers will want to use a more appropriate login method.
      - See [PlayFab Login Documentation](xref:titleid.playfabapi.com.client.authentication) for a list of all login methods, and input parameters. Common choices are:
        - [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
        - [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
        - [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)
  - If new to JavaScript, we recommend that developers read about callback functions.
  
  - `LoginCallback` contains two parameters: result, error
    - When successful, error will be null, and the result object will contain the requested information, according to the API called.
    - This result contains some basic information about the player, but for most users, login is simply a mandatory step before calling other APIs.
  - If error is not `null`, your API call has failed.



## Troubleshooting

- API calls can fail for many reasons, and you should always attempt to handle failure.
- The error object includes the error name, error code, and error message. Together, this information should be sufficient to diagnose your error.
- Global API Method Error Codes can be found in PlayFab's [Global API Method Error Codes](../../api-references/global-api-method-error-codes.md).
- Why API calls fail (In order of likelihood)
  - PlayFabSettings.TitleId is not set. If TitleId is not set, then nothing will work.
  - Request parameters. If you have not provided the correct or required information for a particular API call, then it will fail. See `error.errorMessage, error.errorDetails`, or `error.GenerateErrorReport()` for more info.
  - Device connectivity issue. Cell-phones lose/regain connectivity constantly, and so any API call at any time can fail randomly, and then work immediately after. Going into a tunnel can disconnect you completely.
- PlayFab server issue. As with all software, there can be issues. See our [release notes](../../release-notes/index.md) for updates.
    - The internet is not 100% reliable. Sometimes the message is corrupted or fails to reach the PlayFab server.
- If you are having difficulty debugging an issue, and the information within the error information is not sufficient, please visit us on our [forums](https://community.playfab.com/index.html).



## Next Steps

This quickstart shows a simplified procedure for authenticating a user. For additional information about user authentication, see [Login basics and best practices](../../features/authentication/login/login-basics-best-practices.md).

Happy coding!
