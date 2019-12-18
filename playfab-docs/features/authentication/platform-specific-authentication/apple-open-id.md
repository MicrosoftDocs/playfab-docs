---
title: "Setup Sign In with Apple for PlayFab"
description: "How to setup Sign In with Apple in PlayFab."
author: DanBehrendt
ms.author: dabe
ms.date: 12/06/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, OpenID, Apple, Auth 2.0
ms.localizationpriority: medium
---

# Setup Sign In with Apple for PlayFab

This guide covers the series of steps needed to setup your PlayFab applications to take advanced of Sign In with Apple.

## Setup your App ID

Before you can use Sign In with Apple in your applications, you'll need to address some setup steps in the [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/) section of Apple's Developer Portal.

1. Sign in to your [Apple Developer Program](https://developer.apple.com/programs/).
1. Select **Member Center** > **Certificates** > **Identifiers & Profiles**.
1. In the left-hand column of the Apple Developer Portal, select **Identifiers**.
1. In the **Identifiers** pane, select the **(+)** add button.
apple-dev-certificates-hub.png

    ![Certificates, Identifiers and Profiles screen](media/apple-dev-certificates-hub.png)

1. Select **App IDs**. If you already have an **App ID**, choose to edit it instead.

    ![Create a new App ID](apple-open-id/register-identifier.png)

1. In the **Register an App ID** pane, enter the following information: 
    1. **Description**: The name of your app, without any special characters.
    1. **Bundle ID**: The Bundle ID should be a reverse DNS style string. For example, `com.playfab.myapp`.
1. Scroll down through the list of capabilities and select **Sign In with Apple**.

    ![Register the App ID](apple-open-id/register-app-id.png)

1. Select **Continue**.
1. On the **Confirm your App ID** page, check the information you’ve provided and then select **Submit**.

## Create a Service ID

1. Return to the **Certificates, Identifiers & Profiles** pane and select the **(+)** add button.
1. Select **Service IDs**.

   The description displays the name of the app the user sees during the login flow. The identifier is the OAuth `client_id`. 

1. Select the **Sign In with Apple** check box.
1. Select **Configure**.

## Web Authentication Configuration

Here you will define the domain your Title is running on and the redirect URLs that are used during the OAuth flow. Make sure your associated App ID is chosen as the Primary App ID. You must use a real domain for the redirect url, localhost isn’t accepted, and an IP will fail later in the flow.

 ![Web Authentication Configuration screen](apple-open-id/web-authentication-configuration.png)

In the configuration panel, select your **Primary App ID**.

Next, choose the **Web Domain** you configured previously.

Finally, add one or more **Return URLs**.  Any `redirect_uri` you use later must be registered here exactly as you use it.  Make sure you include the `http://` or `https://` in the URL when you enter it.

> [!NOTE]
> For testing purposes, you cannot use `127.0.0.1` or `localhost`, but you can use other domains such as `local.test`.  If you choose to do this, you can edit your machine's `hosts` file to resolve this fictitious domain to your local IP address.

Select **Save**, **Continue**, and **Register**. The **Identifier** you entered for your Services ID is your OAuth `client_id`. In this example it is `com.playfab`.

Save your changes when finished.

## Create a key for your Services ID

1. Return to the **Certificates, Identifiers & Profiles** pane and select **Keys** in the left-hand column.
1. In **Key Name**, enter a name to identify the key.
1. Select the **Sign in with Apple** check box and then select **Configure**.

    ![Create a new Key](register-key.png)

1. Ensure that the correct **Primary App ID** is selected and select **Save**.
1. Select **Continue** and then **Register** to create  the key.

> [!IMPORTANT]
> This is the only opportunity that you have to download the key. It can only be downloaded once. 
> 

1. Select **Download** and store the key in a secure location.

![Download Key](media/readme-key-download.png)

Also, take note of your **Key ID** at this step. This will be used for your `KeyId` later on.

The file is a `.p8` key file. The file contents are plain text, To make the file easier to work with, change the name of the file to `key.txt`. If you view the file in a text editor it will look something like:

```
-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGBasGSM49AgGFCCqGSM49AwEHBHkwdwIBAQQg3MX8n6VnQ2WzgEy0
Skoz9uOvatLMKTUIPyPCAejzzUCgCgYIKoZIzj0DAQehRANCAARZ0DoM6QPqpJxP
JKSlWz0AohFhYre10EXPkjrih4jTm+b0AeG2BGuoIWd18i8FimGDgK6IzHHPsEqj
DHF5Svq0
-----END PRIVATE KEY-----
```

## Generate the Client Secret

Apple requires that you create a client secret from your private key. The client secret must be generated using the ES256 JWT algorithm.

One way to generate the client secret is to use the create_secret.py script. You can obtain the script from GitHub at https://github.com/rbrezynski/GenerateJWT-python/blob/master/create_secret.py.

To use the script to generate the client secret:

1. Copy the script to your locale machine and save it in the folder in which your key.txt file is located. 
2. Open the script in a text editor and enter the values provided by Apple for `team_id`, `client_id`, and `key_id`.
    - You will have the `client_id` from the previous step.
    - `team_id` is displayed in the top right corner of the screen of your developer account.
    - Use the `key_id` from the previous step.
3. Save the updates.
4. From the command line, run the script:

    python create_secret.py

> [!Note]
> The client secret expires in six months. This is maximum lifetime that Apple allows.
>

## Set up Open ID Connect In PlayFab Game Manager

To configure Open ID Connect In PlayFab Game Manager:

1. Log in to the [PlayFab Game Manger](https://api.playfab.com).
2. Select your Title.
3. It the upper left corner, next to the name of your title, select the gear icon.
4. From the drop-down menu, select **Title Settings**.
5. Select the **OpenID Connect** tab.
6. Select **New Connection**.
7. On the New Connection pane, enter your **Connection ID**, **Client ID**, **Client secret**, and **Issuer**.
    - Connection ID: Your Apple client-id
    - Client ID: Your Apple Bundle ID
    - Client secret: Your client secret
    - Issuer: Must be https://appleid.apple.com
