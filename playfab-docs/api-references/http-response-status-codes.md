---
title: HTTP response status codes
author: joannaleecy
description: HTTP response status codes.
ms.author: joanlee
ms.date: 06/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, http, development, testing, errors, error codes
ms.localizationpriority: medium
---

# HTTP response status codes

This article lists global HTTP response status codes and what they mean. It also includes extra description that generally applies to all PlayFab APIs. 

Use this page as a reference guide to troubleshoot issues related to HTTP web requests. For specific descriptions that relate to a particular API, you have to go to the documentation page for that API.

If you're getting a status code that is not listed here, let us know on [PlayFab forums](https://community.playfab.com/index.html) and categorize your question under __API and SDK questions__.

> [!NOTE]
> Not every API can return all of the status codes listed below. There are APIs that only return some of the codes.

| HTTP status code   | General description |
|--------------------|---------------------|
| 100                | Continue: Returned on HEAD requests |
| 200                | OK: Returned for all successful requests. May indicate partial success for bulk APIs. |
| 201                | Created: Request was successful and resource was created. |
| 202                | Accepted: Request was successful, processing will continue asynchronously. |
| 204                | No Content: API successful, but there is no response to be returned from the API.|
| 400                | Bad Request: Parameters in request where invalid or request payload structure was invalid. Do not retry.|
| 401                | Unauthorized: Caller is not authorized to either call the specific API or perform the action requested. Do not retry.|
| 403                | Forbidden: Caller is not allowed access. Do not retry.|
| 404                | Not Found: API does not exist. Do not retry. |
| 408                | Request Timeout: The request took too long to be sent to the server. Okay to retry using exponential backoff pattern. |
| 409                | Conflict: A concurrency error occurred between two API calls. Okay to retry using exponential backoff pattern.|
| 413                | Payload Too Large: The request is larger than the server is allowed to handle. Do not retry. If unexpected, contact support.|
| 414                | URI Too Long: The URI in the request is longer than the server is allowed to handle. Do not retry.|
| 429                |Too Many Requests: API calls are being rate limited. Pause and then retry request, check if API returned “Retry-After” header or retryAfter in JSON response for delay needed. |
| 500                | Internal Server Error: An error occurred on the PlayFab server. Okay to retry, contact support if problem persists.|
| 501                | Not Implemented: The API called has not been implemented yet. Do not retry.|
| 502                | Bad Gateway: PlayFab API servers are not available to process the request. Pause and then retry request using exponential backoff pattern. |
| 503                | Service Unavailable: PlayFab API servers are not available to process the request. Pause and then retry request using exponential backoff pattern.|
| 504                | Gateway Timeout: PlayFab API servers are not available to process the request. Pause and then retry request.|

## See also

* [PlayFab API reference documentation](/rest/api/playfab/admin/account-management/ban-users)
