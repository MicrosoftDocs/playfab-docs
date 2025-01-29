---
title: Underlying Lobby and Matchmaking C++ SDK Network Retry Behavior
description: Guidance on how errors are surfaced in the C++ SDK and how titles should handle them
author: SahilAshar
ms.author: saashar
ms.date: 01/28/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, lobby, matchmaking, async, state change, notification
---

# Underlying Lobby and Matchmaking C++ SDK Network Retry Behavior

This page describes how the SDK automatically retries certain HTTP-based operations and how it manages retry timing. It
also covers the default configuration, which types of errors trigger retries, and the relationship between retries
and overall error handling.

- [Default retry behavior](#default-retry-behavior)
- [What triggers a retry](#what-triggers-a-retry)
- [Impact on asynchronous errors](#impact-on-asynchronous-errors)
- [Configuring retries and timeouts](#configuring-retries-and-timeouts)
- [Retry behavior on Nintendo Switch and Sony PlayStation platforms](#retry-behavior-on-nintendo-switch-and-sony-playstation-platforms)

## Default retry behavior

> [!NOTE]
> Default retry behavior occurs on all platforms, _except Nintendo Switch, Sony PlayStation&#174;4, and
Sony PlayStation&#174;5. See [Retry behavior on Nintendo Switch and Sony PlayStation platforms](#retry-behavior-on-nintendo-switch-and-sony-playstation-platforms).

By default, the SDK retries all idempotent HTTP requests. These retries use an **exponential backoff** with jitter,
meaning each subsequent delay before retrying roughly doubles (for example, 2 seconds, 4 seconds, 8 seconds, etc.), up to
a maximum of 20 seconds between attempts.

Each individual retry attempt defaults to a **per-attempt timeout** of five seconds. If an attempt hasn’t succeeded
within that timeframe, the SDK aborts the attempt and queues another retry (unless you’ve reached the maximum retry
window or certain failures).

A **retry window** of 20 seconds (by default) limits the total time spent attempting all retries. If the combined
duration of all attempts reaches this threshold, the overall call fails with an error, rather than continuing to
retry indefinitely.

## What triggers a retry

The automatic retry logic is engaged when one of the following occurs:

- A network error or time-out is encountered.  
- The server responds with an HTTP error status code of **408 (Request Timeout)**, **429 (Too Many Requests)**,
**500 (Internal Server Error)**, **502 (Bad Gateway)**, **503 (Service Unavailable)**, or **504 (Gateway Timeout)**.

If the server responds with an error code outside these failures, the SDK won't automatically retry these requests.

## Impact on asynchronous errors

Since the Multiplayer SDK is asynchronous, automatic retries might change how and when you see errors:

- **Delayed final state**: Because the SDK retries in the background, you won’t see an error result until all retry
attempts have been exhausted (or one attempt succeeds).
- **Different error codes**: If a transient network error resolves during a retry attempt, the call can still complete
successfully, avoiding a final failure code that would otherwise appear without retries.  

For more general guidance on handling asynchronous errors in the SDK, see [Handling Lobby and Matchmaking SDK errors](lobby-and-matchmaking-client-sdk-errors.md).

For all HTTP error codes that the Multiplayer SDK surfaces, see [PlayFab Multiplayer C++ SDK Error Codes](playfabmultiplayerreference-cpp\pfmultiplayererrors.md#http-client)

## Configuring retries and timeouts

The Multiplayer SDK does not currently support configuring retries and timemout thresholds.

## Retry behavior on Nintendo Switch and Sony PlayStation platforms

By default, the Multiplayer SDK for Nintendo Switch and Sony PlayStation platforms _do not_ automatically retry failed
HTTP requests. 

The SDK will surface a "state change", e.g.
[PFLobbyCreateAndJoinLobbyCompletedStateChange](playfabmultiplayerreference-cpp/pflobby/structs/pflobbycreateandjoinlobbycompletedstatechange.md),
who's `HRESULT result` field will be populated by HTTP failure type.

For all HTTP error codes that the Multiplayer SDK surfaces, see
[PlayFab Multiplayer C++ SDK Error Codes](playfabmultiplayerreference-cpp\pfmultiplayererrors.md#http-client)
