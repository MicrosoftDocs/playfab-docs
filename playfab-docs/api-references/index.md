---
title: REST API Reference
author: joannaleecy
description: Overview page for PlayFab REST API reference documentation.
ms.author: joanlee
ms.date: 11/19/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, api
ms.localizationpriority: medium
---

# REST API overview

Welcome to the PlayFab REST API reference. Here you'll find reference material and gain insight into how our APIs work. Each API reference is broken down into several different sections.

## Endpoint

The endpoint is the HTTP URL that you can make API requests against. It's preceded with a REST method type (for example, GET, POST). In addition, the titleId must be replaced with your game titleId.

Example:

```html
POST https://[titleId].playfabapi.com/Client/LoginWithCustomID
```

## Request Body

The request body is the object model that is sent as (JSON) to our API service. These models contain properties that need to be sent along with your API as the payload. Some properties are flagged as **required**, while others are **optional**.

## Responses

The API service will either return a 200 OK with a JSON payload that can be deserialized as a model. In the below example, Login API calls deserialize into a type of LoginResult.

![Example 200 OK response with a LoginResult](images/responses.png)

If the response fails, a 4XX error response is received. A 400 Bad Request could often be due to missing parameters in your API call or other reasons such as exceeding rate limits and validation errors. If you encounter a 4XX error, it's best to check the request parameters and authentication token and ensure they're correct. The ApiErrorWrapper object contains valuable information about the error including error codes, error details and error messages from the server to help identify the issue.

## Security

Each API has some form of security that needs to be passed in the header of each request. See this section to know what needs to be defined. Sometimes this is a session ticket from a login request or it could be your title secret key if you're making server api requests.

## Concurrency

The API service is designed to handle a very large number of concurrent calls from each title, but there are limits and restrictions on the number of concurrent calls that can access a single player or other single entity such as a character or group. If this concurrency limit is exceeded, the API returns an `APIConcurrentRequestLimitExceeded` or `ConcurrentEditError` error code. In general, it's safe to make more than one read request for a given player concurrently, but it's best to make a single update request at a time.

## Model Definitions

Each response from the API service can contain one or more Models in the response. These are located below the ApiErrorWrapper and each model is represented in the same document as the API. Each model is also linked in the response parent model. You can also visit the Definitions section in each API page to see a list of Models supported by the API.

### Event Model Definitions

The [PlayStream Event Model reference](events/index.md) contains the models of the automatically generated PlayStream event types. Each event type has a set of properties that are included as part of event's data wherever it's sent.
