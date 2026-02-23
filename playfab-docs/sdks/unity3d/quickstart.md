---
title: Unity quickstart
author: DanBehrendt
description: This guide helps you make your first PlayFab API call in the Unity engine.
ms.author: jenelleb
ms.date: 1/25/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, unity3d, playfab unity sdk, csharp, unity
ms.localizationpriority: medium
---

# Quickstart: PlayFab Client library for C# in Unity

Get started with the PlayFab Client library for C# in Unity. Follow steps to install the package and try out example code for a basic task.

This quickstart helps you make your first PlayFab API call in the Unity engine.

## Requirements

- A [PlayFab developer account](https://developer.playfab.com).
- An installed copy of the Unity Editor. To install Unity for personal use via Unity Hub, or Unity+ for professional use, see [Download Unity](https://unity.com/download).
  > [!NOTE]
  > The PlayFab Unity SDK supports Unity Editor version 5.3 (released December 2015) and higher.
- A Unity Project of any of the following types:
  - A brand new project. For more information, see [Starting Unity for the first time](https://docs.unity3d.com/Manual/get-started-with-unity.html).
  - A guided tutorial project. For more information, see [Getting Started with Unity](https://learn.unity.com/).
  - An existing project.
- The PlayFab Unity SDK.

## Download and install PlayFab SDK

Either use the PlayFab Editor Extensions package to install the SDK or install the SDK directly. The PlayFab Editor Extensions are a stand-alone Unity plug-in that streamlines installing the SDK and configuring some PlayFab settings for your Title. For information about installing the SDK without using the PlayFab Editor Extensions, see [Installing the PlayFab SDK Without Editor Extensions for Unity](installing-unity3d-sdk.md#download-and-install-the-sdk-only).

1. Download the [PlayFab Unity Editor Extensions Asset Package](https://aka.ms/PlayFabUnityEdEx).
2. Open your Unity Project.
3. Navigate to where you downloaded the file and double-click on the `PlayFabEditorExtensions.UnityPackage` file to open the **Import Unity Package** dialog in the Unity Editor.

   ![Import Unity Asset package](media/import-uedex.png)
4. To import the PlayFab Unity Editor Extensions into your project, select **Import**.
5. When the import completes, the PlayFab Unity Editor Extensions panel should open automatically displaying the SDK installation dialog.
   > [!NOTE]
   > If the panel did not open, or if you close the panel and want to reopen it, you can do so by selecting **Window** > **PlayFab** > **Editor Extensions**

   ![Install PlayFab SDK](media/install-sdk.png)
6. Select **Install PlayFab SDK** to automatically import the SDK into your project or upgrade the version that is currently installed.

## Set your title settings

Before you can make an API call, you must create a **PlayFabSharedSettings.asset** and specify the Title ID to receive the call. To set the Title ID:

1. Select **PlayFab** > **MakePlayFabSharedSettings** which should create the settings asset and open it in the Inspector panel.
2. Set your **Title ID** in the inspector.

    ![PlayFab Title ID Setting](media/playfab-shared-settings-title-id.png)

3. Now at any time, you may also see and change the current Title ID from the **Settings** tab in the Editor Extensions panel.

The **Developer Secret Key** is not set by default. If you are making a server build, be sure to provide the secret key in the **PlayFabSharedSettings.asset**.

![PlayFab Developer Secret Key Setting](media/playfab-shared-settings-secret-key.png)
The **Developer Secret Key** is automatically set to the default secret key for the Title. For more information about secret keys, see [Secret key management](../../live-service-management/gamemanager/secret-key-management.md).

Otherwise, be sure the secret key **is not set** when building your game client. For more information about secret keys, see [Secret key management](../../live-service-management/gamemanager/secret-key-management.md).

> [!NOTE]
> The extensions allow you to customize the HTTP transport used to make requests to PlayFab. The recommended default is Unity Web Request. Other options exist to provide compatibility with older engine versions or game-specific HTTP implementations.

## Making your first API call

This part of the guide provides the minimum steps to make your first PlayFab API call. This example doesn't provide any GUI or on-screen feedback. Confirmation is displayed in the Console log.

1. If your Unity Project doesn't already have a *Scripts* folder (**HDRP** and **LWRP/URP** templates have one by default), right-click on the **Assets** folder in the Project panel and select **Create** > **Folder**.
2. In the **Assets** window, name the folder *Scripts*.
3. Right-click the Scripts folder and select **Create** > **C# Script**.
4. Name the script PlayFabLogin.
5. Double-click the file to open it in a code-editor.
6. In your code editor, replace the contents of PlayFabLogin.cs with the provided code and save the file.

    ```csharp
    using PlayFab;
    using PlayFab.ClientModels;
    using UnityEngine;

    public class PlayFabLogin : MonoBehaviour
    {
        public void Start()
        {
            if (string.IsNullOrEmpty(PlayFabSettings.staticSettings.TitleId)){
                /*
                Please change the titleId below to your own titleId from PlayFab Game Manager.
                If you have already set the value in the Editor Extensions, this can be skipped.
                */
                PlayFabSettings.staticSettings.TitleId = "42";
            }
            var request = new LoginWithCustomIDRequest { CustomId = "GettingStartedGuide", CreateAccount = true};
            PlayFabClientAPI.LoginWithCustomID(request, OnLoginSuccess, OnLoginFailure);
        }

        private void OnLoginSuccess(LoginResult result)
        {
            Debug.Log("Congratulations, you made your first successful API call!");
        }

        private void OnLoginFailure(PlayFabError error)
        {
            Debug.LogWarning("Something went wrong with your first API call.  :(");
            Debug.LogError("Here's some debug information:");
            Debug.LogError(error.GenerateErrorReport());
        }
    }
    ```

    > [!IMPORTANT]
    > The provided code is not for use with mobile Titles. This is only an example, and shows how to log in with a `CustomID`. To implement login for a mobile Title, use either
    [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid), [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid), or some form of social login such as [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook).
7. In the **Hierarchy** panel, right-click your scene, then select **Create Empty** (or **Game Object** > **Create Empty** in older versions of Unity).
8. Select the new Game Object and in the **Inspector** panel, select **Add Component**.
9. From the component drop-down menu, select **Scripts** > **PlayFabLogin**.

For more information on creating and using scripts in the Unity Editor, see [Creating and Using Scripts](https://docs.unity3d.com/Manual/CreatingAndUsingScripts.html) in the Unity documentation.

## Finish and execute

You're now ready to test out this sample.

- Be sure to save all files and return to the Unity Editor
- Press the **Play** button at the top of the editor

You should see the following message in your Unity Console Panel.

![Console log of first API call](media/first-call-log.png)  

> [!TIP]
>Alternatively, you can log into PlayFab and navigate to the title in Game Manager, and select the **PlayStream Monitor** tab. Each time you switch focus away from the actively running Unity Title, it passes an event which you can see and confirm in the PlayStream Monitor.

For a list of all available client API calls, see [PlayFab API References](../../api-references/index.md).

## Next steps

This quickstart shows a simplified procedure for authenticating a user. For more information on user authentication, see [Login basics and best practices](../../identity/player-identity/login/login-basics-best-practices.md).

Learn how to bind an account to multiple devices and login mechanisms: [Account linking quickstart](../../identity/player-identity/login/quickstart.md).
