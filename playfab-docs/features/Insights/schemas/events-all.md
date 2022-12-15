---
title: Getting Started with PlayFab Explorer
author: mckmoffatt
description: Illustrates how to use the Explorer feature.
ms.author: mcelliot
ms.date: 07/24/2019
ms.topic: article
ms.service: playfab
keywords: playfab, insights, schemas
ms.localizationpriority: medium
---

# About the events.all table

The events.all table is the destination for all incoming events regardless of the ingestion pipeline they come through. This table powers several features on Game Manager, including Event History and Explorer.

> [!NOTE]
> Many columns present are written as an artifact of our ingestion process and are in the process of being deprecated. Only those listed below are intended to remain. Other columns can and should be disregarded.

| Column Name                           | Data Type   | Description                                                                       |
| :-------------                        | :---------- | :-----------                                                                      |
| SchemaVersion                         | String      | Indicates the schema version assigned to the event by the PlayFab services. This number will increment when structural changes occur to the event.|
| FullName_NameSpace                    | String      | A namespace assigned to the event in ingestion. Designed to prevent collisions between title telemetry events and PlayFab events of the same name. Useful for grouping by domain. |
| FullName_Name                         | String      | The name of the event. |
| Entity_Id                             | String      | The unique id of the entity sending the event, i.e. title player, character, title, etc.|
| Entity_Type                           | String      | The type of entity sending the event, i.e. title player, character, title, etc. |
| EntityLineage_title                   | String      | The Title ID from which the event occurred. |
| EventData                             | Dynamic     | The original JSON payload of the event. |
| EventId                               | String      | A unique GUID identifier for each event. |
| Timestamp                             | DateTime    | The time the event was received by PlayFab. |
| EntityLineage_title_player_account    | String      | The title player id associated with the event. For more information, see [Available built-in entity types](../../data/entities/available-built-in-entity-types.md). |
| EntityLineage_master_player_account   | String      | The master player id associated with the event. For more information, see [Available built-in entity types](../../data/entities/available-built-in-entity-types.md). |
| EntityLineage_namespace               | String      | The namespace associated with the event. For more information, see [Available built-in entity types](../../data/entities/available-built-in-entity-types.md). |
