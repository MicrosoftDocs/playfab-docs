---
title: HTTP Configuration
author: amccalib
description: Configuring HTTP retry and compression settings in the PlayFab Services SDK
ms.author: andmcc
ms.date: 02/14/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, http, retry, compression
ms.localizationpriority: medium
---

# HTTP Configuration

The PlayFab Services SDK provides functions to configure how HTTP requests are made, including automatic retry behavior and response compression. These settings are global and apply to all PlayFab API calls made by the SDK.

Configure HTTP settings after calling [**PFInitialize**](../../api-references/c/pfcore/functions/pfinitialize.md) and [**PFServicesInitialize**](../../api-references/c/pfservices/functions/pfservicesinitialize.md), but before making any API calls.

## Retry settings

The **PFHttpRetrySettings** struct controls how the SDK handles transient HTTP failures, such as throttling errors (HTTP 429). By default, the SDK automatically retries these failures with backoff.

| Field | Type | Default | Description |
|---|---|---|---|
| `allowRetry` | `bool` | `true` | Controls whether the SDK automatically retries select errors. Some errors are never retried and are always returned directly. |
| `minimumRetryDelayInSeconds` | `uint32_t` | 2 | The minimum number of seconds to wait before retrying a failed request. Can't be set below 2 seconds. |
| `timeoutWindowInSeconds` | `uint32_t` | 20 | The maximum number of seconds the SDK attempts retries before returning the error to the caller. |

For more information on which errors the SDK retries automatically, see [Handling PlayFab Errors](errors.md).

### Set retry settings

Call **PFSetHttpRetrySettings** to customize the retry behavior. For example, to increase the retry window for calls that can tolerate longer waits:

```cpp
PFHttpRetrySettings retrySettings{};
retrySettings.allowRetry = true;
retrySettings.minimumRetryDelayInSeconds = 4;
retrySettings.timeoutWindowInSeconds = 60;

HRESULT hr = PFSetHttpRetrySettings(&retrySettings);
if (FAILED(hr))
{
    // Handle error
}
```

### Get retry settings

Call **PFGetHttpRetrySettings** to retrieve the current retry configuration:

```cpp
PFHttpRetrySettings currentSettings{};
HRESULT hr = PFGetHttpRetrySettings(&currentSettings);
if (SUCCEEDED(hr))
{
    printf("Retry enabled: %s\n", currentSettings.allowRetry ? "true" : "false");
    printf("Min delay: %u seconds\n", currentSettings.minimumRetryDelayInSeconds);
    printf("Timeout window: %u seconds\n", currentSettings.timeoutWindowInSeconds);
}
```

### Disable automatic retries

If you want to handle all retry logic yourself, disable automatic retries:

```cpp
PFHttpRetrySettings retrySettings{};
retrySettings.allowRetry = false;
retrySettings.minimumRetryDelayInSeconds = 2;
retrySettings.timeoutWindowInSeconds = 20;

HRESULT hr = PFSetHttpRetrySettings(&retrySettings);
```

## HTTP settings

The **PFHttpSettings** struct controls general HTTP behavior for all SDK requests.

| Field | Type | Default | Description |
|---|---|---|---|
| `requestResponseCompression` | `bool` | `false` | When enabled, the SDK requests that API responses be gzip-compressed by setting the `Accept-Encoding` header to `application/gzip`. |

### Enable response compression

Enabling response compression can reduce bandwidth usage, which is useful for calls that return large payloads. Call **PFSetHttpSettings** to enable it:

```cpp
PFHttpSettings httpSettings{};
httpSettings.requestResponseCompression = true;

HRESULT hr = PFSetHttpSettings(&httpSettings);
if (FAILED(hr))
{
    // Handle error
}
```

> [!NOTE]
> To decompress a compressed response, **HCHttpCallResponseSetGzipCompressed** must be called before calling **HCHttpCallPerformAsync**.

### Get HTTP settings

Call **PFGetHttpSettings** to retrieve the current HTTP configuration:

```cpp
PFHttpSettings currentSettings{};
HRESULT hr = PFGetHttpSettings(&currentSettings);
if (SUCCEEDED(hr))
{
    printf("Response compression: %s\n", currentSettings.requestResponseCompression ? "enabled" : "disabled");
}
```

## Typical initialization pattern

The following example shows where HTTP configuration fits into the overall SDK initialization flow:

```cpp
// 1. Initialize the SDK
HRESULT hr = PFInitialize(nullptr);
hr = PFServicesInitialize(nullptr);

// 2. Configure HTTP settings before making any API calls
PFHttpRetrySettings retrySettings{};
retrySettings.allowRetry = true;
retrySettings.minimumRetryDelayInSeconds = 2;
retrySettings.timeoutWindowInSeconds = 30;
PFSetHttpRetrySettings(&retrySettings);

PFHttpSettings httpSettings{};
httpSettings.requestResponseCompression = true;
PFSetHttpSettings(&httpSettings);

// 3. Create service config and begin making API calls
// ...
```
