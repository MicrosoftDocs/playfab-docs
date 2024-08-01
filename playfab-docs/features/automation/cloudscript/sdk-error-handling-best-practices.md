---
title: SDK error handling Best Practices
author: joannaleecy
description: Describes how to access, recognize, and handle, API errors using the PlayFab SDK.
ms.author: joanlee
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, automation, errors, sdk
ms.localizationpriority: medium
---

# SDK error handling best practices

This tutorial shows how to access, recognize, and handle API errors using the PlayFab SDK.

 The practices described here are equally applicable to the admin, server, and client SDKs - but the patterns depend *highly* on the language of your choice.

Simply put, the pattern of your choice will be valid for any SDK (admin/server/client) but implementation details will be specific to *your* programming language and environment.

## Catching and accessing the error

PlayFab SDKs usually report errors by returning an error object. The following snippet shows how to detect and access the error.

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

Generally, if an error object is defined (not null), it indicates that an error has occurred. We may then further inspect the error.

## Inspecting the error

The most common way to inspect an error is to recognize it through the code. As described in the [Global API Method Error Codes](../../../api-references/global-api-method-error-codes.md), each generated error contains human-readable and numeric error codes.

> [!NOTE]
> The code *on its own* is sufficient to recognize and process the error accordingly.

Let's take the [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress) API method as an example. As stated in the [documentation](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress) for this method, the following internal errors may be thrown upon execution:

- `InvalidTitleId 1004`
- `AccountNotFound 1001`
- `InvalidEmailOrPassword 1142`
- `RequestViewConstraintParamsNotAllowed 1303`

The following method illustrates how to inspect and recognize such an error.

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

Once the error is identified, the handle/recover strategy depends on the error type and nature. Errors such as *invalid arguments* will never succeed if retried. The request must be fixed for that API call to succeed.

There is a sub-set of errors, where a retry strategy can be applied. *Retry-able* error types are described in the [Global API Method Error Codes](../../../api-references/global-api-method-error-codes.md).

Please make sure to meet the following requirements when applying a retry strategy:

- With each retry, the delay between retries should *increase* exponentially. This *increases* your chances for a successful call, and prevents your game from spamming the PlayFab server (which will result in *more* rejected calls).

- You should apply this retry strategy *selectively*, only using it for those codes that are worth retrying.

See our [Global API Method Error Codes](../../../api-references/global-api-method-error-codes.md) tutorial for a list of codes that are safe to retry.
