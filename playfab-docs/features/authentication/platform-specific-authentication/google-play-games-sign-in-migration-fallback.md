---
title: Migrating from Google Sign-in to Google Play Games Sign-in in Unity Fallback
author: joannaleecy
description: Fallback method for players that are still not using Google Play Games identity after upgrading Play Games Plugin for Unity plugin. 
ms.author: joanlee
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, authentication, google, unity
ms.localizationpriority: medium
---

# Fix for using LoginWithGoogleAccount on Play Games Plugin for Unity v0.11.x

This article describes a workaround when you're getting errors back when using **LoginWithGoogleAccount** API after upgrading to a version of the Play Games Plugin for Unity.

The error occurs when existing players didn't [migrate to use LoginWithGooglePlayGamesServices](google-play-games-sign-in-migration-details.md#migration-steps) after you've upgraded [Play Games Plugin for Unity](https://github.com/playgameservices/play-games-plugin-for-unity) to a version greater or equal than v0.11.x. The reason is because Google removed the possibility of adding extra scopes on plugin versions greater or equal than 0.11.x.

This workaround should be considered as a fallback alternative since having to sign-in through the browser could affect player's experience.

## Before we start

Following these high level steps to fix authentication when using the newest version of the plugin.

1. Manually calling the Google OAuth2 APIs
2. Perform the player's auth in a browser tab
3. Get a redirection auth code back to the game using Android deep linking.

## Recommendation

While you're still using version 0.10.x of the plugin, [migrate your users to use LoginWithGooglePlayGamesServices](google-play-games-sign-in-migration-details.md#migration-steps) API. Use the following steps as a fallback method for the remainder of your players after upgrading to version 0.11.x or later of the plugin.

## Fix Steps

1. Add Android intent to your Game using Deep Linking. (Steps adapted from [Unity - Manual: Deep linking on Android (unity3d.com)](https://docs.unity3d.com/2021.2/Documentation/Manual/deep-linking-android.html))

    a. In the Project window, go to **Assets > Plugins > Android**.

    b. Create a new file and call it **AndroidManifest.xml**. Unity automatically processes this file when you build your application.

    c. Copy the following manifest sample into the new file, update the data element with your app's URI and save it. For more information on how to build a proper data tag, see [this article](https://developer.android.com/guide/topics/manifest/data-element).

    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools">
        <application>
        <activity android:name="com.unity3d.player.UnityPlayerActivity" android:theme="@style/UnityThemeSelector">
            <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
    
            <intent-filter android:autoVerify="true">
            <action android:name="android.intent.action.VIEW" />
    
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
    
            <data
                android:scheme="https"
                android:host="mytestapp.com"
                android:path="/path1/subpath" />
            </intent-filter>
            
        </activity>
        </application>
    </manifest>
    ```

    d. Make sure the **autoVerify** property exists on the intent-filter tag.

2. In order for deep linking to work, starting in Android 12, Google is now requiring developers to host an assetlinks.json file in a well-known location to successfully redirect to your app.

    For example, if your redirect URI is https://mytestapp.com/path1/subpath, you should host a valid assetlinks.json file in https://mytestapp.com/.well-known/assetlinks.json, otherwise deep linking doesn't work and you don't get redirected back to your app to continue.
    For details on how to create an assetlinks.json file see [Verify Android App Links](https://developer.android.com/training/app-links/verify-android-applinks).
    
3. Add Deep Linking processing to your Game. (Steps adapted from [Unity - Manual: Deep linking (unity3d.com)](https://docs.unity3d.com/2021.2/Documentation/Manual/deep-linking.html#using-deep-links)).

    ```csharp
    using GooglePlayGames;
    using GooglePlayGames.BasicApi;
    using PlayFab;
    using PlayFab.ClientModels;
    using System;
    using UnityEngine;
    using UnityEngine.UI;

    public class ProcessDeepLinkMngr : MonoBehaviour
    {
        public static ProcessDeepLinkMngr Instance { get; private set; }

        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
                Application.deepLinkActivated += onDeepLinkActivated;
                if (!string.IsNullOrEmpty(Application.absoluteURL))
                {
                    // Cold start and Application.absoluteURL not null so process Deep Link.
                    onDeepLinkActivated(Application.absoluteURL);
                }

                DontDestroyOnLoad(gameObject);
            }
            else
            {
                Destroy(gameObject);
            }
        }

        private void onDeepLinkActivated(string url)
        {
            Debug.Log("Got Deeplink Activated: " + url);

            // Decode the URL to extract auth code. 
            string queryParams = url.Split("?"[0])[1];
            string[] keyValuePairs = queryParams.Split("&");
            string authCode = string.Empty;

            foreach (string s in keyValuePairs)
            {
                if (s.StartsWith("code"))
                {
                    authCode = s.Split("=")[1];
                    break;
                }
            }
    
            if (!string.IsNullOrEmpty(authCode))
            {
                // Call the LoginWithGoogleAccount using the auth code
                Debug.Log("Authenticating to PlayFab using LoginWithGoogleAccount...");

                // Make sure to unescape string
                authCode = Uri.UnescapeDataString(authCode);

                var request = new LoginWithGoogleAccountRequest
                {
                    ServerAuthCode = authCode,
                    CreateAccount = true,
                    TitleId = PlayFabSettings.TitleId
                };
    
                PlayFabClientAPI.LoginWithGoogleAccount(request,
                    (LoginResult result) => {
                        Debug.Log("PlayFab LoginWithGoogleAccount Success.");
                    },
                    (PlayFabError error) => {
                        Debug.Log("PlayFab LoginWithGoogleAccount Failure: " + error.GenerateErrorReport());
                    }
                );
            }
            else
            {
                Debug.Log("Error when getting Auth Code.");
            }
        }
    }
    ```
 
4. Add some code to launch a browser to the Google OAuth2 API and let the player sign-in via the browser. If the player is already logged in on their browser the transition is seamless, otherwise they need to input their credentials.

    ```csharp
    private string authorizationEndpoint = "https://accounts.google.com/o/oauth2/v2/auth";
    private string redirectURI = "[APPLICATION-REDIRECT-URI]";
    private object clientID = "[WEB-APPLICATION-CLIENT-ID]";
    private string scopes = "profile";

    private void LaunchBrowserAuth()
    {
        string authorizationRequest = string.Format("{0}?response_type=code&scope={1}&redirect_uri={2}&client_id={3}",
                authorizationEndpoint,
                scopes,
                Uri.EscapeDataString(redirectURI),
                clientID);

        Application.OpenURL(authorizationRequest);
    }
    ```
    The redirection URI must match with the Android intent filter we added in step 1. So, when the user finishes authentication, the browser navigates to that redirect URI and the browser should ask the user if they want to navigate back to the application.
 
5. Now, you should be ready to test this out. So, when you trigger the auth you should get a browser open and user must sign-in accordingly. Unless browser data is deleted, this step should be a one-time process.
 
    ![Using LoginWithGoogleAccount Step 1](media/tutorials/google-unity/LWGA-fix-1.png)
 
6. After the user completes the authentication, the browser will ask on which application should open the redirect URL.
 
    ![Using LoginWithGoogleAccount Step 2](media/tutorials/google-unity/LWGA-fix-2.png)
 
7. This action navigates back to our application and we can get the code from the query parameters on the redirect URL and proceed to call LoginWithGoogleAccount.
 
    ![Using LoginWithGoogleAccount Step 3](media/tutorials/google-unity/LWGA-fix-3.png)
 
8. Lastly, we recommend using this method as a fallback alternative for any users that couldn't be migrated using the [migration steps](google-play-games-sign-in-migration-details.md#migration-steps).
 
***Please keep in mind that you should keep track of which users are already migrated to use LoginWithGooglePlayGamesServices and prefer to use the automatic login mechanism provided by the plugin and use this as a workaround for users who haven't been migrated over.***
