---
title: Telemetry Keys
author: sofiamarinv
description: Using Telemetry Keys to ingest events
ms.author: sofiamarin
ms.date: 06/14/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, simplified authentication telemetry, telemetry keys, telemetry
ms.localizationpriority: medium
---

# Telemetry Keys

Telemetry Keys enables you to use PlayFab's powerful analytics capabilities by ingesting custom telemetry events directly from your game client. You can now use the [WriteTelemetryEvents API](/rest/api/playfab/events/play-stream-events/write-telemetry-events) to simplify your client's authentication to PlayFab when sending telemetry.

A Telemetry Key is a credential that can be used instead of the Entity Token normally required to call [PlayFab Entity APIs](../../features/data/entities/index.md). This means you can utilize PlayFab's telemetry ingestion capabilities even if you don't have a player signed in. What's more, unlike Title Secret keys, Telemetry Keys don't grant access to administrative APIs; they can only be used for sending telemetry. You can safely share Telemetry Keys directly with your game clients.

## Using Telemetry Keys

You can manage the keys configured for your title from the `Telemetry Keys` tab under the `Data` section in GameManager.

Once you've created a key, you can use it from your game client when calling [WriteTelemetryEvents](/rest/api/playfab/events/play-stream-events/write-telemetry-events) by including it via HTTP header `X-TelemetryKey`:

```HTTP
POST https://<titleId>.playfabapi.com/Event/WriteTelemetryEvents
X-TelemetryKey: <Your Telemetry Key>

{
  "Events": [
    <Your Events>
  ]
}
```

> [!NOTE]
> _The caller should provide either a Telemetry Key, OR an Entity Token. If both are provided, the Telemetry Key will be ignored, and the request will be processed as though one weren't provided._

## Limitations

The following restrictions apply when using Telemetry Keys:
* A title can configure up to five Telemetry Keys.
* Telemetry Keys can only be used to send telemetry events via the [WriteTelemetryEvents API](/rest/api/playfab/events/play-stream-events/write-telemetry-events). They can't be used to send PlayStream events via the [WriteEvents API](/rest/api/playfab/events/play-stream-events/write-events).
* Titles that have set their [Insights Retention](../legacy/insights/performance-retention.md) to be 
greater than 30 days can't configure Telemetry Keys at this time.

## Specifying Entities for Events

PlayFab events indicate the subject of the event via their `Entity` property. When you send telemetry using Entity Token authentication, this field is automatically populated with information about the signed-in entity. However, when you use a Telemetry Key, there's no entity that is signed-in. Telemetry events sent using a Telemetry Key are therefore not allowed to specify [PlayFab Built-In Entities](../../features/data/entities/available-built-in-entity-types.md) as their subject.

When using Telemetry Keys, you might still want to associate your telemetry events with some subject, for example, a custom player identifier used in your game. To do that, you can specify an *external* entity when forming the events in your client.

External entities are simply entities you specify with `type` set to `external`. They aren't formally part of PlayFab's entity system. They're only used in this context to provide a convenient mechanism to associate telemetry events with subject identifiers that make sense in your system.

To specify an external entity as the subject when forming the event in your code, you should:

1. Set the event's `Entity.type` field to `external` (case sensitive).
2. Set the event's `Entity.id` field to your custom subject identifier, up to a maximum of 64 characters in length.


Here's an example that shows how to send an event that specifies an external entity:

```HTTP
POST https://<titleId>.playfabapi.com/Event/WriteTelemetryEvents
X-TelemetryKey: <Your Telemetry Key>

{
  "Events": [
    {
      "EventNamespace": "custom.MyCustomEventNS",
      "Name": "MyCustomEvent",
      "Entity": {
        "type": "external",
        "id": "<CUSTOM_ID>"
      },
      "Payload": {
         "MyCustomPayloadField": "MyCustomValue",
         "MyCustomScoreValue": 12345
      }
    }
  ]
}
```

Once the event is ingested by PlayFab, it looks like this:

```JSON
"EventData": { 
    "SchemaVersion": "2.0.1", 
    "Id": "9bb3a96d0faa4e2d9f74b6c166a44676", 
    "Timestamp": "2022-09-27T19:42:21.7427679Z", 
    "FullName": { 
        "Namespace": "custom.MyCustomEventNS", 
        "Name": "MyCustomEvent" 
    }, 
    "Entity": { 
        "Type": "external",
        "Id": "<CUSTOM_ID>"
    }, 
    "EntityLineage": { 
        "namespace": "B85A7CFE2803D5A2",
        "title": "A5F3",
        "externalId": "<CUSTOM_ID>"
    }, 
    "OriginInfo": { 
        "Timestamp": "2022-09-27T19:42:21.1560000Z",
        "Key": "<NAME_OF_YOUR_TELEMETRY_KEY>"
    }, 
    "PayloadContentType": "Json", 
    "Payload": { 
        "MyCustomPayloadField": "MyCustomValue",
        "MyCustomScoreValue": 12345
    } 
} 
```

> [!NOTE]
> _The `OriginInfo.Key` property of the event will contain the name of the key that was used to ingest the event. If you have configured multiple Telemetry Keys, you can use this property to see which key was used to ingest the event._
