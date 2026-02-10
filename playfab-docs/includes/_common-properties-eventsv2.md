All V2 PlayStream events are formatted as JSON objects and most share the following common properties:

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|SchemaVersion|String|PlayStream event format version, following a semantic versioning scheme.|
|FullName|[Object](../api-references/events/data-types/fullnameobject.md)|Combination of the event name and event namespace to fully specify the event type.|
|Id|String|PlayFab-assigned unique identifier for this event.|
|Timestamp|DateTime|The time (in UTC) associated with this event.|
|Entity|[Object](../api-references/events/data-types/entityobject.md)|Details about the entity to which this event applies including Entity Id and Entity type.|
|Originator|[Object](../api-references/events/data-types/originatorobject.md)|Object describing the source and source type that initiated this event.| 
|PayloadContentType|String|Specifies the content of the event payload. Default is "JSON".|
|Origin Info|Object|Optional field containing info about events originating outside of PlayFab.|