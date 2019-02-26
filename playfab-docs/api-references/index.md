---
title: API References
author: v-thopra
description: Overview page for PlayFab API reference documentation.
ms.author: v-thopra
ms.date: 11/19/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, api
ms.localizationpriority: medium
---

# API References

Welcome to the PlayFab API reference. Here you will find reference material and gain insight into how our APIs work. Each API reference is broken down into several different sections.

## Endpoint

The endpoint is the HTTP URL that you can make API requests against. It is preceded with a REST method type (eg. GET, POST). In addition, the titleId must be replaced with your game titleId.

Example:

```html
POST https://[titleId].playfabapi.com/Client/LoginWithCustomID
```

## Request Body

The request body is the object model that is sent as (JSON) to our API service. These models will contain properties that need to be sent along with your API as the payload. Some properties will be flagged as **required**, while others are **optional**.

## Responses

The API service will either return a 200 OK with a JSON payload that can be deserialized as a model. In the below example, Login API calls deserialize into a type of LoginResult.

![Responses](images/responses.png)

If the response fails for any reason, a 400 Bad Request is received. This could mean the API service is returning information about a bad request. Often, this could be missing parameters in your API call or a number of other reasons. The ApiErrorWrapper object contains valuable information about the error including error codes, error details and error messages from the server.

## Security

Each API has some form of security that needs to be passed in the header of each request. See this section to know what needs to be defined. Sometimes this is a session ticket from a login request or it could be your title secret key if you are making server api requests.

## Model Definitions

Each response from the API service can contain one or more Models in the response. These are located below the ApiErrorWrapper and each model is represented in the same document as the API. Each model is also linked in the response parent model. You can also visit the Definitions section in each API page to see a list of Models supported by the API.

### Event Model Definitions

The [PlayStream Event reference](events\index.md) contains the models of the automatically generated PlayStream event types. Each event type has a set of properties that are included as part of event's data wherever it is sent.