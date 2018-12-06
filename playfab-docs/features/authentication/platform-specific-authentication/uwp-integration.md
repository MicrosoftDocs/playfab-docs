---
title: Integrating the Universal Windows Platform with PlayFab
author: v-thopra
description: Takes you through three key points of integration between PlayFab and the Universal Windows Platform (UWP).
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, authentication, integration, uwp
ms.localizationpriority: medium
---

# Integrating the Universal Windows Platform with PlayFab

This tutorial takes you through three key points of integration between **PlayFab** and the **Universal Windows Platform (UWP)**.

> [!NOTE]
> We have created a [GitHub repository](https://github.com/PlayFab/UWPExample) with sample code to illustrate how to integrate **Universal Windows Platform** with **PlayFab**.

Integrating the **Universal Windows Platform** (**UWP**) with **PlayFab** is very straightforward. There are really only three things you need to worry about:

1. Linking a **Windows Hello** account to your **PlayFab** account.
2. Logging in the player via **Windows Hello**.
3. Validating a **Purchase** made from the **Windows** store.

Let's take these three topics in order.

## Linking a Windows Hello account to your PlayFab account

There are two ways you can link a **Windows Hello** account to your **PlayFab** account:

1. You can create a new **PlayFab** account using your **Windows Hello** credentials.
2. You can link **Windows Hello** credentials to your existing **PlayFab** account.

Which one to use depends on whether or not **Windows Hello** is your primary authentication.

### Creating a new account with Windows credentials

Before you can begin this process, you need ask the user for their **username** under **Windows**.

Then you can follow these steps:

1. Call [KeyCredentialManager.RequestCreateAsync](https://docs.microsoft.com/en-us/uwp/api/windows.security.credentials.keycredentialmanager) to generate a new **Public Key** for this user.
2. Call [CryptographicBuffer.EncodeToBase64String](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Cryptography.CryptographicBuffer#Windows_Security_Cryptography_CryptographicBuffer_EncodeToBase64String_Windows_Storage_Streams_IBuffer_) to convert the **IBuffer** from above to a string.
3. Call [PlayFabClientAPI.RegisterWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.registerwithwindowshello) with the following required parameters:  
    1. The **Windows username**.
    2. The base 64 encoded **Public Key** from above.
4. Assuming **Register** was successful, the **Player** will now be logged in. You will get back a **Session Token** that you can use to authenticate the **Player** with all other **PlayFab APIs**.
5. Also, you can now use [HashAlgorithmProvider.OpenAlgorithm(HashAlgorithmNames.Sha256)](https://docs.microsoft.com/en-us/uwp/api/windows.security.cryptography.core.hashalgorithmprovider#Windows_Security_Cryptography_Core_HashAlgorithmProvider_OpenAlgorithm_System_String_) to create a hash provider and hash the **Public Key** by calling [hashProvider.HashData(publicKey)](https://docs.microsoft.com/en-us/uwp/api/windows.security.cryptography.core.hashalgorithmprovider#Windows_Security_Cryptography_Core_HashAlgorithmProvider_HashData_Windows_Storage_Streams_IBuffer_).
6. Convert the hashed **Public Key** to a base-64 encoded string [(CryptographicBuffer.EncodeToBase64String(publicKeyHash))](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Cryptography.CryptographicBuffer#Windows_Security_Cryptography_CryptographicBuffer_EncodeToBase64String_Windows_Storage_Streams_IBuffer_) and store this string and the **username** in the **Application** settings (**ApplicationData.Current.LocalSettings.Values["publicKeyHint"]**). This **Public Key** hint is used to log back in.
7. The **username** should also be stored in the user's local settings as well for simpler login.

### Linking Windows credentials to an existing PlayFab account

The process for linking **Windows** credentials to an existing **PlayFab** account is very similar. The differences are:

- First, you must already be logged into a **PlayFab** account. Typically this is done anonymously, using an insecure **Device ID**.
- Then, follow the steps in the previous section, but use [LinkWindowsHello](xref:titleid.playfabapi.com.client.accountmanagement.linkwindowshello) instead of **RegisterWithWindowsHello**.
- Now the user can log in with **Windows** credentials in the future and access or recover their **PlayFab** account.

## Logging in the Player via Windows Hello

Once you have linked **Windows Hello** credentials to a **PlayFab** account, you can login with those credentials. You will need the **Public Key** hint, and the **Windows username**.

Follow these steps:

1. Call [PlayFabClientAPI.GetWindowsHelloChallengeAsync](xref:titleid.playfabapi.com.client.authentication.getwindowshellochallenge) to create a signing challenge.
2. Call [CryptographicBuffer.DecodeFromBase64String](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Cryptography.CryptographicBuffer#Windows_Security_Cryptography_CryptographicBuffer_DecodeFromBase64String_System_String_) to create an **IBuffer** for the **KeyCredentialManager** to have the user sign.
3. Call **var retrieveResult = await** [KeyCredentialManager.OpenAsync(userId)](https://docs.microsoft.com/en-us/uwp/api/windows.security.credentials.keycredentialmanager#Windows_Security_Credentials_KeyCredentialManager_OpenAsync_System_String_) to create a **Key** signing service.
4. Get the credential for this user: **var userCredential = retrieveResult.Credential**
5. Call await [userCredential.RequestSignAsync(challengeBuffer)](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Credentials.KeyCredential#Windows_Security_Credentials_KeyCredential_RequestSignAsync_Windows_Storage_Streams_IBuffer_) to have **Windows** request that the user sign the server's challenge for this user.
6. Finally, call [PlayFabClientAPI.LoginWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.loginwithwindowshello) to complete the process and login the **Player**.
7. Assuming that the login was successful, the **Player** is now logged in. You will get back a **Session Token** that you can use to authenticate the **Player** with all other **PlayFab APIs**.

## Making a purchase via Windows Store

Making a purchase via the **Windows Store** is similar to the purchase process via **iOS** or **Android**. There are two stages:

1. Setting up the store initially.
2. Making the purchase.

### Setting up the store

**Microsoft** has published several documents describing this process. For example:

[Setting up the in-app purchase in the Windows Store](https://docs.microsoft.com/en-us/windows/uwp/publish/add-on-submissions)

>[!NOTE]
> You must also be sure to set up a *matching item* in the **PlayFab** catalog, with the same **Product ID**.

### Making the Purchase

Once you have set up the **Items** in the **Store**, you can enable the **in-app Purchase** in your **App**.

1. Make the **Purchase** in the **Application**, and be sure to request a **Receipt**. To see an example of this activity, this document explains the process: [making in-app Purchases with UWP](https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.store.currentapp#Windows_ApplicationModel_Store_CurrentApp_RequestProductPurchaseAsync_System_String_System_Boolean_).
2. You will receive a **Receipt**. You can find [more information on Receipts here](https://docs.microsoft.com/en-us/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
3. Call [PlayFabClientAPI.ValidateWindowsStoreReceipt](xref:titleid.playfabapi.com.client.platformspecificmethods.validatewindowsstorereceipt) to validate the **Receipt**. This will automatically credit the **Player's** inventory in **PlayFab** with the item they just purchased.

## More Questions?

If you have further questions, please post in our [forums](https://community.playfab.com/index.html). 

We'd also love to hear from you with any feedback on integrating your game with the Universal Windows Platform!