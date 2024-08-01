---
title: Event Pipeline Tutorial
author: rgomez391
description: Step-by-step event pipeline tutorial
ms.author: raulalbertog
ms.date: 05/08/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, telemetry, insights
ms.localizationpriority: medium
---

# Event Pipeline tutorial

This document is a quick step-by-step tutorial on how to use the Event Pipeline feature in the PlayFab Services SDK.

## Step 1 - Initialize PlayFab Services SDK

The first step is to initialize PF Service SDK using **PFServicesInitialize** and **PFServiceConfigCreateHandle** APIs.

The **PFServiceConfigCreateHandle** API receives a connection string and a title ID that can be obtained from your title on PlayFab Game Manager.

The third parameter is a **PFServiceConfigHandle** struct that represents the configuration that is being created. This service config handle will be used in the next step.

```cpp
PFServiceConfigHandle serviceConfigHandle;

PFServicesInitialize(nullptr);

PFServiceConfigCreateHandle(
    "titleConnectionString",
    "titleId",
    &serviceConfigHandle
);
```

## Step 2 - Create Telemetry Event Pipeline

Next, let's create a Telemetry Event Pipeline with a Telemetry Key using the **PFEventPipelineCreateTelemetryPipelineHandleWithKey** API. Telemetry Keys are created and managed through PlayFab Game Manager.

When creating the PFEventPipelineTelemetryKeyConfig struct, we're passing the actual telemetry key and the service config handle we got during SDK initialization.

```cpp
PFEventPipelineHandle handle;
XTaskQueueHandle taskQueueHandle;

XTaskQueueCreate(XTaskQueueDispatchMode::ThreadPool, XTaskQueueDispatchMode::Manual, &taskQueueHandle);

PFEventPipelineTelemetryKeyConfig telemetryKeyConfig
{
    "myTelemetryKey",
    serviceConfigHandle,
};

HRESULT hr = PFEventPipelineCreateTelemetryPipelineHandleWithKey(
    &telemetryKeyConfig,
    taskQueueHandle,
    nullptr,
    nullptr,
    nullptr,
    &handle
);

if (FAILED(hr))
{
    printf("Failed creating event pipeline: 0x%x\r\n", hr);
    return;
}
```

## Step 3 - Update Pipeline configuration

Let's update the pipeline configuration, in this example we want to send batches of maximum 10 events (default is 5).

Also, since we're sending maxWaitTimeInSeconds and pollDelayInMs as null pointers they use the default value for the respective pipeline type.

We're also specifying a "Medium" compression level, setting this property compresses the body payloads and helps to optimize network resources utilization. 

Then we proceed to call **PFEventPipelineUpdateConfiguration** passing the **PFEventPipelineHandle** that we got from previous step and the **PFEventPipelineConfig** struct.

```cpp
uint32_t maxEvents = 10;
PFHCCompressionLevel compressionLevel = PFHCCompressionLevel::Medium;

PFEventPipelineConfig eventPipelineConfig
{
    &maxEvents,         // maxEventsPerBatch
    nullptr,            // maxWaitTimeInSeconds
    nullptr,            // pollDelayInMs
    &compressionLevel   // compressionLevel
};

HRESULT hr = PFEventPipelineUpdateConfiguration(
    handle,
    eventPipelineConfig
);

if (FAILED(hr))
{
    printf("Failed updating event pipeline configuration: 0x%x\r\n", hr);
    return;
};
```

## Step 4 - Emit event

On this step, we proceed to emit just 1 event with name "TelemetryKeyEvent" through **PFEventPipelineEmitEvent** API.

This event isn't linked to any entities since we haven't provided entity authentication so far.

```cpp
PFEvent myEvent
{
    nullptr,
    "custom.playfab.events.PlayFab.Test.TelemetryEventPipelineTests",
    "TelemetryKeyEvent",
    nullptr,
    "{}"
};

HRESULT hr = PFEventPipelineEmitEvent(
    handle,
    &myEvent
);

if (FAILED(hr))
{
    printf("Failed emitting event: 0x%x\r\n", hr);
    return;
}
```

## Step 5 - Get Entity

Here, we want to get an Entity that we can use to start linking with our events.

For this tutorial, we're calling **PFAuthenticationReLoginWithXUserAsync** API to get a valid **PFEntityHandle**.

> [!NOTE]
> The userHandle object passed as part of the **PFAuthenticationLoginWithXUserRequest** is of XUserHandle type. The steps on how to get a valid XUserHandle are out of scope for this tutorial. For more information on this topic, see [XUserAddAsync](/gaming/gdk/_content/gc/reference/system/xuser/functions/xuseraddasync) documentation.

```cpp
PFEntityHandle entityHandle;

PFAuthenticationLoginWithXUserRequest request{};
request.createAccount = true;
request.user = userHandle; // An XUserHandle obtained from XUserAddAsync

XAsyncBlock async{};

HRESULT hr = PFAuthenticationReLoginWithXUserAsync(entityHandle, &request, &async);

if (FAILED(hr))
{
    printf("Failed PFAuthenticationReLoginWithXUserAsync: 0x%x\r\n", hr);
    return;
}

hr = XAsyncGetStatus(&async, true); // This is doing a blocking wait for completion, but you can use the XAsyncBlock to set a callback instead for async style usage

if (FAILED(hr))
{
    printf("Failed XAsyncGetStatus: 0x%x\r\n", hr);
    return;
}
```

## Step 6 - Add Entity to Pipeline

Since we already got a valid Entity, we can call **PFEventPipelineAddUploadingEntity** and pass the Event Pipeline handle and the entity handle from the previous step. This action allows the pipeline to switch to use entity authentication.

```cpp
HRESULT hr = PFEventPipelineAddUploadingEntity(
    handle,
    entityHandle
);

if (FAILED(hr))
{
    printf("Failed adding uploading entity: 0x%x\r\n", hr);
    return;
}
```

## Step 7 - Emit event

This procedure is the same as the previous event submission.

The only two differences are:

- We're tagging this event with a different name ("EntityEvent") to make it clearer.
- This event gets logged and linked with the entity that we previously obtained.

```cpp
PFEvent myEvent
{
    nullptr,
    "custom.playfab.events.PlayFab.Test.TelemetryEventPipelineTests",
    "EntityEvent",
    nullptr,
    "{}"
};

hr = PFEventPipelineEmitEvent(
    handle,
    &myEvent
);

if (FAILED(hr))
{
    printf("Failed emitting event: 0x%x\r\n", hr);
    return;
}
```

## Step 8 - Close Event Pipeline handle

Lastly, when we're done uploading events, the only thing we need to do is to call **PFEventPipelineCloseHandle** passing our pipeline handle.

```cpp
PFEventPipelineCloseHandle(handle);
```

## See also

- [Event Pipeline overview](eventpipeline.md)
