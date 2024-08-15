---
title: PlayFab Services SDK - Event Pipeline
author: rgomez391
description: Overview of the Event Pipeline features in the SDK
ms.author: raulalbertog
ms.date: 05/08/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, telemetry, insights
ms.localizationpriority: medium
---

# Event Pipeline

The Event Pipeline is a feature that is part of the PlayFab Services SDK and the main purpose is to allow game developers to send events to be stored in PlayFab Insights. It allows the developer to specify batch size, send frequency and other aspects of a proper telemetry solution.

It helps to ease that burden on the game developer and handle all those aspects on their behalf. There's support for configurable event pipelines. A title can contain one or more of these pipelines and each can be configured with its own properties.

Let's go over some of the basic concepts of the pipeline.

## Pipeline types

The pipeline type is directly related to the type of events a pipeline emits. There are two different types of pipelines a developer can instantiate:

- **Telemetry Event Pipeline**: Can only emit Telemetry Events and uses [Write Telemetry Events](/rest/api/playfab/events/play-stream-events/write-telemetry-events) REST API.

- **PlayStream Event Pipeline**: Can only emit PlayStream Events and uses [Write Events](/rest/api/playfab/events/play-stream-events/write-events) REST API.

You can have multiple pipelines with different types and configurations but it's worth mentioning that the pipeline type **cannot** be changed after creation, a Pipeline reinstantiation would be required.

## Auth types

Another important piece of the pipeline creation is the auth type. There are two supported auth mechanisms for PlayFab Events&mdash;Entity auth and Telemetry Key auth.

Entity auth is used when the game developer wants to link their events against a particular entity for further aggregation or analysis. For example, the game developer could log events related to player's actions to do further behavior analysis of your title players that allow for segmentation.

Telemetry Key auth is used when the game developer wants to log events that don't necessarily need to be linked to an entity. For example, prior to having a logged in player, the title can start sending events related to performance or specific metrics it would like to collect for further analysis. This can be done without the need of going through the regular entity authentication process.

**Supported auth type / Event type combinations**

|                       | **Entity auth** | **Telemetry Key auth** |
|-----------------------|:---------------:|:----------------------:|
| **Telemetry Events**  |      Valid      |         Valid          |
| **PlayStream Events** |      Valid      |        Invalid         |

### Entity auth

This auth type is the normal and most common PlayFab Authentication method. It's tightly related to a specific entity and it requires you to call the corresponding PlayFab Login APIs in order to get an Entity Token to be used on any subsequent calls. The following list represents the different type of entities that can be used with Entity Authentication.

- **namespace**: The namespace entity refers to all global information for all titles within your studio.
- **title**: The title entity refers to all global information for that title.
- **master_player_account**: The master_player_account is a player entity that is shared by all titles within your studio.
- **title_player_account**: For most developers, title_player_account represents the player in the most traditional way.
- **character**: The character entity is a subentity of title_player_account.
- **group**: The group entity is a container for other entities. It's currently limited to players and characters.

 For more information about the different entity types, see [Built-in entity types](/gaming/playfab/features/data/entities/available-built-in-entity-types).

Also, the pipeline entity can be updated after pipeline creation by providing a valid **PFEntityHandle**. So, the game developer is able to add an Entity to start linking their events to it (_see [Switching to Entity auth or Updating Entity](#switching-to-entity-auth-or-updating-entity) section_) or even remove it they want to log things that aren't related to an entity (_see [Switching to Telemetry Key auth](#switching-to-telemetry-key-auth) section_).

If an Entity exists on the pipeline, it always takes precedence over the Telemetry key auth.

### Telemetry key auth

Telemetry Key authentication doesn't require an Entity Token, therefore it isn't tied to any specific entity.

If Telemetry Key auth is used, a **PFEventPipelineTelemetryKeyConfig** struct is required during pipeline creation. There are two main pieces of this struct:

1. A Telemetry Key that consists of a string that is created and managed via PlayFab Game Manager.

2. A **PFServiceConfigHandle** that lets the SDK know which is the right service configuration that should be used for uploading the events. The service config handle is created during SDK Initialization by calling **PFServiceConfigCreateHandle**.

If the developer wants to use a Telemetry Key it's important to provide it at pipeline creation, since there's no way to add a Telemetry Key after the pipeline has been instantiated.

It's worth mentioning that **Telemetry Key auth is only available for Telemetry Events**; it doesn't support PlayStream events.

## Event Pipeline configuration

As previously mentioned, the event pipeline has some configurable properties that can be provided after pipeline creation through the **PFEventPipelineConfig** struct parameter.

The configurable properties are:

- **maxEventsPerBatch**: The maximum number events that are batched before writing them to PlayFab.
- **maxWaitTimeInSeconds**: The maximum time the pipeline waits before sending out an incomplete batch.
- **pollDelayInMs**: How long the pipeline will wait to read from the event buffer again after emptying it.
- **compressionLevel**: Defines the compression level that is used on the compression algorithm. For more details about compression, see _[GZIP Compression](#gzip-compression)_.
- **retryOnDisconnect**: The event pipeline will retry sending events that failed due to lost connection. Only available for Telemetry Event Pipeline.
- **bufferSize**: The limit of the amount of events in the pipeline's buffer.

In the case where **PFEventPipelineConfig** has only some properties specified, the ones being empty are overwritten and use the default values.

For an example of how any of these properties can be updated for the event pipeline see _[Update Pipeline Configuration](#update-pipeline-configuration)_.

#### **GZIP Compression**

The Event Pipeline provides an option of compressing body payloads using GZIP Compression standard.

The desired compression level can be specified inside the **PFEventPipelineConfig** struct that is part of the **PFEventPipelineUpdateConfiguration** API parameters.

A lower compression level achieves less compression but has the highest speed and a higher compression level achieves better compression rates but has the slowest compression speed. The difference in compression rates is all dependent on the type of data being sent. Depending on the size and randomness of the data, compression rates can be the same even on different levels.

**Trade-Offs:**

Using compression increases CPU Time due to the added complexity of running a compression algorithm but, on the other hand, network body payload is dramatically decreased. So, depending on the game needs and resources, it's up to the game developer if compression should be used.

Based on internal validation, there's an average of 20% increase in CPU Time and an average of 91% decrease in Payload Body Size. These percentages could largely vary depending on the payload size and complexity of the data being compressed.

## Event handlers

As part of pipeline creation, game developers can provide two optional event handlers that are invoked when events are uploaded.

However, if the game developer wants a "fire and forget" experience, can omit providing the event handlers.

The event handlers that can be provided are as follows:

- **PFEventPipelineBatchUploadSucceededEventHandler**: As the name suggests, it receives all the events that are successfully uploaded to PlayFab.

- **PFEventPipelineBatchUploadFailedEventHandler**: It will receive all the failed events after going through the pipeline retry logic.

### Pipeline creation examples

Below you can find different examples on how to instantiate an event pipeline based on the topics discussed previously.

1. **Telemetry Event Pipeline creation with Entity auth**

    If the developer wants to send Telemetry Events and doesn't have the need of using Telemetry Key auth, the **PFEventPipelineCreateTelemetryPipelineHandleWithEntity** API serves for this purpose as seen in the next example:

    ```cpp
    void EventPipelineCreation(PFEntityHandle entityHandle, XTaskQueueHandle taskQueueHandle)
    {
        PFEventPipelineHandle handle;

        HRESULT hr = PFEventPipelineCreateTelemetryPipelineHandleWithEntity(
            entityHandle,                       // entityHandle
            taskQueueHandle,                    // queue
            nullptr,                            // eventPipelineBatchUploadedEventHandler
            nullptr,                            // eventPipelineBatchFailedEventHandler
            nullptr,                            // handlerContext
            &handle                             // eventPipelineHandle
        );

        if (FAILED(hr))
        {
            printf("Failed creating event pipeline: 0x%x\r\n", hr);
            return;
        }
    }
    ```

    This example shows how to create a Telemetry Event Pipeline that uses Entity authentication and it has no handlers. This means the pipeline fires the events and forgets about the result.

2. **Telemetry Event Pipeline creation with Telemetry Key auth**

    If the developer wants to send Telemetry Events and has the need of using Telemetry Key auth, the PFEventPipelineCreateTelemetryPipelineHandleWithKey API serves this purpose as seen in the next example:

    ```cpp
    void EventPipelineCreation(PFServiceConfigHandle serviceConfigHandle, XTaskQueueHandle taskQueueHandle)
    {
        PFEventPipelineHandle handle;

        PFEventPipelineTelemetryKeyConfig telemetryKeyConfig
        {
            "myTelemetryKey",                   // telemetryKey
            serviceConfigHandle,                // serviceConfigHandle
        };

        HRESULT hr = PFEventPipelineCreateTelemetryPipelineHandleWithKey(
            &telemetryKeyConfig,                // eventPipelineTelemetryKeyConfig
            taskQueueHandle,                    // queue
            nullptr,                            // eventPipelineBatchUploadedEventHandler
            nullptr,                            // eventPipelineBatchFailedEventHandler
            nullptr,                            // handlerContext
            &handle                             // eventPipelineHandle
        );

        if (FAILED(hr))
        {
            printf("Failed creating event pipeline: 0x%x\r\n", hr);
            return;
        }
    }
    ```

    This example shows how to create a telemetry event pipeline that isn't using Entity Auth.

    The event pipeline starts uploading events using the Telemetry Key with the possibility of adding an Entity later on. See [Switching to Entity Auth or Updating Entity](#switching-to-entity-auth-or-updating-entity)

3. **PlayStream Event Pipeline creation**

    If the developer wants to send PlayStream Events, the PFEventPipelineCreatePlayStreamPipelineHandle API serves this purpose as seen in the next example:

    ```cpp
    void EventPipelineCreation(PFEntityHandle entityHandle, XTaskQueueHandle taskQueueHandle)
    {
        PFEventPipelineHandle handle;

        HRESULT hr = PFEventPipelineCreatePlayStreamPipelineHandle(
            entityHandle,                       // entityHandle
            taskQueueHandle,                    // queue
            nullptr,                            // eventPipelineBatchUploadedEventHandler
            nullptr,                            // eventPipelineBatchFailedEventHandler
            nullptr,                            // handlerContext
            &handle                             // eventPipelineHandle
        );

        if (FAILED(hr))
        {
            printf("Failed creating event pipeline: 0x%x\r\n", hr);
            return;
        }
    }
    ```

    This example shows how a PlayStream Event Pipeline is created that uses Entity authentication and it has no handlers. Which means that the pipeline fires the events and forgets about the result.

4. **Event Pipeline using event handlers**

    This example shows how event handlers would be provided to the Pipeline creation APIs.

    ```cpp
    void CALLBACK OnBatchUploadedHandler(void* context, PFUploadedEvent const* const* events, size_t eventsCount)
    {
        // Handle response
    }

    void CALLBACK OnBatchUploadFailedHandler(void* context, HRESULT hr, const char* errorMessage, PFEvent const* const* events, size_t eventsCount)
    {
        // Handle response
    }

    void EventPipelineCreation(PFEntityHandle entityHandle, XTaskQueueHandle taskQueueHandle)
    {
        PFEventPipelineHandle handle;

        HRESULT hr = PFEventPipelineCreateTelemetryPipelineHandleWithEntity(
            entityHandle,                       // entityHandle
            taskQueueHandle,                    // queue
            OnBatchUploadedHandler,             // eventPipelineBatchUploadedEventHandler
            OnBatchUploadFailedHandler,         // eventPipelineBatchFailedEventHandler
            nullptr,                            // handlerContext
            &handle                             // eventPipelineHandle
        );

        if (FAILED(hr))
        {
            printf("Failed creating event pipeline: 0x%x\r\n", hr);
            return;
        }
    }
    ```

As seen in the example, ***OnBatchUploadedHandler*** and ***OnBatchUploadFailedHandler*** are declared as two different callback functions that are passed when the Event Pipeline is created. Every result associated with an event is returned on one of these two functions, depending whether the result was successful or failure. It's up to the game developer how to handle the result.

### Emitting events

Emitting events is a straightforward operation once the event pipeline is already created. The game developer should call **PFEventPipelineEmitEvent** API that receives the existing event pipeline handle and the event they want to send.

```cpp
void EmitEvent(PFEventPipelineHandle handle)
{
    PFEvent myEvent
    {
        nullptr,
        "custom.playfab.events.PlayFab.Test.TelemetryEventPipelineTests",
        "TelemetryEvent",
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
}
```

It's important to note that when using Telemetry Key auth, the only valid value for entityType as part of **PFEntityKey** is **"external"**. Any other entity types are rejected and events aren't uploaded.

Example of a valid PFEntityKey when using Telemetry Key auth:

```cpp
void EmitEvent(PFEventPipelineHandle handle)
{
    PFEntityKey pfEntityKey{ "my-unique-ID", "external" };  // Note the "external" value

    PFEvent myEvent
    {
        &pfEntityKey,
        "custom.playfab.events.PlayFab.Test.EventsWithTelemetryKey",
        "TelemetryEvent",
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
}
```

If the buffer size limit is exceeded when an event is emitted, you will encounter an error from the SDK as follows:

- `E_PF_API_CLIENT_REQUEST_RATE_LIMIT_EXCEEDED (0x892354dd)`

Make sure to set an adequate size of a buffer for your needs.

### Switching to Entity auth or updating Entity

If a pipeline was created using only a Telemetry Key configuration, there's a way to switch to Entity authentication or if you want to update your pipeline to use a different Entity.

By using the **PFEventPipelineAddUploadingEntity**, it's possible to attach an entity to a running pipeline without the need of reinitialize it. It also replaces the existing entity, if any.

Example:

A Telemetry Event Pipeline is created with Telemetry Key configuration at the beginning of title execution. Possible reasons for this are that there isn't a player identity yet or simply we don't want to log anything related to a player still.

```cpp
void EventPipelineCreation(PFServiceConfigHandle serviceConfigHandle, XTaskQueueHandle taskQueueHandle)
{
    PFEventPipelineHandle handle;

    PFEventPipelineTelemetryKeyConfig telemetryKeyConfig
    {
        "myTelemetryKey",                   // telemetryKey
        serviceConfigHandle,                // serviceConfigHandle
    };

    HRESULT hr = PFEventPipelineCreateTelemetryPipelineHandleWithKey(
        &telemetryKeyConfig,                // eventPipelineTelemetryKeyConfig
        taskQueueHandle,                    // queue
        nullptr,                            // eventPipelineBatchUploadedEventHandler
        nullptr,                            // eventPipelineBatchFailedEventHandler
        nullptr,                            // handlerContext
        &handle                             // eventPipelineHandle
    );

    if (FAILED(hr))
    {
        printf("Failed creating event pipeline: 0x%x\r\n", hr);
        return;
    }
}
```

Then, a player has logged in or we just want to start sending events attached to a particular entity so we can call **PFEventPipelineAddUploadingEntity** with the existing event pipeline handle and the desired entity handle as follows:

```cpp
void EventPipelineUpdateEntity(PFEventPipelineHandle handle)
{
    HRESULT hr = PFEventPipelineAddUploadingEntity(
        handle,                 // eventPipelineHandle
        entityHandle            // entityHandle
    );

    if (FAILED(hr))
    {
        printf("Failed adding uploading entity: 0x%x\r\n", hr);
        return;
    }
}
```

After this call, the pipeline will start logging any subsequent events linked to that entity.

### Switching to Telemetry Key auth

Expanding on the previous scenario, if the developer wants to go back to Telemetry Auth and detach the event logging from the entity they can call **PFEventPipelineRemoveUploadingEntity** and pass the event pipeline handle like this:

```cpp
void EventPipelineRemoveEntity(PFEventPipelineHandle handle)
{
    HRESULT hr = PFEventPipelineRemoveUploadingEntity(
        handle                  // eventPipelineHandle
    );

    if (FAILED(hr))
    {
        printf("Failed removing uploading entity: 0x%x\r\n", hr);
        return;
    }
}
```

This call removes the entity and effectively switches back to Telemetry Key auth for all the subsequent events.

### **Update Pipeline configuration**

Pipelines can be easily updated using the **PFEventPipelineUpdateConfiguration** API, which receives the existing event pipeline handle and a new configuration struct as follows:

```cpp
void EventPipelineUpdateConfiguration(PFEventPipelineHandle handle)
{
    uint32_t maxEvents = 10;
    uint32_t maxWaitTime = 5;
    uint32_t pollDelay = 50;
    PFHCCompressionLevel compressionLevel = PFHCCompressionLevel::Medium;
    bool retryOnDisconnect = true;
    size_t bufferSize = 2048;

    PFEventPipelineConfig eventPipelineConfig
    {
        &maxEvents,             // maxEventsPerBatch
        &maxWaitTime,           // maxWaitTimeInSeconds
        &pollDelay,             // pollDelayInMs
        &compressionLevel,      // compressionLevel
        &retryOnDisconnect,     // retryOnDisconnect
        &bufferSize,            // bufferSize
    };

    HRESULT hr = PFEventPipelineUpdateConfiguration(
        handle,                 // eventPipelineHandle
        eventPipelineConfig     // eventPipelineConfig
    );

    if (FAILED(hr))
    {
        printf("Failed updating event pipeline configuration: 0x%x\r\n", hr);
        return;
    };
}
```

_**Reminder**: Any empty or null properties overwrite existing configuration value with the default value._

## Invalid / deactivated Telemetry keys

In case a Telemetry key is deactivated or if an invalid key is provided at pipeline creation, any Event Pipelines running using that Telemetry Key will start failing as soon as they find out the key is invalid or deactivated.

In the eventual case where the customer reactivates the key, the pipeline won't realize about that and will keep sending failures back through the failed event handler. It's worth mentioning that this behavior is session-based, which means that if the title is restarted, a new pipeline is created and will be able to upload events again.

## See also

- [Event pipeline tutorial](eventpipeline-tutorial.md)
