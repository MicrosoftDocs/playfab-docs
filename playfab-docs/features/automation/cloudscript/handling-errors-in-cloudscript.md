---
title: Handling Errors in CloudScript
author: v-thopra
description: Describes how to recognize and handle errors within your CloudScript handlers.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, cloudscript, error handling
ms.localizationpriority: medium
---

# Handling Errors in CloudScript

This tutorial describes how to recognize and handle errors within your CloudScript handlers.

## Identifying

The first step is identifying the error. While every uncaught error is logged and available from the response to the caller (client), you may still catch the error early by using a try/catch block. Consider the following Cloud Script snippet that produces and catches the error:

```javascript
"use strict";

handlers.GenerateError = () => {
    try {
        server.GetPlayerStatistics({
            PlayFabId : "non-existing-player-id"
        });
    } catch (ex) {
        let error = ex.apiErrorInfo.apiError.error; // In this case - "InvalidParams"
        let errorCode = ex.apiErrorInfo.apiError.errorCode; // In this case : 1000
    }
}
```

Notice how we extract error codes within the catch block. Consult our [Global API Method Error Codes](../../config/dev-test-live/global-api-method-error-codes.md) tutorial for a complete list of errors and their identifying codes. The error code on it's own is sufficient to identify the error.

## Logging

Any unhandled error will be added to the response, allowing the client to process the problem. At the same time, it does create a Cloud Script Error entry and is added to the total statistics available on your Cloud Script Dashboard:

![Game Manager - Automation - CloudScript Dashboard](media/tutorials/game-manager-cloudscript-dashboard.png)  

To force-log the exception in the form of a JSON string, use 'error' logging via the 'log' object:

```javascript
"use strict";

handlers.GenerateError = () => {
    try {
        server.GetPlayerStatistics({
            PlayFabId : "non-existing-player-id"
        });
    } catch (ex) {
        log.error(ex);
    }
}
```

Finally, you may write Title/Player events for later processing through analytics:

```javascript
"use strict";

handlers.GenerateError = () => {
    try {
        server.GetPlayerStatistics({
            PlayFabId : "non-existing-player-id"
        });
    } catch (ex) {
        server.WriteTitleEvent({
            EventName : 'cs_error',
            Body : ex
        });
    }
}
```

## Recovery

It's not always possible to recover from errors. Issues like "InvalidArguments" leave you with no option but to report the problem back to the player. There are a subset of errors where a retry strategy can be applied. "Retry-able" error types are described in the [Global API Method Error Codes](../../config/dev-test-live/global-api-method-error-codes.md) tutorial. Please, make sure to meet the following requirements when applying a retry strategy:

- With each retry, the delay between retries should increase exponentially. This increases your chances for a successful call, and prevents your game from spamming the PlayFab server (which will result in more rejected calls).

- You should apply this retry strategy selectively, only using it for those codes that are worth retrying.
