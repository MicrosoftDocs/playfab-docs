# Integrating the Universal Windows Platform with PlayFab

This tutorial takes you through three key points of integration between PlayFab and the Universal Windows Platform (UWP).

> [!NOTE]
> We have created a [GitHub repository](https://github.com/PlayFab/UWPExample) with sample code to illustrate how to integrate Universal Windows Platform with PlayFab.

Integrating the Universal Windows Platform (UWP) with PlayFab is very straightforward. There are really only three things you need to worry about:

- Linking a Windows Hello account to your PlayFab account
- Logging in the player via Windows Hello
- Validating a purchase made from the Windows Store

Let's take these three topics in order.

## Linking a Windows Hello account to your PlayFab account

There are two ways you can link a Windows Hello account to your PlayFab account. You can either create a new PlayFab account using your Windows Hello credentials, or you can link Windows Hello credentials to your existing PlayFab account. Which one to use depends on whether Windows Hello is your primary authentication, or not.

### Creating a new account with Windows credentials

Before you can begin this process, you need ask the user for their username under Windows.

Then you can follow these steps:

1. Call [KeyCredentialManager.RequestCreateAsync](https://docs.microsoft.com/en-us/uwp/api/windows.security.credentials.keycredentialmanager) to generate a new public key for this user.
2. Call [CryptographicBuffer.EncodeToBase64String](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Cryptography.CryptographicBuffer#Windows_Security_Cryptography_CryptographicBuffer_EncodeToBase64String_Windows_Storage_Streams_IBuffer_) to convert the IBuffer from above to a string.
3. Call [PlayFabClientAPI.RegisterWithWindowsHello](https://api.playfab.com/documentation/client/method/RegisterWithWindowsHello) with the following required parameters:  
    1. The Windows username
    2. The base 64 encoded public key from above
4. Assuming Register was successful, the player will now be logged in. You will get back a session token that you can use to authenticate the player with all other PlayFab APIs.
5. Also, you can now use [HashAlgorithmProvider.OpenAlgorithm(HashAlgorithmNames.Sha256)](https://docs.microsoft.com/en-us/uwp/api/windows.security.cryptography.core.hashalgorithmprovider#Windows_Security_Cryptography_Core_HashAlgorithmProvider_OpenAlgorithm_System_String_) to create a hash provider and hash the public key by calling [hashProvider.HashData(publicKey)](https://docs.microsoft.com/en-us/uwp/api/windows.security.cryptography.core.hashalgorithmprovider#Windows_Security_Cryptography_Core_HashAlgorithmProvider_HashData_Windows_Storage_Streams_IBuffer_).
6. Convert the hashed public key to a base 64 encoded string [(CryptographicBuffer.EncodeToBase64String(publicKeyHash))](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Cryptography.CryptographicBuffer#Windows_Security_Cryptography_CryptographicBuffer_EncodeToBase64String_Windows_Storage_Streams_IBuffer_) and store this string and the username in the application settings (ApplicationData.Current.LocalSettings.Values["publicKeyHint"]). This public key hint is used to log back in.
7. The username should also be stored in the user's local settings as well for simpler login.

### Linking Windows credentials to an existing PlayFab account

The process for linking Windows credentials to an existing PlayFab account is very similar. The differences are:

1. First, you must already be logged into a PlayFab account. Typically this is done anonymously, using an insecure, device ID.
2. Then, follow the steps in the previous section, but use [LinkWindowsHello](https://api.playfab.com/documentation/client/method/LinkWindowsHello) instead of RegisterWithWindowsHello.
3. Now the user can login with Windows credentials in the future and access or recover their PlayFab account.

## Logging in the player via Windows Hello

Once you have linked Windows Hello credentials to a PlayFab account, you can login with those credentials. You will need the public key hint, and the Windows username.

Follow these steps:

1. Call [PlayFabClientAPI.GetWindowsHelloChallengeAsync](https://api.playfab.com/documentation/client/method/GetWindowsHelloChallenge) to create a signing challenge.
2. Call [CryptographicBuffer.DecodeFromBase64String](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Cryptography.CryptographicBuffer#Windows_Security_Cryptography_CryptographicBuffer_DecodeFromBase64String_System_String_) to create an IBuffer for the KeyCredentialManager to have the user sign.
3. Call var retrieveResult = await [KeyCredentialManager.OpenAsync(userId)](https://docs.microsoft.com/en-us/uwp/api/windows.security.credentials.keycredentialmanager#Windows_Security_Credentials_KeyCredentialManager_OpenAsync_System_String_) to create a key signing service.
4. Get the credential for this user: var userCredential = retrieveResult.Credential
5. Call await [userCredential.RequestSignAsync(challengeBuffer)](https://docs.microsoft.com/en-us/uwp/api/Windows.Security.Credentials.KeyCredential#Windows_Security_Credentials_KeyCredential_RequestSignAsync_Windows_Storage_Streams_IBuffer_) to have Windows request that the user sign the server's challenge for this user.
6. Finally, call [PlayFabClientAPI.LoginWithWindowsHello](https://api.playfab.com/documentation/client/method/LoginWithWindowsHello) to complete the process and login the player.
7. Assuming Login was successful, the player is now logged in. You will get back a session token that you can use to authenticate the player with all other PlayFab APIs.

## Making a purchase via Windows Store

Making a purchase via Windows Store is similar to the purchase process via iOS or Android. There are two stages: setting up the store in the first place, then making the purchase.

### Setting up the store

Microsoft has published several documents describing this process. For example:

[Setting up the in-app purchase in the Windows Store](https://docs.microsoft.com/en-us/windows/uwp/publish/add-on-submissions)

You must also be sure to set up a matching item in the PlayFab catalog, with the same product ID.

### Making the purchase

Once you have set up the items in the store, you can enable the in-app purchase in your app.

1. Make the purchase in the application, and be sure to request a receipt. For example this document explains the process: [making in-app purchases with UWP](https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.store.currentapp#Windows_ApplicationModel_Store_CurrentApp_RequestProductPurchaseAsync_System_String_System_Boolean_).
2. You will get back a receipt. You can find [more information on receipts here](https://docs.microsoft.com/en-us/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
3. Call [PlayFabClientAPI.ValidateWindowsStoreReceipt](https://api.playfab.com/documentation/client/method/ValidateWindowsStoreReceipt) to validate the receipt. This will automatically credit the player's inventory in PlayFab with the item they just purchased.

## More Questions?

If you have further questions, please post in our [forums](https://community.playfab.com/index.html). We'd also love to hear from you with any feedback on integrating your game with the Universal Windows Platform!