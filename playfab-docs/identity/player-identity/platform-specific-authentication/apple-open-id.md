---
title: "Set up Sign In with Apple for PlayFab"
description: "How to set up Sign In with Apple in PlayFab."
author: antnguyen89
ms.author: antnguyen
ms.date: 08/09/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, OpenID, Apple, Auth 2.0
ms.localizationpriority: medium
---

# Set up Sign In with Apple for PlayFab

This guide covers the series of steps needed to set up your PlayFab applications to take advantage of Sign in with Apple.

## Set up your Application Identifier

Before you can use Sign in with Apple in your applications, you'll need to address some setup steps in the [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/certificates/list) section of Apple's developer portal.

1. Sign in to your [Apple Developer Program](https://developer.apple.com/programs/) account.
2. Select **Certificates, Identifiers & Profiles**.
3. In the **Identifiers** pane, select your Application Identifier, or select **(+)** to create a new identifier.
    > [!NOTE]
    > If you are creating a new identifier, select **App IDs** as the new identifier type.

4. Scroll through the list of capabilities and select **Sign in with Apple**.
5. Press **Continue** or **Save** on the **Sign in with Apple** setup popup.
6. Ensure you fully create and update your application identifier.

Save the identifier where you can access it easily. You'll use in the next set of steps.

> [!IMPORTANT]
> PlayFab only supports Sign in with Apple from IoS or MacOS Titles.

## Set up the Apple Add-on in PlayFab

To set up the Apple Add-on in PlayFab:

1. Sign in to [Game Manager](https://developer.playfab.com/en-US/login).
2. Select your title from the My Studios and Titles page.
3. In the **Add-ons** pane, select the **Apple** platform.
4. To install the Apple add-on, select **Install Apple**.
5. Set the **iOS App Bundle ID** to the App ID that you retrieved in the previous section.

   > [!NOTE]
   > At this point, you need to choose whether to ignore the expiration date for identity tokens.

   Your options are:

   - Ignore expiration dates: This provides a less secure, but better user experience. However, if Apple rotates the signing key, then expired identity tokens can no longer be validated. In this case, users have to sign in to provide a fresh identity token.
   - Honor expiration dates: This provides a more secure experience at the expense of potentially causing the user sign in multiple times. Apple identity tokens currently expire after 10 minutes after which your Title must require the user to sign in again to obtain a new one.

6. Set the **Ignore expiration date for identity tokens** as appropriate for your chosen user experience.

   > [!TIP]
   > If you choose to ignore the expiration date for identity tokens, your Title should store the identity token that it obtains from Apple locally. The identity token will be reused to log in each time.
