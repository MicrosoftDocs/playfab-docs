All V1 PlayStream events are formatted as JSON objects and share the following common properties:

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityId|String|The identifier for the entity (title, player, etc) to which this event applies.|
|EntityType|String|The type of entity (player, title, etc.) to which this event applies. If PlayFab is meant to take action on this entity, then the EntityType must be either 'player', 'character', or 'title'. It is required that any entity type that PlayFab does not currently parse should be prepended with a namespace (like 'com.mygame.guild') as PlayFab may begin to parse root entities at any time.|
|EventId|String|PlayFab-assigned unique identifier for this event.|
|EventName|String|The name of this event.|
|EventNamespace|String|The assigned namespacing for this event. For example: 'com.myprogram.ads'|
|Source|String|The name of the source of this PlayStream event; will be PlayFab if the event originated from us.|
|SourceType|[SourceType](../api-references/events/data-types/sourcetype.md)|The type of source of this event (PlayFab partner, other backend, or from the PlayFab API).|
|Timestamp|DateTime|The time (in UTC) associated with this event.|