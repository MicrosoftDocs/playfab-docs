---
title: Global API Method Error Codes
author: v-thopra
description: Lists the global error codes that apply to every PlayFab API method.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, development, testing, errors, error codes
ms.localizationpriority: medium
---

# Global API method error codes

This tutorial lists the global error codes that apply to every PlayFab API method. The following information can be used to decipher API errors.

Each API error contains the following fields:

- **Error** - A human-readable code for the error.
- **ErrorCode** - A numerical code for the error.

## Safe to retry codes

It is usually safe to retry requests that fail with these error codes, with an exponential delay back-off. These errors typically mean that your client is making calls too quickly, but the request itself may be valid.

- `APIClientRequestRateLimitExceeded (1199)`:
The client is making too many API calls too quickly. Usually too many calls in a short burst.

- `APIConcurrentRequestLimitExceeded (1342)`:
The client is making too many API calls too quickly. Usually *simultaneous* calls, or too many calls in a short burst.

- `ConcurrentEditError (1133)`:
The client is making too many API calls too quickly. Usually caused by *multiple simultaneous* calls, or very rapid *sequential* calls.

- `DataUpdateRateExceeded (1287)`:
The client is making too many API calls too quickly. Usually caused by *multiple simultaneous calls*, or very rapid *sequential* calls.

- `DownstreamServiceUnavailable (1127)`:
PlayFab may be having a temporary issue, or the client is making too many API calls too quickly.

- `InvalidAPIEndpoint (1131)`:
PlayFab or Amazon Web Services (AWS) may be having a temporary issue.

- `OverLimit (1214)`:
The client is making too many API calls too quickly, usually on a specific API method.

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

## Other notable error codes

These codes *only* occur on specific API methods (listed on the documentation page for those methods), but if you see them, there are important consequences of which you should be aware.

- `APIConcurrentRequestLimitExceeded (1342)`:
Your title is either hitting CloudScript too hard, or is trying to force segment evaluation too frequently (or both). For the former, the two things to examine are:

  1. How often your script calls utilize near-maximum time per call (or worse, time out).
  2. How frequently you're calling CloudScript per player. Calls to get the list of players in a segment would be the key thing to examine (a task targeting a segment also causes re-evaluation, but that should be infrequent).
