# Setting up PlayFab authentication using Twitch and HTML5

This tutorial guides you through an example of PlayFab authentication using Twitch and HTML5/JavaScript.

## Requirements

- [Twitch Account](https://www.twitch.tv/) for testing
- Registered [PlayFab](https://playfab.com/) Title
- Familiarity with [Login basics and Best Practices](../../authentication/platform-specific-authentication/login-basics-best-practices)
- Minimal server with a valid domain name to serve static HTML files. Consult the [Running Test HTTP Server](https://api.playfab.com/docs/tutorials/http-server) guide to set one up.

## Server and Domain

This tutorial requires a web server in order to follow the instructions. If you do not have a registered remote web server yet, please follow our [Running Test HTTP Server](https://api.playfab.com/docs/tutorials/http-server) guide to run a local web server. Throughout this tutorial, we will assume your domain is ['http://localhost/'](http://localhost/).

## Registering a Twitch Application

Start by navigating to the [Twitch website](https://www.twitch.tv/) and make sure you are logged in. Navigate to the Account drop-down **(1)** and select "Settings" **(2)**:

![Twitch account settings](media/tutorials/twitch-html5/twitch-account-settings.png)  

On the Settings page, select "Connections" **(1)**:

![Twitch settings connections](media/tutorials/twitch-html5/twitch-settings-connections.png)  

At the very bottom of the page, locate and click the "Register your application" button **(1)**:

![Twitch open application registration page](media/tutorials/twitch-html5/twitch-open-application-registration.png)  

A page will open that lets you configure a new app. Fill in the Name of the application **(1)**, Redirect URL **(2)**, and Application Category **(3)**. Then agree to the Twitch Terms and click "Register" **(4)**.

![Twitch register your application](media/tutorials/twitch-html5/twitch-register-your-application.png)  

> ![IMPORTANT]  
> When testing using a local web server, Twitch allows you to use 'http://localhost/' as a redirect URL. Make sure to include the leading slash ('/'). Without a leading slash, Twitch will fail to recognize localhost URL.

Once the application is registered, a page will be updated and reveal the Client ID for your application. Save this Client ID, it will be used later to configure your PlayFab title:

![Twitch manage application](media/tutorials/twitch-html5/twitch-manage-application.png)  

## Configuring a PlayFab Title

Once you acquire your Twitch Client ID, you may enable and configure a Twitch Add-on for your PlayFab Title. On your PlayFab Title page navigate to the "Add-ons" tab **(1)**, then locate and select the Twitch Add-on **(2)**:

![Game Manager Add-ons tab](media/tutorials/twitch-html5/game-manager-addons-tab-twitch.png)  

On the Add-on page, click the "Install" button. A Settings page will open for the Twitch Add-on. Enter your Twitch Client ID **(1)** and click the "Install Twitch" button **(2)**:

![Game Manager Twitch Add-on settings and install](media/tutorials/twitch-html5/game-manager-twitch-addon-settings.png)  

Ensure the add-on was installed and that no errors pop up. This concludes configuring the PlayFab Title.

## Testing

Use the following HTML file to test PlayFab authentication using Twitch. Make sure to replace TWITCH_CLIENT_ID_GOES_HERE and PLAYFAB_TITLE_ID_GOES_HERE with your own values:

```html
<!DOCTYPE html>
<html>
<head>
    <!-- Include JQuery - dependency of Twitch JS SDK -->
    <script src="//code.jquery.com/jquery.min.js"></script>
    <!-- Include Twitch SDK -->
    <script src="https://ttv-api.s3.amazonaws.com/twitch.min.js"></script>
    <!-- Include PlayFab SDK -->
    <script src="https://download.playfab.com/PlayFabClientApi.js"></script>
</head>
<body>
    <p>Twitch Auth Example</p>
    <button onclick="login()">Login With Twitch</button>
    <script>
        // Establish Twitch Auth Callback (invoked when logged in with Twitch)
        Twitch.events.addListener('auth.login', function() {
            logLine("Logged in with Twitch!");
            // Invoke login with PlayFab code and pass the token
            loginWithPlayFab(Twitch.getToken());
        });

        // Run Twitch SDK initialization
        Twitch.init({clientId: 'TWITCH_CLIENT_ID_GOES_HERE'}, function(error, status) {
            logLine("Twitch SDK Initialized");
        });

        // This method is invoked when you press the button

        function login() {
            logLine("Logging in via Twitch...");
            Twitch.login({
                scope: ['user_read', 'channel_read']
            });
        }

        function loginWithPlayFab(accessToken){
            logLine("Logging in via PlayFab...");

            // When given accessToken, make call to LoginWithTwitch API Call
            // Make sure to use your own PlayFab Title ID
            PlayFabClientSDK.LoginWithTwitch({
                AccessToken: accessToken,
                TitleId: "PLAYFAB_TITLE_ID_GOES_HERE",
                CreateAccount: true
            }, onPlayFabResponse);
        }

        // Handles response from playfab.
        function onPlayFabResponse(response, error) {
            if (response)
                logLine("Response: " + JSON.stringify(response));
            if (error)
                logLine("Error: " + JSON.stringify(error));
        }

        function logLine(message) {
        console.log(message);
            var textnode = document.createTextNode(message);
            document.body.appendChild(textnode);
            var br = document.createElement("br");
            document.body.appendChild(br);
        }
    </script>
</body>
</html>
```

Request the following file from your server using the domain you set up during Twitch Application configuration ( `http://localhost' in our case) **(1)**. Once the page opens, wait for the message indicating that the Twitch SDK was initialized **(2)**. Then, click the "Log In with Twitch" button **(3)**. Follow any Twitch instructions in the pop up window. Watch the output **(4)**.

> [!IMPORTANT]
> If you already have a Twitch auth session going when reaching the page, it is possible for callbacks to fire in a different, unexpected order. This case is shown in the following screenshot. However, you should only make sure that "Logging in via PlayFab" follows after "Logged in with Twitch". This means that the token was received or restored from the local storage and we do not have to wait for the Twitch SDK to start signing in to PlayFab.

![Twitch Auth Example](media/tutorials/twitch-html5/twitch-auth-example.png)  

If PlayFab manages to acquire a SessionTicket, you have successfully integrated Twitch authentication with your PlayFab app.