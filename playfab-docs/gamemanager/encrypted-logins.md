---
title: Encrypted Logins
author: williacj
description: Shows you how to enable encryption for your client.
ms.author: cjwill
ms.date: 02/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config, game manager, encrypted login
ms.localizationpriority: medium
---

# Encrypted logins

PlayFab allows you to reinforce application security by protecting certain client API calls with custom encryption. This tutorial shows you how to enable encryption for your client.

The method we will be using allows you to protect *any* login API call. Since the process is *always* similar, we only show how to protect *one* particular method, `LoginWithCustomID`.

> [!IMPORTANT]
> Login encryption is meant to be used for *all* players after title creation, or not at all. This is *not* a feature that can be enabled at a later date. You must use it from the *very beginning* or not at all. In particular, *encrypted* players will never be able to log in *un-encrypted*, and *non-encrypted* players will never be able to become *encrypted* players.

In this guide we will:

1. Create a player-shared secret.
2. Introduce an API Policy rule to enable protection on a certain method.
3. Change the client to use a player-shared key to retrieve the public title key and encrypt the payload.

> [!NOTE]
> PlayFab makes the following disclaimer: "All of our API calls are already safely encrypted to modern standards, and the standard API call encryption is everything most customers will need. This feature represents an *additional* layer of security built around making it harder for players to use an unauthorized client. It is *not* foolproof - it merely increases the difficulty bar for hackers. For most developers, the mild security increase will not be worth the extra effort required."

## Creating a player-shared secret

The PlayFab Admin API exposes a method to manage your player-shared secrets.

> [!NOTE]
> Creating a new shared secret by a certain name will override the existing key with the same name, if any. In addition, you may have *several* shared secrets registered under different names.

Run the following code to add a player-shared secret to your title.

```csharp
PlayFabSettings.staticSettings.DeveloperSecretKey = "__DEVELOPER_KEY__";
PlayFabSettings.staticSettings.TitleId = "__TITLE_ID__";
var response = await PlayFabAdminAPI.CreatePlayerSharedSecretAsync(new CreatePlayerSharedSecretRequest()
{
    FriendlyName = "__KEY_NAME__"
});

if (response.Error != null)
{
    Console.WriteLine(response.Error.GenerateErrorReport());
}
else
{
    Console.WriteLine(response.Result.SecretKey);
}
```

To run this code, you need a developer secret key. For more information about secret keys, see [Secret key management](secret-key-management.md).

This application should print a newly created player-shared secret. *Make sure to save it*. If it is lost, you will have to generate a new secret by running the application again.

The secret looks like this:

`QC953WQ3TU6ZJTZMAT1FNJQIKR92FPUQTISW4Q6WD8SY841MQQ`

## Updating the policy

We have a new shared secret created. Now we need to tell PlayFab which API calls to protect.

Run the code shown below to protect the `LoginWithCustomId` API call, and *unprotect* the rest of the API calls.

```csharp
// Set development key and title id
PlayFabSettings.DeveloperSecretKey = "__DEVELOPER_KEY__";
PlayFabSettings.TitleId = "__TITLE_ID__";

public static async Task SetApiPermission(bool restrictCustomId)
{
    // The first statement denies every call to LoginWithCustomID that is not properly encrypted
    var filterCustom = new PermissionStatement
    {
        // Statement effects any action
        Action = "*",
        // Filter the case where there is no signature and payload is not encrypted
        ApiConditions = new ApiCondition()
        {
            HasSignatureOrEncryption = Conditionals.False
        },
        Comment = "Deny every request to LoginWithCustomID that is not properly encrypted",
        // Specify the resource name
        Resource = "pfrn:api--/Client/LoginWithCustomID", // Resource name
        // Deny any of such requests
        Effect = EffectType.Deny,
        // For any user
        Principal = "*"
    };
    // The second statement allows every other API call
    var filterNothing = new PermissionStatement()
    {
        // Statement effects any action
        Action = "*",
        Comment = "Allow the rest API calls",
        // For any resource name
        Resource = "pfrn:api--*",
        // Allow any request
        Effect = EffectType.Allow,
        // For any user
        Principal = "*"
    };

    // Update the policy
    var request = new UpdatePolicyRequest()
    {
        // ApiPolicy controls access to API methods
        PolicyName = "ApiPolicy",
        // In this example we overwrite the policy. Consider appending to the existing policy instead.
        OverwritePolicy = true,
        // Introduce policy statements
        Statements = new List<PermissionStatement> { filterNothing }
    };
    if (restrictCustomId)
        request.Statements.Add(filterCustom);
    var result = await PlayFabAdminAPI.UpdatePolicyAsync(request);

    // Handle possible errors
    if (result.Error != null)
        Console.WriteLine(result.Error.GenerateErrorReport());
    else
        Console.WriteLine("Policy updated");
}
```

## Setting up the client

Now when the policy is updated, you are no longer able to just call `LoginWithCustomID` API. Consider the code shown below.

```csharp
var result = await PlayFabClientAPI.LoginWithCustomIDAsync(new LoginWithCustomIDRequest()
{
    CreateAccount = true,
    CustomId = "Some_Custom_Id"
});

if (result.Error != null)
{
    Console.WriteLine(result.Error.GenerateErrorReport());
}
else
{
    Console.WriteLine(result.Result.PlayFabId);
}
```

Normally, this would log in the user without a problem. However, *now* this API call is *protected* - and the code will yield a `Not Authorized` error (not to be confused with `Not Authenticated`).

We need to modify the client to properly encrypt the call payload. This is done in 2 steps:

1. Use the player-shared secret to fetch the title public key.
2. Use the title public key to encrypt the payload.

The code shown below illustrates this.

```csharp
public static async Task DoEncryptedLogin()
{
    Console.WriteLine("Begin DoEncryptedLogin");

    // Use Player Shared Secret to get Title Public Key
    var titleKeyResult = await PlayFabClientAPI.GetTitlePublicKeyAsync(new GetTitlePublicKeyRequest
    {
        TitleId = TITLE_ID,
        TitleSharedSecret = CLIENT_SECRET_KEY
    });

    Console.WriteLine("Encrypt request");
    // Convert public key to bytes
    var cspBlob = Convert.FromBase64String(titleKeyResult.Result.RSAPublicKey);

    // Serialize certain part of the model into string (this will be encrypted).
    var encryptionModel = JsonWrapper.SerializeObject(new LoginWithCustomIDRequest { CustomId = "SOME_PLAYER_ID_ENCRYPTED" });
    string encryptedPayload;

    // RSA encryption
    using (var rsa = new RSACryptoServiceProvider())
    {
        rsa.ImportCspBlob(cspBlob);
        var bytesToEncrypt = Encoding.UTF8.GetBytes(encryptionModel);
        var encryptedBytes = rsa.Encrypt(bytesToEncrypt, false);
        encryptedPayload = Convert.ToBase64String(encryptedBytes);
    }

    // Use encrypted payload to construct a model
    var model = new LoginWithCustomIDRequest
    {
        EncryptedRequest = encryptedPayload,
        PlayerSecret = CLIENT_SECRET_KEY,
        CreateAccount = true
    };

    Console.WriteLine("Call LoginWithCustomIDAsync");
    // Finally execute the call
    var result = await PlayFabClientAPI.LoginWithCustomIDAsync(model);
    Console.WriteLine("LoginWithCustomIDAsync done");
    bool successful = result.Error == null && result.Result != null;
    if (!successful)
        Console.WriteLine(result.Error.GenerateErrorReport());
    else
        Console.WriteLine("Login Successful" + result.Result.PlayFabId);
}
```

Once you run the code, you should be able to log in. Keep in mind that once a player-shared secret is created, it must be hard coded into your client code, as there is *no way* to fetch or request it by using any API call.
