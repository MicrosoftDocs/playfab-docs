# Setting up PlayFab authentication using Kongregate and HTML5

This tutorial shows you the minimal setup required to authenticate your players in PlayFab using Kongregate and HTML5/JavaScript.

## Requirements

- Registered [Kongregate](http://www.kongregate.com/) account
  - Familiarity with the [Kongregate Developers Guide](http://developers.kongregate.com/docs/api-overview/intro)
- Registered PlayFab Title
- Familiarity with [Login Basics & Best Practices guide](https://api.playfab.com/docs/tutorials/landing-players/best-login)

## Setting up a Kongregate App

Kongregate requires you to upload a preview version of the app, before you gain access to the necessary API information. So we need to prepare an index.html file with the following content:

```html
<!doctype html>
<html lang="en-us">
<head></head>
<body>
 <h1>Placeholder</h1>
</body>
</html>
```

Navigate to the [Kongregate website](http://www.kongregate.com/), select the "Games" tab **(1)**. Then click the "Upload your game" button **(2)**, as shown in the following picture:

![Kongregate Games tab](media/tutorials/kongregate-games-tab.png)  

A page to set up a new application will open. Make sure to type in the application name **(1)**, description **(2)** and select a category **(3)**. Submit the new app by clicking the "Continue" button **(4)**, as shown in the following picture:

![Kongregate upload your game](media/tutorials/kongregate-upload-your-game.png)  

You will be transferred to the application upload page. First and very important, make sure to save the URL from your web address bar. This will save you a lot of time trying to restore access to the application once you close the page.

Once this is done, select the prepared index.html file as your Game File **(1)** and set up the screen size **(2)**. Make sure to accept all the required licenses **(3)**. Then, upload your application by clicking the "Upload" button in the bottom of the page **(4)**, as shown in the following picture:

![Kongregate application upload page](media/tutorials/kongregate-app-upload-page.png)

Once the preview opens, ignore the content and click on the "api information" link, as shown in the following image:

![Kongregate preview API information](media/tutorials/kongregate-preview-api-info.png)

When the API information page opens, locate the API Key and save it for later use.

![Kongregate API Key](media/tutorials/kongregate-api-key.png)

## Configuring PlayFab title

In your PlayFab Title Game Manager navigate to Add-ons **(1)**, then locate and click "Kongregate" **(2)**, as shown in the following picture:

![PlayFab select Kongregate Add-on](media/tutorials/playfab-select-kongregate-add-on.png)

A page will open, allowing you to set up Kongregate integration. Enter the API Key **(1)** you acquired in the previous section, and click the "Install Kongregate" button **(2)** as shown in the following picture:

![PlayFab set up Kongregate integration](media/tutorials/playfab-set-up-kongregate-integration.png)

If you receive no error message, then you have configured PlayFab title integration with your Kongregate application.

## Preparing some code

Use the following example code to populate the index.html for your game:

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
  <title>Kongregate Javascript API example</title>
  <!-- Import PlayFab API -->
  <script src='https://download.playfab.com/PlayFabClientApi.js'></script>
  <!-- Import JQuery, required specifically by this example, does not effect either API -->
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js'></script>
  <!-- Import Kongregate API -->
  <script src='https://cdn1.kongregate.com/javascripts/kongregate_api.js'></script>
</head>

<!-- Define elements with IDs to show current state of things and a couple of buttons -->
<body style='background-color:white'>
  <span id='init'>Initializing...</span>
  <div id='content' style='display:none'>
    <div>Kongregate API Loaded!</div>
    <div id='username'></div>
    <div id='user_id'></div>
    <!-- This button will invoke Kongregate Auth Box -->
    <button id='login' style='display:none'
      onclick='kongregate.services.showRegistrationBox()'>Sign in/register</button>
    <!-- This button will invoke PlayFab authentication process -->
    <button id='login'
       onclick='loginInUsingPlayFab()'>PlayFab Login With Kongregate</button>
  </div>

  <script type='text/javascript'>

    // This function just updates UI, nothing else
    function updateFields() {
      $('#init').hide();
      $('#content').show();

      // Visualize Kongregate Auth Data
      $('#username').text('Username: ' + kongregate.services.getUsername());
      $('#user_id').text('User ID: ' + kongregate.services.getUserId());

      // If not authenticated in Kongregate, allow to use Login button
      if(kongregate.services.isGuest()) {
        $('#login').show();
      } else {
        $('#login').hide();
      }
    }

    // The function prepares and triggers PlayFab LoginWithKongregate API call
    function loginInUsingPlayFab() {
      // Setting up playfab title ID
      PlayFab.settings.titleId = "159F";

      // forming request
      var request = {
        TitleId: PlayFab.settings.titleId,
        AuthTicket: kongregate.services.getGameAuthToken(),
        KongregateId : kongregate.services.getUserId(),
        CreateAccount: true
      };

      console.log('logging in');
      // Invoke LoginWithKongregate API call and visualize both results (success or failure)
      PlayFabClientSDK.LoginWithKongregate(request,
      function(result){
        $('<div></div>').html('Authenticated via playfab').appendTo('#content')
        console.log("success");
      },
      function(err){
        $('<div></div>').html('Problem occured: ' + PlayFab.GenerateErrorReport(err)).appendTo('#content')
        console.log("failure");
      });
    }

    // The entry point for Kongregate initialization
    kongregateAPI.loadAPI(function(){
      window.kongregate = kongregateAPI.getAPI();
      updateFields();
      kongregate.services.addEventListener('login', function(){
        updateFields();
      });
    });
  </script>
</body>
</html>
```

## Testing

Use the URL you saved earlier to access your application upload page. Select index.html as your Game File **(1)** and set up the screen size **(2)**. Make sure to accept all the required licenses **(3)**. Upload your application by clicking the "Upload" button in the bottom of the page **(4)**, as shown in the following picture:

![Kongregate application upload page](media/tutorials/kongregate-app-upload-page.png)

Once the preview loads, wait for the application to obtain the Kongregate User ID and Username. Once done, click the "PlayFab Login With Kongregate" button. In a moment, if you get an "Authenticated via PlayFab" message, this means that you have successfully logged in using PlayFab and Kongregate!

![Testing PlayFab Login with Kongregate](media/tutorials/kongregate-html5/testing-playfab-login-with-kongregate.png)