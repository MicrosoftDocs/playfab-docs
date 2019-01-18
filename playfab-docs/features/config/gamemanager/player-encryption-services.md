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

**Player Shared Secrets** is a new type of pseudo-**Secret Key** which is shared amongst game **Clients**, that can be traded with the **API** for the **Title's** public **RSA Key**, and can be used to perform account registration.

**Titles** can have multiple **Player** shared **Keys**, and can set them up and revoke them at will via the **Admin API** calls [Create](xref:titleid.playfabapi.com.admin.authentication.createplayersharedsecret), [Update](xref:titleid.playfabapi.com.admin.authentication.updateplayersharedsecret), [Delete](xref:titleid.playfabapi.com.admin.authentication.deleteplayersharedsecret), [List](xref:titleid.playfabapi.com.admin.authentication.getplayersharedsecrets).

**Player Shared Secrets** should be baked into the respective **Clients**, as there are no **Client APIs** to retrieve them - either authenticated or otherwise.

## Title Public Key

The **Player Shared Secret** is then sent to [GetTitlePublicKey](xref:titleid.playfabapi.com.client.authentication.gettitlepublickey) which - if the **Key** is valid - will return a **Base 64** encoded **RSA CSP** blob byte array that can encrypt 237 bytes of data.

All **APIs** that allow accounts to be created now accept posting registration request as an encrypted payload on the **EncryptedRequest** field.

> [!NOTE]
> The standard fields **TitleId**, **InfoRequestParameters** and **CreateAccount** should *not* be included in the encrypted payload.

## Using Title Public Key to Register

Here is example code to register a **Player** using **LoginWithCustomID** and the **Title Public Key**.

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

A part of the new registration system is a new field called **PlayerSecret**. If set, it allows you to sign request headers that will be validated by the server during **API** calls to all services, including **Login Requests**.

The **Player Secret** can only be set *once* per **User** per **Title** (a **User** with multiple **Titles** in the same **Studio** will need to set the **Player Secret** for each one).

If the **Player Secret** isn't set during registration, it is possible to set it (if it is not already set) by calling [SetPlayerSecret](xref:titleid.playfabapi.com.client.authentication.setplayersecret). There are **Admin** and **Server APIs** that allow setting the **Player Secret** to a *new* value even if it has previously been set.

> [!NOTE]
> Once set, the **Player Secret** should be stored securely on the device, as it is *not* recoverable if lost, and *no* **APIs** exist to recover it.

## Using Player Secret to sign API requests

The following code example constructs a signature header that can be used to sign **API** requests.

The format for the signature header is:

 **jsonRequestModel.utcTimeStampInISO.playerSecret**

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

## Using a Policy Enforcement

[API Policies](https://playfab.com/blog/permission-policies/) can now be used to enforce that either:

- A **Client Request** is an encrypted payload.
- A **Client Request** contains signed headers.

Even *without* using the **Policy Enforcement**, if an encrypted payload is sent (or the headers are sent), they will be validated and an error will occur if they are not properly formed.

To create a **Policy** to require headers on a specific **API**, use a **Deny** statement. This creates a **Policy** requiring headers on *all* calls you can place that *aren't* permitted by the **Allow** statement.

**Policy Statements** have a property called **ApiConditions**. **ApiConditions** contains a property called **HasSignatureOrEncryption** which is an **enum** with three possible values:

- **Any**
- **True**
- **False**

>[!NOTE]
> The default (if it is *not* set by the policy), is **Any**.

The following example **Policy** will allow *all* **API** calls (except un-encrypted or missing header calls) to **LoginWithCustomID**.

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

Because the **Deny** statement is **HasSignatureOrEncryption False**, those **Requests** that *do not match* it will be rejected.

However, **Requests** that *have* signature headers or encryption will be allowed by the **Allow the rest** policy.
