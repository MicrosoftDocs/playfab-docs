---
title: Player Encryption Services
author: v-kciril
description: Describes the various types of encryption that are available.
ms.author: v-kciril
ms.date: 01/11/2018
ms.topic: article
ms.prod: gaming
keywords: playfab, game manager
ms.localizationpriority: medium
---

# Player Encryption Services

## Player Shared Secrets

Player Shared Secrets is a new type of pseudo secret key that is shared amongst game clients that can be traded with the API for the title's public RSA key which can be used to perform account registration. Title's can have multiple player shared keys and can set them up and revoke them at will via the admin API calls [Create](xref:titleid.playfabapi.com.admin.authentication.createplayersharedsecret), [Update](xref:titleid.playfabapi.com.admin.authentication.updateplayersharedsecret), [Delete](xref:titleid.playfabapi.com.admin.authentication.deleteplayersharedsecret), [List](xref:titleid.playfabapi.com.admin.authentication.getplayersharedsecrets).

Player shared secrets should be baked into the respective clients as there are no client APIs to retrieve them, either authenticated or otherwise.

## Title Public Key

The Player Shared Secret is then sent to [GetTitlePublicKey](xref:titleid.playfabapi.com.client.authentication.gettitlepublickey) which, if the key is valid, will return a Base 64 encoded RSA CSP blob byte array that can encrypt 237 bytes of data. All APIs that allow accounts to be created now accept posting registration request as an encrypted payload on the EncryptedRequest field. The standard fields TitleId, InfoRequestParameters and CreateAccount should not be included in the encrypted payload.

## Using Title Public Key to Register

Here is example code to register a player using LoginWithCustomID and the Title Public Key.

```csharp
var titleKeyResult = PlayFabClientAPI.GetTitlePublicKey(new GetTitlePublicKeyRequest{ TitleId = "TITLE", TitleSharedSecret = "player shared secret" });

var cspBlob = Convert.FromBase64String(titleKeyResult.RSAPublicKey);

var encryptionModel = JsonConvert.SearializeObject(new LoginWithCustomIDRequest

{
    CustomID = "my player's custom id",
    PlayerSecret = "my player's individual secret"
});

string encryptedPayload;

using (var rsa = new RSACryptoServiceProvider())
{
    rsa.ImportCspBlob(cspBlob);
    var bytesToEncrypt = Encoding.UTF8.GetBytes(encryptionModel);
    var encryptedBytes = rsa.Encrypt(bytesToEncrypt, false);
    encryptedPayload = Convert.ToBase64String(encryptedBytes);
}

var postModel = new LoginWithCustomIDRequest
{
    TitleId = "TITLEID",
    EncryptedRequest = encryptedPayload,
    CreateAccount = True
};

var createAccountResult = PlayFabClientAPI.LoginWithCustomID(postModel);
```

## Player Secret

As part of the new registration scheme is a new field called **PlayerSecret**, which, if set, allows you to sign request headers that will be validated by the server during API calls to all services, including login requests. The Player Secret can only be set once per user per title (that is, a user that is only multiple titles in the same studio will each need to set the Player Secret). If Player Secret isn't set during registration it's possible to set it (if it's not already set) by calling [SetPlayerSecret](xref:titleid.playfabapi.com.client.authentication.setplayersecret). There are Admin and Server APIs that allow setting the Player Secret to a new value even if it has previously been set. Once set the Player Secret should be store securely on the device as it is not recoverable if lost and no APIs exist to recover it.

## Using Player Secret to Sign API Requests

The format for the signature headers is **jsonRequestModel.utcTimeStampInISO.playerSecret**.

```csharp
var postModel = new LoginWithCustomIDRequest

{
    TitleId = "TITLEID",
    CustomID =  "my player's custom id",
    CreateAccount = False
};

string signatureHeader;
string timestampHeader = DateTime.UtcNow.ToString("O");

string playerSecret; // the player secret that was sent during registration.

 using (var hash = new SHA256Managed())
{
    var bytesToHash = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(postModel)+"." + timestampHeader + "." + playerSecret);
    signatureHeader = hash.ComputeHash(bytesToHash);
}

var customHeaders = new Dictionary<string, string>
{
    { "X-PlayFab-Signature", signatureHeader },
    { "X-PlayFab-Timestamp", timestampHeader }
}

var loginResult = PLayFabClientAPI.LoginWithCustomID(postModel, customHeaders);
```

## Using a Policy to Enforce

[API Policies](https://playfab.com/blog/permission-policies/) can now be used to enforce that a client request either is an encrypted payload or that it contains signed headers. Even without using the policy enforcement if an encrypted payload is sent, or the headers are set they will be validated and an error will occur if they are not properly formed.

To create a policy to require headers on a specific API you use a **Deny** statement, to create a policy that requires it on all calls you can place that on the **Allow**.

Policy statements have a new property called **ApiConditions** that has a property called HasSignatureOrEncryptionwhich is an enum that has three possible values: **Any**, **True**, **False**, the default, if it's not set by the policy, is to be Any.

This example policy will allow all API calls except unencrypted or missing header calls to LoginWithCustomID:

```json
{
	"PolicyName": "ApiPolicy",
	"OverwritePolicy": true,
	"Statements":
	[
		{
			"Comment": "Require Headers on LoginWithCustomID",
			"Action": "*",
			"Principal": "*",
			"Effect": "Deny",
			"Resource": "pfrn:api--/Client/LoginWithCustomID",
			"ApiConditions": { "HasSignatureOrEncryption": "False" }
		},
		{
			"Comment": "Allow the rest policy",
			"Action": "*",
			"Principal": "*",
			"Effect": "Allow",
			"Resource": "pfrn:api--*"
		}
	]
}
```

Because the Deny statement is **HasSignatureOrEncryption False** requests that do not match on that will be rejected, but requests that have signature headers or encryption will be allowed by the "Allow the rest policy".
