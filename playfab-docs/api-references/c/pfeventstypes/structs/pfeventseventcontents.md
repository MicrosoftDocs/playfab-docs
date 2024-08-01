---
author: jasonsandlin
title: "PFEventsEventContents"
description: "PFEventsEventContents data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventsEventContents  

PFEventsEventContents data model.  

## Syntax  
  
```cpp
typedef struct PFEventsEventContents {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* eventNamespace;  
    const char* name;  
    const char* originalId;  
    time_t const* originalTimestamp;  
    PFJsonObject payload;  
    const char* payloadJSON;  
} PFEventsEventContents;  
```
  
### Members  
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the event (e.g. build number, external trace identifiers, etc.). Before an event is written, this collection and the base request custom tags will be merged, but not overriden. This enables the caller to specify static tags and per event tags.
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; PFEntityKey const*  
*may be nullptr*  
  
(Optional) Entity associated with the event. If null, the event will apply to the calling entity.
  
**`eventNamespace`** &nbsp; const char*  
*is null-terminated*  
  
The namespace in which the event is defined. Allowed namespaces can vary by API.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of this event.
  
**`originalId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The original unique identifier associated with this event before it was posted to PlayFab. The value might differ from the EventId value, which is assigned when the event is received by the server.
  
**`originalTimestamp`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time (in UTC) associated with this event when it occurred. If specified, this value is stored in the OriginalTimestamp property of the PlayStream event.
  
**`payload`** &nbsp; PFJsonObject  
  
(Optional) Arbitrary data associated with the event. Only one of Payload or PayloadJSON is allowed.
  
**`payloadJSON`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Arbitrary data associated with the event, represented as a JSON serialized string. Only one of Payload or PayloadJSON is allowed.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
