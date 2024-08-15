---
title: Making Webhook calls from CloudScript
author: joannaleecy
description: Describes how to make Webhook calls from CloudScript, for both nonsecure and secure scenarios.
ms.author: joanlee
ms.date: 02/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, automation, cloudscript
ms.localizationpriority: medium
---

# Making Webhook calls from CloudScript

One of the less well-known features of CloudScript is that you can make Webhook calls from it to any web API endpoint, using standard Representational State Transfer (REST) calls.

> [!NOTE]
> We recommend you make webhook calls using the newer [CloudScript Functions](../cloudscript-af/index.md) when possible.


This allows titles to make calls to basic informational services, but it *also* enables more complex scenarios (such as using OAuth), to secure a communication to an endpoint you own.

This tutorial discusses making Webhook calls from CloudScript, for both *nonsecure* and *secure* scenarios.

As a REST call, the structure of a Webhook call from CloudScript is simple. The elements to be specified are:

- The URL endpoint.
- The REST method (post, get, put, or delete).
- Any headers required.
- The content type (most commonly application/JSON).
- The content itself (body).

For example, a basic web API call to get the version number of your server-side logic might look something like the example provided below.

```javascript
// CloudScript
var url = "http://api.yoursite.com/playfab_call/GetVersion";
var method = "post";
var contentBody = "";
var contentType = "application/json";
var headers = {};
var responseString =  http.request(url,method,contentBody,contentType,headers);
```

The body of the response is returned in stringified form, so that you can subsequently use it in the rest of the script.

In this case, since we were querying version, you might write the response out to the `log` like the one provided here.

```javascript
// CloudScript
log.info(responseString);
```

The response back to the client at the end of running the CloudScript might look like this example provided below.

```json
//HTTP Response
{
    "code": 200,
    "status": "OK",
    "data":
    {
        "FunctionName": "MyScript",
        "Revision": 23,
        "FunctionResult": true,
        "Logs": [
        {
            "Level": "Info",
            "Message": "{\"version\": 3}"
        }],
        "ExecutionTimeSeconds": 0.4309841,
        "MemoryConsumedBytes": 29608,
        "APIRequestsIssued": 0,
        "HttpRequestsIssued": 1
    }
}
```

If, however, you have a *secure* service you need to communicate with, you'll *first* need to exchange credentials with that service to establish identity.

For an OAuth solution, that means requesting a Bearer Access token, using your client ID and secret. This varies based upon your specific OAuth implementation, but your call could look something like the following example.

```javascript
//CloudScript
var url = "https://api.yoursite.com/playfab_call/request_token";
var method = "post";
var contentBody = "grant_type=client_credentials";
var contentType = "application/x-www-form-urlencoded";
var headers = {};
headers["client_id"] = clientId;
headers["client_secret"] = clientSecret;

var tokenResponse =  http.request(url,method,contentBody,contentType,headers);
```

Given a good response, you would *then* be able to parse the `bearer_access_token` from the response like this (again, this *does depend* upon the specifics of your OAuth implementation, but this is a fairly common pattern for this form of authentication).

```javascript
//CloudScript
var parsedData = JSON.parse(tokenResponse);
var bearer_access_token = parsedData["access_token"];
```

This would then allow you to call into your OAuth-secured functionality by providing the `bearer_access_token`.

```javascript
//CloudScript
var url = "https://api.yoursite.com/playfab_call/do_action";
var method = "post";
var contentBody = customActionBody;
var contentType = "application/json";
var headers = {};
headers["authorization"] = "Bearer " + bearer_access_token;
```

So the basic pattern in this case is that you use your application’s client ID and secret, in order to obtain the unique Bearer Access token for the call - and then use it to secure that call.

As you can see, these calls would all be made using SSL, in order to help prevent man-in-the-middle attacks.

Using HTTP calls from CloudScript, you can make calls into any other web API you need to for your title. This allows you to extend your title functionality beyond even what PlayFab offers directly, giving you the option to make and use your own custom services - or access others.

Because this all takes place within CloudScript, it provides a server-authoritative context in which to make those calls. This means that they'll have the necessary protections in your CloudScript to help prevent players from cheating, or accessing features and data they shouldn’t.
