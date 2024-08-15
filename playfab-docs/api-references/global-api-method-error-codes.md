---
title: Global API Method Error Codes
author: williacj
description: Lists the global error codes that apply to every PlayFab API method.
ms.author: cjwill
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config, development, testing, errors, error codes
ms.localizationpriority: medium
---

# Global API method error codes

This tutorial lists the global error codes that apply to every PlayFab API method. The following information can be used to decipher API errors.

Each API error contains the following fields:

- **Code** - The HTTP error code returned by the server
- **ErrorCode** - A numerical error code specific to PlayFab.
- **Error** - A human-readable code specific to PlayFab.
- **ErrorMessage** - A description of the error that provides additional context useful for debugging.
- **ErrorDetails** - Not always present. Provides additional context for certain types of errors.

> [!NOTE]
> This page lists the common error codes that you might encounter. If the error code you are looking for is not available on this page, see our more general [http response status code guidance](http-response-status-codes.md).

## Safe to retry codes

It is usually safe to retry requests that fail with these error codes, with an exponential delay back-off. These errors typically mean that your client is making calls too quickly, but the request itself may be valid.

- `APIClientRequestRateLimitExceeded (1199)`:
Indicates too many calls in a short burst.

- `APIConcurrentRequestLimitExceeded (1342)`:
Indicates too many *simultaneous* calls.

- `ConcurrentEditError (1133)`:
Indicates too many *simultaneous* calls or very rapid *sequential* calls.

- `DataUpdateRateExceeded (1287)`:
Indicates too many *simultaneous calls*, or very rapid *sequential* calls.

- `DownstreamServiceUnavailable (1127)`:
Indicates that PlayFab or a third-party service might be having a temporary issue.

- `ServiceUnavailable (1123)`:
Indicates that PlayFab may be having a temporary issue or the client is making too many API calls too quickly. If you do retry this request, is is important to properly use an exponential backoff strategy.

## Never retry codes

If you get these error codes, you should *never* retry, because the request can never be completed under the current circumstances without a bug-fix or setting change.

Most *specific* codes listed with an API method also fall into this category.

- `AccountBanned (1002)`:  
The player account has been banned, all API methods will fail with this error.

- `AccountDeleted (1322)`:
The player account has been deleted, all API methods will fail with this error.

- `AccountNotFound (1001)`:
The player account does not exist, likely because you are not copying a `PlayFabId/TitlePlayerId` correctly. This error will always occur if the identifier is not correct.

- `APIRequestsDisabledForTitle (1295)`:
All API requests have been disabled for this title, and it can no longer be used.

- `InvalidContentType (1144)`:
It should be impossible to get this if you're using one of our SDKs. If you're making your own raw HTTPS calls to PlayFab API methods, your `Content-Type` header must be `application/json`. No other formats are accepted.

- `InvalidEntityType (1373)`:
The entity type in the token used for authentication is not supported by this API.

- `InvalidParams (1000)`:
The API request object sent to PlayFab has invalid parameters and cannot be executed.

- `InvalidRequest (1071)`:
The API request object sent to PlayFab is invalid and cannot be executed.

- `InvalidTitleId (1004)`:
The request provided a TitleId which does *not* match the title provided in the URL of the method. In most SDKs, you should not specify a TitleId for login requests, as it is done for you. In the admin API, explicit TitleIds are a **Dev**->**Test**->**Live** safety feature.

- `NotAuthenticated (1074)`:
The client has tried to call an API that requires `SessionTicket` authentication, without logging in first.

- `NotAuthorized (1089)`:
Incorrect credentials, or otherwise bad inputs related to logging in.

- `NotAuthorizedByTitle (1191)`:
This method has been disabled by the API Policy, and cannot be called.

- `ProfileDoesNotExist (1298)`:
Attempted to access an entity (player, character, title, etc.), which does not exist. Probably a typo, or you've got a bad input somewhere.

- `TitleDeleted (1347)`:
This title has been deleted from PlayFab, and can no longer be used.

- `UnknownError (1039)`:
This typically occurs if bad information is sent to a third-party add-on, and our server experienced an unknown result or error while interacting with external systems. To resolve this, experiment with your inputs, and try to determine if your inputs are invalid in some way. Otherwise, report the error on the forums, with your titleId, the full request JSON (if possible), and the error output. Postman is a useful tool for debugging this situation.

- `InvalidAPIEndpoint (1131)`:
Indicates that the URL for this request is not valid for this title.

- `OverLimit (1214)`:
Indicates that an attempt to perform an operation will cause the service usage to go over the limit as shown in the Game Manager limit pages. Evaluate the returned error details to determine which limit would be exceeded.

## Other notable error codes

These codes *only* occur on specific API methods (listed on the documentation page for those methods), but if you see them, there are important consequences of which you should be aware.

- `APIConcurrentRequestLimitExceeded (1342)`:
Your title is either hitting CloudScript too hard, or is trying to force segment evaluation too frequently (or both). For the former, the two things to examine are:

  1. How often your script calls utilize near-maximum time per call (or worse, time out).
  2. How frequently you're calling CloudScript per player. Calls to get the list of players in a segment would be the key thing to examine (a task targeting a segment also causes re-evaluation, but that should be infrequent).

- `ConnectionTimeout (2)`:
Depending on the specifics of the SDK you're using and the underlying networking stack, it is possible to see errors such as **ConnectionError**, **ConnectionTimeout**, or other errors related to difficulties contacting the PlayFab servers. These all are indicative of networking issues. The most common source is a disconnection on the client side. It is possible to also get these when internet routing between the client and PlayFab's servers are disrupted for some reason. There is very little a game can do to handle these errors. The best response is to let upstream callers or the player know that a connection cannot be established. They could then initiate the operation again later.