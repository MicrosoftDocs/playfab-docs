---
title: Lobby and Matchmaking C++ SDK Network Retry Behavior
description: Guidance on default retry behavior for the C++ SDK
author: SahilAshar
ms.author: rachelwu
ms.date: 01/28/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, lobby, matchmaking, retry, retry behavior
---

# Lobby and Matchmaking C++ SDK Network Retry Behavior

This page describes's the SDK's policy for automatically retrying certain failable network operations. It covers the default behavior, the scenarios which internally trigger retries, and the relationship between internal retries and external failure error handling.

- [SDK retry behavior](#sdk-retry-behavior)
- [What triggers a retry](#what-triggers-a-retry)
- [Impact on asynchronous errors](#impact-on-asynchronous-errors)
- [Configuring retries and time-outs](#configuring-retries-and-time-outs)
- [Retry behavior on Nintendo Switch and Sony PlayStation platforms](#retry-behavior-on-nintendo-switch-and-sony-playstation-platforms)

## SDK retry behavior

> [!NOTE]
> The SDK's retry behavior occurs on all platforms, _except_ Nintendo Switch, Sony PlayStation&#174;4, and
Sony PlayStation&#174;5. See [Retry behavior on Nintendo Switch and Sony PlayStation platforms](#retry-behavior-on-nintendo-switch-and-sony-playstation-platforms).

The Multiplayer SDK retries all idempotent HTTP requests. These retries use an **exponential backoff** with jitter,
meaning each subsequent delay before retrying roughly doubles (for example, 2 seconds, 4 seconds, 8 seconds, etc.), up to
a maximum of 20 seconds between attempts.

Each individual retry attempt defaults to a **per-attempt timeout** of five seconds. If an attempt hasn't succeeded
within that timeframe, the SDK aborts the attempt and queues another retry (unless you've reached the maximum retry
window or certain failures).

A **retry window** of 20 seconds limits the total time spent attempting all retries. If the combined
duration of all attempts reaches this threshold, the overall call fails with an error, rather than continuing to
retry indefinitely.

When the service returns an HTTP error that includes a `Retry-After` header, the SDK caches the request and track the `Retry-After` duration. If the `Retry-After` specifies a delay that's within the 20-second retry window, the `Retry-After` controls the next delay offset. If the `Retry-After` specifies a delay that's outside the 20-second retry window, the operation isn't retried.

## What triggers a retry

The automatic retry logic is engaged when one of the following occurs:

- A network error or time-out is encountered.  
- The server responds with an HTTP error status code of:
    - **408 (Request Timeout)**
    - **429 (Too Many Requests)**
    - **500 (Internal Server Error)**
    - **502 (Bad Gateway)**
    - **503 (Service Unavailable)**
    - **504 (Gateway Timeout)**

Other failures won't trigger a retry and are processed immediately.

## Impact on asynchronous errors

Since the Multiplayer SDK is asynchronous, automatic retries might change how and when you see errors:

- **Delayed final state**: Because the SDK retries in the background, you won't see an error result until all retry attempts have been exhausted, the request has succeeded, or the request has fatally failed.
- **Different error codes**: If a transient network error resolves during a retry attempt, the call can still complete
successfully, avoiding a final failure code that would otherwise appear without retries.  

For guidance on handling asynchronous errors in the SDK, see [Handling Lobby and Matchmaking SDK errors](lobby-and-matchmaking-client-sdk-errors.md).

For all HTTP error codes that the Multiplayer SDK surfaces, see [PlayFab Multiplayer C++ SDK Error Codes](playfabmultiplayerreference-cpp/pfmultiplayererrors.md#http-client).

## Configuring retries and time-outs

The Multiplayer SDK doesn't currently support configuring retries and time-out thresholds.

## Retry behavior on Nintendo Switch and Sony PlayStation platforms

The Multiplayer SDK for Nintendo Switch and Sony PlayStation platforms _don't_ automatically retry failed
HTTP requests. 

All network failures are treated as unretryable and exposed as asynchronous errors in the SDK. For guidance on handling asynchronous errors in the SDK, see [Handling Lobby and Matchmaking SDK errors](lobby-and-matchmaking-client-sdk-errors.md).

For all HTTP error codes that the Multiplayer SDK surfaces, see
[PlayFab Multiplayer C++ SDK Error Codes](playfabmultiplayerreference-cpp/pfmultiplayererrors.md#http-client).
