---
title: SDK error handling Best Practices
author: v-thopra
description: Describes how to access, recognize, and handle, API errors using the PlayFab SDK.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, errors, sdk
ms.localizationpriority: medium
---

# SDK error handling Best Practices

This tutorial shows how to access, recognize, and handle **API** errors using the **PlayFab SDK**.

 The practices describes here are equally applicable to the **Admin**, **Server**, and **Client SDKs**, but the patterns depend *highly* on the language of your choice.

Simply put, the pattern of your choice will be valid for any **SDK** (**Admin**/**Server**/**Client**) but implementation details will be specific to *your* programming language and environment.

## Catching and accessing the Error

**PlayFab SDKs** usually report **Errors** by returning an **Error Object**. The following snippet shows how to detect and access the **Error**.

```csharp
PlayFabClientAPI.LoginWithEmailAddress(new LoginWithEmailAddressRequest() {
    Email = "doesnotexist@mail.com",
    Password = "nevercorrect",
}, result => {
    // success
}, error => {
    // 'error' object is our point of access to error data
});
```

Generally, if an **Error Object** is defined (not null), it indicates that an **Error** has occurred. We may then further inspect the **Error**.

## Inspecting the error

The most common way to inspect an **Error** is to recognize the **Error** through the code. As described in the [Global API Method Error Codes](../../config/dev-test-live/global-api-method-error-codes.md) tutorial, each generated **Error** contains human-readable and numeric **Error Codes**. The code on its own is sufficient to recognize and process the **Error** accordingly.

Let's take the [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress) **API** method as an example. As stated in the [documentation](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress) for this method, the following internal **Error** may be thrown upon execution:

- **InvalidTitleId 1004**
- **AccountNotFound 1001**
- **InvalidEmailOrPassword 1142**
- **RequestViewConstraintParamsNotAllowed 1303**

The following method illustrates how to inspect and recognize such **Error**.

```csharp
PlayFabClientAPI.LoginWithEmailAddress(new LoginWithEmailAddressRequest() {
    Email = "doesnotexist@mail.com",
    Password = "nevercorrect",
}, result => {
    // success
}, error => {
    // General purpose logging: GenerateErrorReport gives a bunch of information about the error
    Debug.Log(error.GenerateErrorReport());

    // Recognize and handle the error
    switch (error.Error) {
        case PlayFabErrorCode.InvalidTitleId:
            // Handle invalid title id error
            break;
        case PlayFabErrorCode.AccountNotFound:
            // Handle account not found error
            break;
        case PlayFabErrorCode.InvalidEmailOrPassword:
            // Handle invalid email or password error
            break;
        case PlayFabErrorCode.RequestViewConstraintParamsNotAllowed:
            // Handle not allowed view params error
            break;
        default:
            // Handle unexpected error
            break;
    }
});
```

## Handling the error

Once the **Error** is identified, the handle/recover strategy depends on the **Error** type and nature. **Errors** such as *invalid arguments* will *never* succeed if retried. The request must be fixed for that **API** call to succeed.

There ia a subset of **Errors** where a retry strategy can be applied. *Retry-able* **Error** types are described in the [Global API Method Error Codes](../../config/dev-test-live/global-api-method-error-codes.md) tutorial.

Please make sure to meet the following requirements when applying a retry strategy:

- With each retry, the delay between retries should **increase** exponentially. This *increases* your chances for a successful call, and prevents your game from spamming the **PlayFab** server (which will result in *more* rejected calls).

- You should apply this retry strategy *selectively*, only using it for those codes that are worth retrying.

See our [Global API Method Error Codes](../../config/dev-test-live/global-api-method-error-codes.md) tutorial for a list of codes that are safe to retry.
