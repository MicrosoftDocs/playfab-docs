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

# Global API Method Error Codes

This tutorial lists the **Global Error Codes** that apply to every **PlayFab API** method. The following information can be used to decipher **API Errors**. Each **API Error** contains the following fields:

- **Error** - A human-readable code for the **Error**.
- **ErrorCode** - A numerical code for the **Error**.

## Safe-to-Retry Codes

It is usually safe to retry **Requests** that fail with these **Error Codes**, with an exponential delay back-off. These **Errors** typically mean that your **Client** is making calls too quickly, but the **Request** itself may be valid.

- **APIClientRequestRateLimitExceeded (1199)**
**Client** is making too many **API** calls too quickly. Usually too many calls in a short burst.

- **APIConcurrentRequestLimitExceeded (1342)**
**Client** is making too many **API** calls too quickly. Usually *simultaneous* calls, or too many calls in a short burst.

- **ConcurrentEditError (1133)**
**Client** is making too many **API** calls too quickly. Usually caused by *multiple simultaneous* calls, or very rapid *sequential* calls.

- **DataUpdateRateExceeded (1287)**
**Client** is making too many **API** calls too quickly. Usually caused by *multiple simultaneous calls*, or very rapid *sequential* calls.

- **DownstreamServiceUnavailable (1127)**
**PlayFab** may be having a temporary issue, or **Client** is making too many **API** calls too quickly.

- **InvalidAPIEndpoint (1131)**
**PlayFab** or **Amazon Web Services (AWS)** may be having a temporary issue.

- **OverLimit (1214)**
**Client** is making too many **API** calls too quickly, usually on a specific **API** method.

## Never-Retry Codes

If you get these **Error Codes**, you should never retry, because the request can never be completed under the current circumstances, without a bug-fix or setting change.

Most *specific* codes listed with an **API** method also fall into this category.

- **AccountBanned (1002)**
**Player Account** has been **Banned**, all **API** methods will fail with this **Error**.

- **AccountDeleted (1322)**
**Player Account** has been **Deleted**, all **API** methods will fail with this **Error**.

- **AccountNotFound (1001)**
**Player Account** does not exist, likely because you are not copying a **PlayFabId/TitlePlayerId** correctly. This **Error** will always occur if the identifier is not correct.

- **APIRequestsDisabledForTitle (1295)**
All **API** requests have been disabled for this **Title**, and it can no longer be used.

- **InvalidContentType (1144)**
It should be impossible to get this if you're using one of our **SDKs**. If you're making your own raw **HTTPS** calls to **PlayFab API** methods, your **Content-Type** header must be **application/json**. No other formats are accepted.

- **InvalidParams (1000)**
The **API** request object sent to **PlayFab** has invalid parameters and cannot be executed.

- **InvalidRequest (1071)**
The **API** request object sent to **PlayFab** is invalid and cannot be executed.

- **InvalidTitleId (1004)**
The **Request** provided a **TitleId** which does *not* match the **Title** provided in the **URL** of the method. In most **SDKs**, you should not specify a **TitleId** for login requests, as it is done for you. In the **Admin API**, explicit **TitleIds** are a **Dev**->**Test**->**Live** safety feature.

 - **NotAuthenticated (1074)**
**Client** has tried to call an **API** that requires **SessionTicket** authentication, without logging in first.

- **NotAuthorized (1089)**
Incorrect **Credentials**, or otherwise bad inputs related to logging in.

- **NotAuthorizedByTitle (1191)**
This method has been disabled by the **API Policy**, and cannot be called.

- **ProfileDoesNotExist (1298)**
Attempted to access an entity (**Player**, **Character**, **Title**, etc.), which does not exist. Probably a typo, or you've got a bad input somewhere.

- **TitleDeleted (1347)**
This **Title** has been deleted from **PlayFab**, and can no longer be used.

- **UnknownError (1039)**
**UnknownError** typically occurs if bad information is sent to a third-party add-on, and our server experienced an unknown **Result** or **Error** while interacting with external systems. To resolve this, experiment with your inputs, and try to determine if your inputs are invalid in some way. Otherwise, report the **Error** on the forums, with your **titleId**, the full request **JSON** (if possible), and the error output. **Postman** is a useful tool for debugging this situation.

## Other Notable Error Codes

These codes *only* occur on specific **API** methods (listed on the documentation page for those methods), but if you see them, there are important consequences of which you should be aware.

- **APIConcurrentRequestLimitExceeded (1342)**
Your **Title** is either hitting **CloudScript** too hard, or is trying to force segment evaluation too frequently (or both). For the former, the two things to look at are:

  1. How *often* your script calls utilize near-maximum time per call (or worse, time out).
  2. How frequently you're calling **CloudScript** per **Player**. For the latter, calls to get the list of **Players** in a **Segment** would be the key thing to look at (a task targeting a **Segment** also causes re-evaluation, but that should be infrequent).
