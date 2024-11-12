---
title: Throttling best practices
author: antnguyen
description: introduction on how PlayFab throttles API calls.
ms.author: antnguyen
ms.date: 01/26/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, throttling, throttle, api, token
ms.localizationpriority: medium
---

# Throttling best practices and recommendations
  
When encountering throttling in PlayFab, an HTTP 429 error is returned, signaling that an API call is being throttled. The response header and body includes key information to understand the error. 

Example header:
```http
HTTP/1.1 429 Too Many Requests
Retry-After: 8
```

Example response body:
```json
{ 
  "code": 429, 
  "status": "TooManyRequests", 
  "retryAfterSeconds": 8, 
  "error": "APIClientRequestRateLimitExceeded", 
  "errorCode": 1199, 
  "errorMessage": "The client has exceeded the maximum API request rate and is being throttled" 
} 
```

The **"Retry-After** and **"retryAfterSeconds"** property indicates the wait time in seconds before attempting another request to avoid throttling. If utilizing the latest [cross-platform C/C++ SDK](../../sdks/c/index.md), the SDK attempts to handle the retry on the caller's behalf. Otherwise, use the below strategies with the retry values to develop custom handling.

## Mitigating throttling issues

If throttling errors persist, consider adopting the following strategies: 

1. Review Request Rate
    * Analyze why you're sending a high volume of requests. 
    * Evaluate ways to lower the request rate for specific player or title entities targeted by the API. 

2. Batching API Calls
    * Reduce frequency by batching API calls. 
    * Example: Batch profile updates every 10 seconds instead of updating every second. 

## Key takeaways

* Throttling errors prompt an HTTP 429 response with details on the nature of the error. 
* Utilize the **Retry-After** and **"retryAfterSeconds"** property to determine the wait time before making another request. 
* Evaluate the necessity of high-frequency requests and optimize accordingly. 
* Implement batching strategies to alleviate throttling concerns and enhance overall system efficiency. 

## See also

* [Economy v2 Limits](../economy-v2/limits.md)
