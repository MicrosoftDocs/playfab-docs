---
title: Handling PlayFab Errors
author: jplafonta
description: Handling errors in the PlayFab Services SDK
ms.author: johlafo
ms.date: 04/14/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, login
ms.localizationpriority: medium
---

# Handling PlayFab Errors

There are several different points where an asynchronous API call in the PlayFab Services SDK call can fail. Handling these errors differs depending on how and when the operation fails.

Like most asynchronous calls in the GDK, PlayFab APIs follow the same general calling pattern:

1. **PF*Async(...)** call, which begins an asynchronous operation.
2. (Optional) **XAsyncGetStatus(...)** call to track the status of the asynchronous operation. Can be used to await completion of the asynchronous operation.
3. **PF*GetResultSize(...)** to retrieve the size in bytes of the result payload.
4. **PF*GetResult(...)** to retrieve the result of the asynchronous operation.

Each of these calls can fail for different reasons. The following sections detail the types of failures most commonly encountered.

## Synchronous failures

A synchronous failure is when the initial **PF*Async** call returns an error. This type of failure is usually indicative of a programming error &mdash; invalid calling pattern, invalide arguments, and so on. These types of errors should be resolved during development. Most other synchronous failures are fatal and can't easily be handled (for example E_OUTOFMEMORY).

## Asynchronous failures

An asynchronous failure is when any of **XAsyncGetStatus**, **PF*GetResultSize**, or **PF*GetResult** fail. The range of asynchronous failures is wider. Besides errors due to invalid arguments, asynchronous failures fall into several categories described in more detail in the following sections.

### Token validation failures

Before initiating a PlayFab service call, the SDK does client side validation to ensure the required authentication token is available and still valid. If this check fails, one of the following errors is returned:

- `E_PF_NOENTITYTOKEN (0x89235411)`:
Indicates that the EntityToken associated with the provided PFEntityHandle has expired. See [Handling Token Expiration](relogin.md) for more information on how to handle this situation.

- `E_PF_NOSECRETKEY (0x89235412)`
Indicates that the provided PFEntityHandle doesn't have an associated SecretKey. Lack of a SecretKey usually means that you've attempted to make a request with an invalid Entity type. APIs that require a SecretKey can only be called by Title Entities. Note that SecretKey APIs are geared towards server or admin scenarios and aren't available in the GDK.

### PlayFab Service failures

If the SDK successfully makes the PlayFab service request, the service may still return an error. There are two broad types of PlayFab Service errors: *global*, which could be returned from any PlayFab API, and *specific*, which are API specific. Following is the complete list of *global* failures:

- `E_PF_API_CLIENT_REQUEST_RATE_LIMIT_EXCEEDED (0x892354dd)`
- `E_PF_API_CONCURRENT_REQUEST_LIMIT_EXCEEDED (0x8923556b)`
- `E_PF_CONCURRENT_EDIT_ERROR (0x8923549b)`
- `E_PF_DATA_UPDATE_RATE_EXCEEDED (0x89235534)`
- `E_PF_DOWNSTREAM_SERVICE_UNAVAILABLE (0x89235495)`
- `E_PF_INVALID_API_ENDPOINT (0x89235499)`
- `E_PF_OVER_LIMIT (0x892354ec)`
- `E_PF_SERVICE_UNAVAILABLE (0x89235491)`
- `E_PF_ACCOUNT_BANNED (0x89235423)`
- `E_PF_ACCOUNT_DELETED (0x89235557)`
- `E_PF_ACCOUNT_NOT_FOUND (0x89235422)`
- `E_PF_API_REQUESTS_DISABLED_FOR_TITLE (0x8923553c)`
- `E_PF_INVALID_CONTENT_TYPE (0x892354a6)`
- `E_PF_INVALID_ENTITY_TYPE (0x8923558a)`:
- `E_PF_INVALID_PARAMS (0x89235421)`
- `E_PF_INVALID_REQUEST (0x89235468)`
- `E_PF_INVALID_TITLE_ID (0x89235425)`
- `E_PF_NOT_AUTHENTICATED (0x8923546b)`
- `E_PF_NOT_AUTHORIZED (0x89235478)`
- `E_PF_NOT_AUTHORIZED_BY_TITLE (0x892354d5)`
- `E_PF_PROFILE_DOES_NOT_EXIST (0x8923553f)`
- `E_PF_TITLE_DELETED (0x89235570)`
- `E_PF_UNKNOWN_ERROR (0x89235448)`

For more information on service failure retry guidance, see [PlayFab Service Global API method error codes](../../api-references/global-api-method-error-codes.md).

#### Throttling failures

One category of service failures is throttling errors, indicated by an HTTP 429 status code. When the PlayFab service returns a throttling error, it means that the client is calling an endpoint too often over a specific time period. When the SDK gets a throttling error, it will automatically retry the request after a small backoff. If the request still doesn't succeed within the configured retry window, the error gets passed along to the title. The SDK retry settings can be configured by calling **PFSetHttpRetrySettings**.

### Network failures

If the underlying network stack returns an error, that error is passed along to the client. A wide range of errors could happen depending on the network failure. Most network errors result in `E_HC_NO_NETWORK (0x89235006)`.

## Additional error details and tracing

In addition to the HRESULT, the PlayFab Service sometimes returns an *errorDetails* string. This string isn't exposed to end clients, but may be useful during development and debugging. To learn how to enable verbose tracing to see the returned *errorDetails* string, see [Tracing guide](tracing.md).".

## Reference

[Error handling in the Microsoft Game Development Kit][/gaming/gdk/_content/gc/system/overviews/error-handling]